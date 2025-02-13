<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductTypeModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_product_type';
    protected $guarded = [];
}
