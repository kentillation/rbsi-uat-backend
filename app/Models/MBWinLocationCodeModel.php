<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MBWinLocationCodeModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'T_LocMaster';
    protected $guarded = [];
}
