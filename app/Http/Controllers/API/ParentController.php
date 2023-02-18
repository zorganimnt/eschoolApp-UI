<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Parents;
use App\Models\Student;
use Illuminate\Http\Request;
use Validator;

class ParentController extends BaseController
{
    public function getParentByCIN(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cin' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('CIN invalide...!', $validator->errors());
        }

        $getStudent = Parents::where('parent_cin', $request['cin'])->first();
        if ($getStudent) {
            return $this->sendResponse($getStudent, null);
        }
        return $this->sendError("Parent n'existe pas...!", $validator->errors());
    }

    public function getParents(Request $request)
    {
        $success = Parents::all();
        return $this->sendResponse($success, null);
    }


    public function getChildren(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'parent_cin' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Informations incorrect...!', $validator->errors());
        }

        $parent = $request['parent_cin'];
        $children = Student::where('student_parent', $parent)->get();
        return $this->sendResponse($children, null);

    }


    public function getChildByCIN(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'parent_cin' => 'required',
            'student_cin' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Informations incorrect...!', $validator->errors());
        }

        $parent = $request['parent_cin'];
        $student = $request['student_cin'];
        $child = Student::where('student_parent', $parent)->where('student_cin', $student)->first();
        return $this->sendResponse($child, "weldi esmou " . $child->student_name);

    }

    public function addChildByCIN(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'child_cin' => 'required',
        ]);

        $student = Student::where('student_cin', $request['child_cin']);
        if ($student) {
            $parent = Parents::where('parent_cin', $request['parent_cin'])->first();
            if ($parent) {
                $student->update(['student_parent' => $parent['parent_cin']]);

                return $this->sendResponse($student, "Votre enfant ajouté avec succéess...!");
            } else {
                return $this->sendError("Parent n'existe pas...!", $validator->errors());
            }
        } else {
            return $this->sendError("Étudiant n'existe pas...!", $validator->errors());
        }
    }

    public function deleteChildByCIN(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'child_cin' => 'required',
        ]);

        $student = Student::where('student_parent', $request['parent_cin']);
        if ($student) {
            $parent = Parents::where('parent_cin', $request['parent_cin'])->first();
            if ($parent) {
                $student->update(['student_parent' => "0"]);
                return $this->sendResponse($student, "Votre enfant a supprimé avec succées...!");
            } else {
                return $this->sendError("Parent n'existe pas...!", $validator->errors());
            }
        } else {
            return $this->sendError("Votre enfant n'existe pas...!", $validator->errors());
        }
    }

}