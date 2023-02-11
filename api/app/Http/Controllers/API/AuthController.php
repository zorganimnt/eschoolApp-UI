<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;

class AuthController extends BaseController

{
    /**
    * Register api
    *
    * @return \Illuminate\Http\Response
    */

  
    // hedhi bech taaml register lel user 
    public function register(Request $request)
    {   
        // hedhi validator bech nodhmen li data li medithom lel serveur mouch null wale non acceptable
        // najmou nzidou validator okhrin 
        $validator = Validator::make($request->all(), [
            'cin' => 'required',
            'role' => 'required', 
            'password' => 'required',
           // 'accept_condition' => 'required'
         ]);

        // ken fama faute bech traja3lou msg erreur
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        
        // hnee aamlt user jdid
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['cin'] = $user->cin; 
        $success['role'] = $user->role; 
        $success['token'] =  $user->createToken('MyApp')->plainTextToken;

        // selon role mta3 user chbech ysir 
        if ($user->role == 'student') {
            return $this->sendResponse($success, 'Etudiant engregistrer avec success.');
        } else if  ($user->role == 'teacher') {
            return $this->sendResponse($success, 'Prof engregistrer avec success.');
        } else if ($user->role == 'parent') {
            return $this->sendResponse($success, 'Parent engregistrer avec success.');
        } else {
            return $this->sendResponse($success, 'Admin engregistrer avec success.');
        } 
    }

    /**
    * Login api
    *
    * @return \Illuminate\Http\Response
    */

    // hedhi bech ta3ml login selon CIN et Mot de passe 
    public function login(Request $request)
    {   
        // ken zouz cv bech y3adih sinon erreur 
        if(Auth::attempt(['cin' => $request->cin, 'password' => $request->password]))
        {   
            $user = Auth::user(); 
            $success['token'] =  $user->createToken('MyApp')->plainTextToken; 
            $success['role'] =  $user->role;
            return $this->sendResponse($success, 'Connexion valider avec success');
        } else { 
            return $this->sendError('Erreur.', ['error'=>'Erreur']);
        } 
    }
}