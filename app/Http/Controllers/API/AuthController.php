<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Parents;
use App\Models\Student;
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
    public function register(Request $request)
    {   


        // tawa nlawjou chkounou l user li hat cooredoné bech najemou nzidouh fi table li ynesbou 
        if ($request['role'] == 'student') {
            $validator = Validator::make($request->all(), [
                'cin' => 'required|digits:8',
                'role' => 'required|alpha', 
                'name' => 'required|alpha|min:3',
                'phone' => 'required|digits:8',
                'mail' => 'required|email',
                'university' => 'required|alpha',
                'degree' => 'required',
                'speciality' => 'required',
                'password' => 'required|min:6',
             ]);
            // check rules li l fou9 ken ghalta ykharjou direct b erreur
            if ($validator->fails()) {
                return $this->sendError('Informations incorrect...!', $validator->errors());       
            }
            // check student mawjoud wale; ken mawjoud nafes cin raw inscrit men 9bal
            $isStudentExist = User::where('cin', $request['cin'])->first();
            if ($isStudentExist) {
                return $this->sendError('CIN déja existe...!', $validator->errors()); 
            } 
            // user table
            $authInput['cin'] = $request['cin'];
            $authInput['role'] = $request['role'];
            $authInput['password'] = bcrypt($request['password']);
            $user = User::create($authInput);

            // student table 
            $studentInput['student_id']= $user['id'];
            $studentInput['student_parent'] = "0";
            $studentInput['student_cin'] = $request['cin'];
            $studentInput['student_name'] = $request['name'];
            $studentInput['student_phone'] = $request['phone'];
            $studentInput['student_mail'] = $request['mail'];
            $studentInput['student_university'] = $request['university'];
            $studentInput['student_degree'] = $request['degree'];
            $studentInput['student_speciality'] = $request['speciality'];
            // b3athna data lel table students
            Student::create($studentInput);
            $success= $studentInput; 
            $success['token'] =  $user->createToken('MyApp')->plainTextToken;
            return $this->sendResponse($success, 'Étudiant enregistrer avec succées...!');
        }


        // parent ken hat coordonnés chnouwa yssirrr
        if ($request['role'] == 'parent') {
            $validator = Validator::make($request->all(), [
                'cin' => 'required',
                'role' => 'required', 
                'name' => 'required|regex:/^[a-zA-Z]+$/',
                'phone' => 'required',
                'mail' => 'required',
                'password' => 'required',
             ]);
            if ($validator->fails()) {
                return $this->sendError('Informations incorrect...!', $validator->errors());       
            }
             // check parent mawjoud wale; ken mawjoud nafes cin raw inscrit men 9bal
             $isParentExist = User::where('cin', $request['cin'])->first();
             if ($isParentExist) {
                 return $this->sendError('CIN déja existe...!', $validator->errors()); 
             } 
            // user data handle
            $authInput['cin'] = $request['cin'];
            $authInput['role'] = $request['role'];
            $authInput['password'] = bcrypt($request['password']);
            $user = User::create($authInput);

            // parent data handle
            $parentInput['parent_id']= $user['id'];
            $parentInput['parent_cin'] = $request['cin'];
            $parentInput['parent_name'] = $request['name'];
            $parentInput['parent_phone'] = $request['phone'];
            $parentInput['parent_mail'] = $request['mail'];

            // ab3eeethli data mta3 parent
            Parents::create($parentInput);
            $success= $parentInput; 
            $success['token'] =  $user->createToken('MyApp')->plainTextToken;
            return $this->sendResponse($success, 'Parent enregistrer avec succées...!');
        }

        return $this->sendError("Role non acceptable ...!");       
        // 
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