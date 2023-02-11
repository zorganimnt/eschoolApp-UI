<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Student;
use Illuminate\Http\Request;
use Validator;

class StudentController extends BaseController
{
    public function createStudent(Request $request)
    {
        $validator = Validator::make($request->all(), [
            
            'name' => 'required',
            'phone' => 'required',
            'university' => 'required',
            'etablisment' => 'required',
            'birthday' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Input invalide', $validator->errors());
        }

        $input = $request->all(); 
        $student = Student::create($input);
        //$success['token'] = $student->createToken('MyApp')->plainTextToken;
        $success= $input;
        return $this->sendResponse($success, 'Etudiant enregister avec success');
    }
}