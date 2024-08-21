<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WatchListModel extends Model
{
    use HasFactory;
    protected $table = 'watchlist';
    protected $guarded = [];
}
