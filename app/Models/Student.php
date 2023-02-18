<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'student_parent',
        'student_name',
        'student_cin',
        'student_phone',
        'student_mail',
        'student_parent',
        'student_university',
        'student_degree',
        'student_speciality'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}