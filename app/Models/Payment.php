<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;
    protected $fillable = [
        'payment_id',
        'payment_date',
        'payment_state',
        'payment_amount',
        'formation_id',
        'apprenant_id',
        'parent_id',
    ];
}