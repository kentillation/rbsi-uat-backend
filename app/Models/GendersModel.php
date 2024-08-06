<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GendersModel extends Model
{
    use HasFactory;

    protected $table = 't_cif_gender';
    protected $guarded = [];
    protected $fillable = ['id', 'gender'];
}
