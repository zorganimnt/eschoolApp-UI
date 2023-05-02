<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Formateur extends Model
{
    use HasFactory;

    protected $fillable = [
        'formateur_id',
        'formateur_speciality',
        'formateur_cv',
        'formateur_statut'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
