<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UndefModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_undef';
    protected $guarded = [];
    
}
