<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */


    protected $fillable = [
        'email',
        'role',
        'name',
        'lastName',
        'phone',
        'password',


    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function apprenant()
    {
        return $this->hasOne(Apprenant::class);
    }

    public function parent()
    {
        return $this->hasOne(Parents::class);
    }

    public function formateur()
    {
        return $this->hasOne(Formateur::class);
    }

    public function formation()
    {
        return $this->hasOne(Formation::class);
    }

    public function cours()
    {
        return $this->hasOne(Cours::class);
    }
}