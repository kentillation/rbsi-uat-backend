<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerStatusModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_customer_status';
    protected $guarded = [];
    protected $fillable = ['id', 'customer_status'];
}
