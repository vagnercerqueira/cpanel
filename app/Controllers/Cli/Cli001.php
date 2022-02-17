<?php

/*

	DESCRICAO: [CADASTRO CLIENTE]

	@AUTOR: Isaque Cerqueira

	DATA: 06/2021

*/



namespace App\Controllers\Cli;



use App\Controllers\BaseController;

use App\Models\Clientes\Clientes_Model;

use Datatables_server_side;
use mysqli;

class Cli001 extends BaseController

{

    private $sttUser = ['A' => 'Ativo', 'I' => 'Inativo'];

    public function __construct()

    {

        $this->tbs_crud  = ['form_clientes' => 'clientes'];

    }

    public function index()

    {

        $dias_prazo = ['' => 'Selecione...', '5' => 5, '10' => 10, '15' => 15];

        $dias_vence = ['' => 'Seleione...'];

        for ($i = 1; $i <= 30; $i++) {

            $dias_vence[$i] = $i;

        }



        $data = [

            "arquivo_js" => ['jquery.mask.min'],

            "arquivo_dataTable" => true,

            "status" => form_dropdown('STATUS', $this->sttUser, '', "id='STATUS' class='form-control form-control-sm' required"),

            "dia_vence" => form_dropdown('DIA_VENCE', $dias_vence, '', "id='DIA_VENCE' class='form-control form-control-sm' required"),

            "dias_prazo" => form_dropdown('DIAS_PRAZO', $dias_prazo, '', "id='DIAS_PRAZO' class='form-control form-control-sm' required"),

        ];

        $this->load_template($data);

    }

    public function DataTable()

    {

        $sql = "SELECT * FROM clientes";



        $dt = new Datatables_server_side([

            'tb' => 'clientes',

            'cols' => ["nome", "codigo_db", "codigo_cliente",  "dia_vence", "dias_prazo", "dt_criacao", "status", "logo"],

            'formata_coluna' => [

                5 => function ($col, $lin) {

                    $dt = date('d/m/Y H:i', strtotime($col));

                    return  $dt;

                },

                7 => function ($col, $lin) {

                    $img = "<img class='img-circle elevation-2' width=35 height=35 src='" . (base_url("assets/img/clientes/" . ($col != "" ? $col : 'user.PNG'))) . "'>";

                    return  $img;

                },

            ]

        ]);

        $dt->complexQuery($sql);

    }

    public function preIns($dados)

    {

        $id_usuario = session()->get('id_usuario');

        $dados['USUARIO_CRIACAO'] = $id_usuario;

        return $dados;

    }

    public function valida_campos()

    {

        $rules = [

            'CODIGO_DB'     => [
				'rules' =>  'alpha|required|min_length[3]|max_length[20]|is_unique[clientes.codigo_db,id,{ID}]|validaBancoDados[CODIGO_DB]',
				'errors' => [
                    'validaBancoDados' => 'Banco de dados ainda nao existe ou dados de acesso incorreto',
					'is_unique' => 'Ja existe banco de dados com este nome'
                ]
			],
			
			'CODIGO_CLIENTE'     => [
				'rules' =>  'numeric|required|min_length[4]|max_length[4]|is_unique[clientes.codigo_cliente,id,{ID}]',
				'errors' => [
					'is_unique' => 'Ja existe cliente com esse codigo'
                ]
			],			

            'NOME'       => "min_length[3]|max_length[100]|required",
            'STATUS'     => "required|alpha",
            'DIA_VENCE'  => 'required|numeric',
            'DIAS_PRAZO' => 'required|numeric',
            'EMAIL'      => 'valid_email|required|max_length[100]',
            'CELULAR'    => 'required|min_length[15]|max_length[15]',
        ];

        return $this->validate($rules);

    }

    public function grava_img($key)

    {

        $file = $this->request->getFile('DOC');

        if ($file->isValid()) {

            $nfile =   $key . "_" . date('dmYHis') . "." . $file->getClientExtension();

            $dir_img = FCPATH . "assets/img/clientes/" . $nfile;

            move_uploaded_file($_FILES['DOC']['tmp_name'], $dir_img);

            $user = new Clientes_Model();

            $user->update($key, ['logo' => $nfile]);

        }

    }

    public function excluiArq($nfile)

    {
        $fExist = FCPATH . "assets/img/clientes/" . $nfile;
        if (file_exists($fExist))
            unlink($fExist);
    }

    public function posIns($dados, $key)

    {
        $this->grava_img($key);
		$this->cria_tabelas_db($dados['CODIGO_DB']);		
    }
	public function cria_tabelas_db($banco){
		$dir_sql =  WRITEPATH . "/base_portal.sql";
        $conn = new mysqli("localhost","root","",$banco);
		//$conn = new mysqli($banco.".mysql.dbaas.com.br",$banco,"Evi@171195",$banco);
		
		$query = file_get_contents($dir_sql);
        $query = str_replace("\n", "", $query);
        $conn->multi_query($query);
	}

    public function posUpd($dados)
    {
        $this->grava_img($dados['ID']);
    }

}

