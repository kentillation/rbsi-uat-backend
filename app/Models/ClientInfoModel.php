<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientInfoModel extends Model
{
    use HasFactory;
    protected $table = 't_cif';
    protected $guarded = [];
}
