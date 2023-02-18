<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Parents extends Model
{
    use HasFactory;

    protected $fillable = [
        'parent_id',
        'parent_name',
        'parent_cin',
        'parent_phone',
        'parent_mail',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function parent()
    {
        return $this->belongsTo(Parents::class, 'student_parent', 'parent_cin');
    }
}