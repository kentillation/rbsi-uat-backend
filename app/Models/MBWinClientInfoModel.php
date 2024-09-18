<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MBWinClientInfoModel extends Model
{
    use HasFactory;
    protected $connection = 'sqlsrv';
    protected $table = 'T_CIF';
    protected $primaryKey = 'CID';
    public $incrementing = false;
    protected $keyType = 'string';
    protected $guarded = [];
    public $timestamps = false;
    public function address()
    {
        return $this->hasMany(MBWinAddressModel::class, 'Cid', 'CID');
    }
    public function relation()
    {
        return $this->hasMany(MBWinRelationModel::class, 'CID', 'CID');
    }
}
