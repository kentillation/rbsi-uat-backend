<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaxCodeModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_tax_code';
    protected $guarded = [];
}
