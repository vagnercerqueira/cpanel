<?php

namespace App\Validation;

class CustomRules
{
	public function validaBancoDados(string $banco){
		$retorno = true;
		try{
			$con = mysqli_connect("localhost","root","",$banco);
			return true;
		}catch(\Exception $e){
			return false;
		}
	}
}