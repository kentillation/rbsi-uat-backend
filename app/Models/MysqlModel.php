<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MysqlModel extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table = 't_cif';

    // protected $fillable = [
    //     'cid', 'type', 'title', 'client_status', 'first_name', 'middle_name', 'last_name', 'initial', 'display_name', 'staff_or_not', 'tin', 
    //     'gender', 'civil_status', 'birthdate', 'mobile1', 'mobile2', 'email', 'nationality', 'address_line1', 'address_line2', 'address_line3', 'address_line4',  
    //     'postal_code', 'address_type', 'telephone', 'fax', 'undef',  'entity', 'employment', 'image_file', 'cus_lang_pref', 'tax_code', 
    // ];
}
