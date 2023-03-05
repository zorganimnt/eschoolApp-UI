<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prof extends Model
{
    use HasFactory;
    protected $fillable = [
        'prof_id',
        'prof_cin',
        'prof_name',
        'prof_phone',
        'prof_mail',
        'prof_password',
        'prof_matiere',
        'prof_classe',
    ];
}
