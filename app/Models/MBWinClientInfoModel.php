<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MBWinClientInfoModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'T_CIF';
    protected $guarded = [];
    public $timestamps = false;
}
