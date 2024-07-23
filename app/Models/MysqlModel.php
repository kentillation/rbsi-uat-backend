<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MysqlModel extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table = 't_cif';

    protected $fillable = [
        'name1', 'name2', 'name3'
    ];
}
