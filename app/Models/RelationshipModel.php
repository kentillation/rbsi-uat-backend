<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelationshipModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_relationship';
    protected $guarded = [];
}
