<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MBWinAddressModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'T_ADDRESS';
    protected $guarded = [];
    public $timestamps = false;
}
