<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MysqlModel extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table = 't_cif';

    protected $fillable = [
        'cid', 'type', 'first_name', 'middle_name', 'last_name', 'display_name', 'initial', 'title', 'customer_status', 
        'gender', 'civil_status', 'mobile1', 'mobile2', 'email', 'birthdate', 'cus_lang_pref', 'cus_tax_code', 'image_file', 
        'address_type', 'staff_or_not', 'tin', 'nationality', 'un_defined', 'entity', 'employment', 'created_at', 'updated_at', 
        'address_line1', 'address_line2', 'address_line3', 'address_line4', 'telephone', 'fax', 'postal_code'
    ];
}
