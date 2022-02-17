<?php

namespace App\Models\Clientes;

use App\Models\My_model;

class Clientes_Model extends My_model
{
    protected $table = 'clientes';
    protected $allowedFields = ['codigo_db', 'nome', 'alias', 'dt_criacao', 'usuario_criacao', 'status', 'logo'];
}