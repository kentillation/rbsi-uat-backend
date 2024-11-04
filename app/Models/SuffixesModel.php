<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuffixesModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_suffixes';
    protected $guarded = [];
}
