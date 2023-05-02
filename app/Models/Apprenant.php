<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Apprenant extends Model
{
    use HasFactory;

    protected $fillable = [
        'apprenant_id',
        'apprenant_date_birth',
        'apprenant_level_school',
        'apprenant_statut'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}