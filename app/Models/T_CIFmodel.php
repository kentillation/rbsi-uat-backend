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
    protected $fillable = [
        'CID', 'AccSerial', 'Type', 'Nid', 'Name1', 'Name2', 'Name3',  'Name4', 'TitleCode', 'Initials', 'GenderType', 'BirthDate', 'RegNumber', 'ContactPerson', 
        'Mobile1', 'Mobile2', 'Email1', 'Email2', 'RegisterDate', 'CIFCode1', 'CIFCode2', 'CIFCode3', 'CIFCode4', 'CIFCode5', 'CIFCode6', 'CIFCode7', 'CIFCode8', 'CIFCode9',
        'TaxCode', 'LnHist', 'LnMaxAmt', 'LastChangeDate', 'CivilStatusCode', 'DosriTF', 'DisplayName', 'LangType', 'Picture', 'StatusType', 'HASH', 'LocationCode', 
        'NextCmDate', 'cmFreqType', 'BR'
    ];

    public function temperature()
    {
        return $this->belongsTo(T_ADDRESSmodel::class);
    }
}
