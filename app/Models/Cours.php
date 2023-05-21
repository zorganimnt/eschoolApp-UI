<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cours extends Model
{
    use HasFactory;
    protected $fillable = [
        'cours_id',
        'formation_title',
        'cours_title',
        'cours_description',
        'cours_support',
    ];

    // public function user()
    // {
    //     return $this->belongsTo(User::class);
    // }
}
