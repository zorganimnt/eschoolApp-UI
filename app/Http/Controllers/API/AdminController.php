<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Employer;
use App\Models\User;
use Illuminate\Http\Request;
use Validator;

class AdminController extends BaseController
{
    // CRUD USER
    public function addEmployer(Request $request)
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

        $userInput['role'] = "Employer";
        $userInput['email'] = $request['email'];
        $userInput['name'] = $request['name'];
        $userInput['lastName'] = $request['lastName'];
        $userInput['phone'] = $request['phone'];
        $userInput['password'] = bcrypt($request['password']);
        $user = User::create($userInput);
        $employer_id['employer_id'] = $user->id;
        $employer = Employer::create($employer_id);
        if ($employer)
            return $this->sendResponse($user, 'Employer créer avec success');
        return $this->sendError("Erreur est servenue");

    }

    public function modifyUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
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
        $user = User::where('id', $request['user_id'])->first();

        if ($user) {
            $user->update([
                'name' => $request['name'],
                'lastName' => $request['lastName'],
                'phone' => $request['phone'],
                'email' => $request['email'],
            ]);
        } else {
            return $this->sendError('Erreur est servenue', $validator->errors());
        }

    }
    public function deleteUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Informations Incorrect', $validator->errors());
        }
        $user = User::where('id', $request['user_id'])->first();
        if ($user) {
            $user->delete();
            return $this->sendResponse([], "utilisateur supprimer");
        } else {
            return $this->sendError('Erreur est servenue', $validator->errors());
        }

    }
    public function getUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Informations Incorrect', $validator->errors());
        }
        if($request['user']=="all") {
            $success = User::all();
            return $this->sendResponse($success, null);
        } else {
            $user = User::where('id', $request['user'])->first();
            return $this->sendResponse($user, null);
        }

    }

    // CRUD FORMATION

    public function addFormation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'formation_name' => 'required',
            'formation_price' => 'required',
            'formation_formateur' => 'required',
            'formation_duree' => 'required',
            'formation_photo' => 'required'
        ]);

    }

    public function updateFormation(Request $request)
    {

    }
    public function deleteFormation(Request $request)
    {

    }

    public function getFormation(Request $request)
    {

    }

}