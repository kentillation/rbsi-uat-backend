<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TitlesModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_titles';
    protected $guarded = [];
}
