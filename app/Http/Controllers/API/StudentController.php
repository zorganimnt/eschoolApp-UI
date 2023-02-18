<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Student;
use Illuminate\Http\Request;
use Validator;

class StudentController extends BaseController
{
    public function getStudentByCIN(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cin' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('CIN invalide...!', $validator->errors());
        }

        $getStudent = Student::where('student_cin', $request['cin'])->first();
        if($getStudent) {
            return $this->sendResponse($getStudent, null);
        } 
        return $this->sendError("Étudiant n'existe pas...!", $validator->errors());
    }

    public function getStudents(Request $request)
    {
        $success = Student::all();
        return $this->sendResponse($success, null);
    }
}