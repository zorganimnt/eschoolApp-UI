<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    use HasFactory;

    protected $fillable = [
        'note',
        'matiere',
        'prof',
        'student',
        'devoir'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
