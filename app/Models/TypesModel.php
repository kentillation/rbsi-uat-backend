<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypesModel extends Model
{
    use HasFactory;

    protected $table = 't_cif_types';
    protected $guarded = [];
    protected $fillable = ['id', 'type'];
}
