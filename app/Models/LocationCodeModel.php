<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationCodeModel extends Model
{
    use HasFactory;
    protected $table = '_location_code';
    protected $guarded = [];
}
