<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SqlsrvModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'T_CIF';

    protected $fillable = [
        'Name1', 'Name2', 'Name3'
    ];
}
