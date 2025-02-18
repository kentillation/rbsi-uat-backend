<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MBWinClientAccModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'T_RELACC';
    protected $guarded = [];
    public $timestamps = false;
}
