<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\T_ADDRESSmodel;

class T_CIFmodel extends Model
{
    use HasFactory;
    protected $table = 'T_CIF';
    protected $guarded = [];
    // protected $fillable = ['name1', 'name2', 'name3', 'created_at', 'updated_at'];
}
