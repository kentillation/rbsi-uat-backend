<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmploymentModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_employment';
    protected $guarded = [];
}
