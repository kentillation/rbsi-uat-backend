<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MBWinMessageRequestModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'IBMessageRequest';
    protected $primaryKey = 'messageId';
    public $incrementing = false;
    protected $keyType = 'string';
    protected $guarded = [];
    public $timestamps = false;
}
