<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class T_ADDRESSmodel extends Model
{
    use HasFactory;
    protected $table = 'T_ADDRESS';
    protected $guarded = [];
    protected $fillable = [
        'CID', 'AddressType', 'Line1', 'Line2', 'Line3', 'Line4', 'PostalCode',  'Phone1', 'Phone2', 'Phone3', 'Fax1', 'Fax2', 'PrimaryTF', 'MailingTF', 'TempMailTF', 'StartDate', 'EndDate', 'MailCode', 'HASH', 'BR', 'Addr_Recid'
    ];
}
