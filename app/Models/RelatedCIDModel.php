<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelatedCIDModel extends Model
{
    use HasFactory;
    protected $table = 't_cif_rel_cid';
    protected $guarded = [];
}
