<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerInfoModel extends Model
{
    use HasFactory;
    protected $table = 'dbo.T_CIF';
    protected $guarded = [];
    protected $fillable = [
        'CID', 'AccSerial', 'Type', 'Nid', 'Name1', 'Name2', 'Name3',  'Name4', 'TitleCode', 'Initials', 'GenderType', 'BirthDate', 'RegNumber', 'ContactPerson', 'Mobile1',
    ];
}
