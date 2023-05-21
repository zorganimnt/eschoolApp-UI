<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Formation extends Model
{
    use HasFactory;
    protected $fillable = [
        'formation_id',
        'formation_title',
        'formation_category',
        'formation_price',
        'formation_formateur',
        'formation_duree', 
        'formation_picture',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
}
