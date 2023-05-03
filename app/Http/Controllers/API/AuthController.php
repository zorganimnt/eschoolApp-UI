<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Formateur;
use App\Models\Instructor;
use App\Models\Parents;
use App\Models\Apprenant;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\ModelNotFoundException as Exception;

use Validator;

class AuthController extends BaseController
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */


    // hedhi bech taaml register lel user 

    public function registerUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role' => 'required|alpha',
            'name' => 'required|alpha|min:3',
            'lastName' => 'required|alpha|min:3',
            'phone' => 'required|digits:8',
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);
        if ($validator->fails()) {
            return $this->sendError('Informations Incorrect', $validator->errors());
        }

        $isExist = User::where('email', $request['email'])->first();
        if ($isExist) {
            return $this->sendError('Utilisateur déja existe', $validator->errors());
        }

        $userInput['role'] = $request['role'];
        $userInput['email'] = $request['email'];
        $userInput['name'] = $request['name'];
        $userInput['lastName'] = $request['lastName'];
        $userInput['phone'] = $request['phone'];
        $userInput['password'] = bcrypt($request['password']);
        $user = User::create($userInput);
        if ($user)
            return $this->sendResponse($user, 'Utilisateur enregistrer avec success');
        return $this->sendError("Erreur est servenue");

    }
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Informations Incorrect', $validator->errors());
        }
        $userByID = User::where('id', $request['user_id'])->first();
        $role = $userByID->role;
        switch ($role) {
            // APPRENANT REGISTER
            case 'Apprenant':

                // VALIDATE APPRENANT INPUT
                $validator = Validator::make($request->all(), [

                    'apprenant_date_birth' => 'required',
                    'apprenant_level_school' => 'required',
                ]);
                if ($validator->fails()) {
                    return $this->sendError('Informations Incorrect', $validator->errors());
                }
                $isExist = Apprenant::where('apprenant_id', $request['apprenant_id'])->first();
                if ($isExist) {
                    return $this->sendError('Apprenant déja existe', $validator->errors());
                }
                // SEND APPRENANT INPUT
                $apprenantInput['apprenant_id'] = $request['user_id'];
                $apprenantInput['apprenant_date_birth'] = $request['apprenant_date_birth'];
                $apprenantInput['apprenant_level_school'] = $request['apprenant_level_school'];
                $apprenantInput['apprenant_statut'] = $request['apprenant_statut'];
                $apprenant = Apprenant::create($apprenantInput);
                if ($apprenant) {
                    return $this->sendResponse($apprenant, 'Apprenant enregistrer avec success');
                } else {
                    return $this->sendError('Erreur est servenue', null);
                }
            // PARENT REGISTER
            case 'Parent':

                // VALIDATE PARENT INPUT
                $validator = Validator::make($request->all(), [
                    'user_id' => 'required',
                    'child_email' => 'required',
                ]);
                if ($validator->fails()) {
                    return $this->sendError('Informations parent incorrect', $validator->errors());
                }
                $isExist = User::where('email', $request['child_email'])->first();
                if (!$isExist) {
                    return $this->sendError('Enfant non trouvale', null);
                }
                // SEND PARENT INPUT
                $parentInput['parent_id'] = $request['user_id'];
                $parentInput['parent_child_email'] = $request['child_email'];
                $parent = Parents::create($parentInput);
                if ($parent) {
                    return $this->sendResponse($parent, 'Parent enregistrer avec success');
                } else {
                    return $this->sendError('Erreur est servenue', null);
                }

            // FORMATEUR REGISTER
            case 'Formateur':
                // VALIDATOR FORMATER INPUT
                $validator = Validator::make($request->all(), [
                    'formateur_speciality' => 'required',
                    'formateur_cv' => 'required',
                ]);
                if ($validator->fails()) {
                    return $this->sendError('INVALID CREDENTIALS', $validator->errors());
                }

                // SEND FORMATER INPUT
                $formateurInput['formateur_id'] = $request['user_id'];
                $formateurInput['formateur_speciality'] = $request['formateur_speciality'];
                $formateurInput['formateur_cv'] = $request['formateur_cv'];
                $formateur = Formateur::create($formateurInput);
                if ($formateur) {
                    return $this->sendResponse($formateur, 'Formateur enregistrer avec success');
                } else {
                    return $this->sendError('Erreur est servenue', null);
                }
            default:
                return $this->sendError('INVALID ROLE', null);
        }
    }

    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */

    public function login(Request $request)
    {
        try {
            if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                $user = Auth::user();
                $success['token'] = $user->createToken('MyApp')->plainTextToken;
                $success['role'] = $user->role;
                $success['id'] = $user->id; 
                return $this->sendResponse($success, 'Connexion valider avec success');
            }
        } catch (Exception $e) {
            return $this->sendError('Erreur est servenue', $e);
        }

        return $this->sendError('Erreur est servenue', null);
    }
}