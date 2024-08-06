<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CivilStatusModel extends Model
{
    use HasFactory;

    protected $table = 't_cif_civil_status';
    protected $guarded = [];
    protected $fillable = ['id', 'civil_status'];
}
