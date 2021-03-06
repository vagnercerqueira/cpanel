<?php

namespace App\Controllers;

use App\Models\Usuarios\Parametro_sistemaModel;
use App\Models\Auditar_log_Model;
use App\Models\Usuarios\Senha_emailModel;
use App\Models\Usuarios\UsuariosModel;
//use App\Models\Usuarios\Pedidos_cad_usuariosModel;
use CodeIgniter\Controller;

class Login extends Controller

{

    public function index()

    {
        $metodo = $this->request->getMethod();
        if ($metodo !== "post") {
            return view("login");
        } else {

            $arr_valida = ['valido' => false, 'error' => ""];
            $dPost = $this->request->getPost();
            $rules = [
                'usuario' => 'required|max_length[20]|min_length[3]',
                'senha' => 'required|min_length[3]|max_length[20]',
            ];

            if (!$this->validate($rules)) {
                $arr_valida['error'] = $this->validator->listErrors();
            } else {
                $db = db_connect();

                $sql = "SELECT 	A.id id_usuario ,A.usuario, A.senha,A.nome, A.status, A.foto, A.grupo,
								B.descricao nome_grupo, B.home, B.superusuario, C.senha_temp, B.formsearch,
                                ( SELECT count(*)+1 FROM ".PREFIXO_TB."auditar_log L WHERE L.id_user=A.id ) qtd_acessos
                        FROM ".PREFIXO_TB."usuarios A 
                        INNER JOIN ".PREFIXO_TB."grupo_usuario B ON B.id=A.grupo
                        LEFT JOIN ".PREFIXO_TB."senha_email C ON C.usuario=A.id AND C.status='A'
                        WHERE A.usuario = ? ";
                
                $usu = $db->query($sql, [$dPost['usuario']])->getResultArray();

                if (count($usu) > 0) {
                    if ((password_verify($dPost['senha'], $usu[0]['senha'])) || (password_verify($dPost['senha'], $usu[0]['senha_temp']))) {
                        if ($usu[0]['status'] != 'A') {
                            $arr_valida['error'] = "Usuario nao esta ativo, fale com o responsavel!!!";
                        } else {
                            $arr_valida['valido'] = true;
                            if (password_verify($dPost['senha'], $usu[0]['senha_temp'])) {
                                $usuMod =  new UsuariosModel();
                                $usuMod->update($usu[0]['id_usuario'], ['senha' => $dPost['senha']]);
                            }
                            $senhaEmail = new Senha_emailModel();
                            $senhaEmail->where(['usuario' => $usu[0]['id_usuario']])->set(['status' => 'I'])->update();

                            $ses = session();
                            unset($usu[0]['senha'], $usu[0]['senha_temp'], $usu[0]['status']);

                            $ddUser = array_merge(["logado" => true], $usu[0]);
                            $ses->set($ddUser);
							
							if($usu[0]['qtd_acessos'] > 1 ){
								$auditaMod = new Auditar_log_Model();
								$auditaMod->insert(['tb' => 'usuarios', 'acao' => 'login']);
							}
                        }
                    } else {
                        $arr_valida['error'] = 'Senha esta incorreta';
                    }
                } else {
                    $arr_valida['error'] = "Usuario incorreto";
                }
            }


            if ($arr_valida['valido']) {
                if ($usu[0]['qtd_acessos'] == 1) {
                }
                return redirect()->to("home/" . $usu[0]['home']);
            } else {
                session()->setFlashdata('error', $arr_valida['error']);
                session()->setFlashdata('usuario', $dPost['usuario']);
                session()->setFlashdata('senha', $dPost['senha']);
                return redirect()->to('login');
            }
        }
    }

    /*************BLOCO PARA ENVIAR SENHA ALTERNATIVA VIA EMAIL */

    function request_new_pass_viaEmail()
    {
        if ($this->request->getMethod() == "post")
            print('Voce nao possui permissao para acessar essa area!!!');
        else
            return view('usu/request_new_pass_viaEmail');
    }

    function send_pass()
    {
        $metodo = $this->request->getMethod();

        if ($metodo == "post") {
            $arr_valida = ['valido' => false, 'msg' => ""];
            $rules = [
                'email' => 'required|valid_email',
            ];
            if (!$this->validate($rules)) {

                $arr_valida['msg'] = $this->validator->listErrors();
            } else {

                $usuMod =  new UsuariosModel();

                $usu = $usuMod->where(['email' => $this->request->getPost('email')])->findAll();

                if (count($usu) > 0) {

                    if ($usu[0]['status'] != 'A') {
                        $arr_valida['msg'] = 'Usuario Inativo fale com o responsavel';
                    } else {
                        $pwtDec =  str_shuffle(date('s') . 'aYs-@!#' . $usu[0]['id']);
                        $pwt = password_hash($pwtDec, PASSWORD_DEFAULT);
                        $msg = 'Ola ' . $usu[0]['usuario'] . ', foi solicitado uma nova senha para acesso no sistema arquivar. Senha: ' . $pwtDec;
                        $send = $this->send_email($usu[0]['email'], 'Requisicao senha sistema arkivar', $msg);
                        if ($send['sucesso']) {
                            $senhaEmail = new Senha_emailModel();
                            $senhaEmail->where(['usuario' => $usu[0]['id']])->set(['status' => 'I'])->update();
                            $arrIns = ['usuario' => $usu[0]['id'], 'senha_temp' => $pwt, 'status' => 'A'];
                            $senhaEmail->insert($arrIns);
                            $auditaMod = new Auditar_log_Model();
                            $auditaMod->insert(['tb' => 'usuarios', 'acao' => 'reset_senha', 'id_user' => $usu[0]['id'], 'id_aplicacao' => 'login/request_new_pass_viaEmail']);
                        }
						$arr_valida = $send;
                    }
                } else {
                    $arr_valida['msg'] = 'Email nao existe!!!';
                }
            }

            echo json_encode($arr_valida);
        } else {

            print('Voce nao possui permissao para acessar essa area!!!');
        }
    }

    public function send_email($to, $subject = null, $msg = null)
    {
		$parSis = new Parametro_sistemaModel();
        $from = $parSis->find()[0]['email_suporte'];
		if($parSis->find()[0]['envia_email_usuario'] == 'S'){
			$dPost = $this->request->getPost();
			$headers = "From: {$from}" . "\r\n" . 'X-Mailer: PHP/' . phpversion();
			if (@mail($to, $subject, $msg, $headers)) {
				$arr = ['sucesso' => true, 'msg' => "Email enviado com sucesso"];				
			} else {
				$arr = ['sucesso' => false, 'msg' => "Erro no envio: " . error_get_last()['message']];
			}
		}else{
			$arr = ['sucesso' => false, 'msg' => "Erro no envio: Sistema nao permite Envio de email"];
		}
		return $arr;
    }

    /*************FIM DO BLOCO PARA ENVIAR SENHA ALTERNATIVA VIA EMAIL */

    /*************BLOCO PARA ENVIAR SENHA ALTERNATIVA VIA EMAIL */

/*     function request_new_register()

    {
        if ($this->request->getMethod() == "post")
            print('Voce nao possui permissao para acessar essa area!!!');
        else
            return view('usu/request_new_register');
    }

   function send_request_register()

    {
        if ($this->request->getMethod() == "get") {
            print('Voce nao possui permissao para acessar essa area!!!');
        } else {
            $arr_valida = ['sucesso' => false, 'msg' => ""];
            $dadosPost = $this->request->getPost();

            $rules = [
                'nome' => 'required|max_length[50]',
                'email' => 'required|valid_email|max_length[50]',
                'senha'     => 'required|max_length[10]',
                'confirma_senha' => 'required|matches[senha]',
            ];

            if (!$this->validate($rules)) {

                $arr_valida['msg'] = $this->validator->listErrors();
            } else {

                $usuMod =  new UsuariosModel();
                $usu = $usuMod->where(['email' => $dadosPost['email']])->findAll();

                if (count($usu) > 0) {
                    $arr_valida['msg'] = "Email ja cadastrado!!!";
                } else {

                    $requser = new Pedidos_cad_usuariosModel();
                    $arrIns = ['nome' => $dadosPost['nome'], 'email' => $dadosPost['email'], 'senha' => $dadosPost['senha']];
                    $pedidos = $requser->where(['email' => $dadosPost['email'], 'status' => 'A'])->findAll();
                    if (count($pedidos) > 0) {

                        if (substr($pedidos[0]['dt_pedido'], 0, 10) == date("Y-m-d")) {

                            $arr_valida['msg'] = "Voce ja solicitou registro hoje aguarde!!!";
                        } else {

                            $requser->insert($arrIns);

                            $arr_valida = ['sucesso' => true, 'msg' => "Seu pedido de cadastro foi feito, aguarde!!!"];
                        }
                    } else {

                        $requser->insert($arrIns);

                        $arr_valida = ['sucesso' => true, 'msg' => "Seu pedido de cadastro foi feito, aguarde!!!"];
                    }
                }
            }

            echo json_encode($arr_valida);
        }
    }*/
    /*************FIM DO BLOCO PARA ENVIAR SENHA ALTERNATIVA VIA EMAIL */
    function altera_senha()
    {
        $metodo = $this->request->getMethod();
        if (!session()->get('logado') || $metodo == 'get') {
            echo "Pagina nao existe";
        } else {
            $dPost = $this->request->getPost();
            $rules = [
                'senha_atual' => 'required|max_length[20]|min_length[3]',
                'senha_nova' => 'required|max_length[20]|min_length[3]',
                'confirma_senha_nova' => 'required|max_length[20]|matches[senha_nova]',
            ];

            $arr_valida = ['sucesso' => false, 'msg' => ""];

            if (!$this->validate($rules)) {
                $arr_valida['msg'] = $this->validator->getErrors();
            } else {

                $usuMod =  new UsuariosModel();
                $usu = $usuMod->where(['id' => session()->get('id_usuario')])->findAll();

                if (!password_verify($dPost['senha_atual'], $usu[0]['senha'])) {
                    $arr_valida['msg'] = ['senha_atual' => 'Senha atual esta incorreta'];
                } else {
                    if (password_verify($dPost['senha_nova'], $usu[0]['senha'])) {
                        $arr_valida['msg'] = ['senha_nova' => 'Senha Nova nao pode ser igual a anterior!!!'];
                    } else {
                        $usuMod->update(session()->get('id_usuario'), ['senha' => $dPost['senha_nova']]);
                        $aff = $usuMod->affectedRows();
                        if ($aff > 0) {
                            $arr_valida = ['sucesso' => true, 'msg' => "Senha Altera com sucesso!!!"];
                            $auditaMod = new Auditar_log_Model();
                            $auditaMod->insert(['tb' => 'usuarios', 'acao' => 'altera_senha']);
							session()->destroy();
                            $this->send_email($usu[0]['email'], 'Voce alterou sua senha no sistema arkivar para: ', $dPost['senha_nova']);
                        } else {
                            $arr_valida['msg'] = 'Erro no banco ao alterar a senha!!!';
                        }
                    }
                }
            }
            echo json_encode($arr_valida);			
        }
    }

    public function logout()
    {
        session()->destroy();
        return redirect()->to(base_url());
    }
}
