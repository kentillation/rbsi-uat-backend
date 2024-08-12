<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientStatusModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_client_status';
    protected $guarded = [];
}
