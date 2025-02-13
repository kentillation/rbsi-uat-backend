<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OwnershipTypeModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_ownership_type';
    protected $guarded = [];
}
