<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppTypeModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_app_types';
    protected $guarded = [];
}
