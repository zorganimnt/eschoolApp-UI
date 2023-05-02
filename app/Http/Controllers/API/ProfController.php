<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Parents;
use App\Models\Prof;
use Illuminate\Http\Request;
use Validator;

class ProfController extends Controller
{
    public function getProf(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cin' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('CIN invalide...!', $validator->errors());
        }
        if ($request ['cin']=='all') {
            $prof = Prof::all(); 
            return $this->sendResponse($prof, null);
        }
        $getprof = Prof::where('prof_cin', $request['cin'])->first();
        if ($getprof) {
            return $this->sendResponse($getprof, null);
        }
        return $this->sendError("Professeur n'existe pas...!", $validator->errors());
    }
    public function addProfByCIN(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'prof_cin' => 'required|digits:8',
            'name' => 'required',
            'phone' => 'required|digits:8',
            'mail' => 'required|email',
            'password' => 'required',
            'matiere' => 'required', 
            'classe' => 'required',
        ]);
        $isProfExist = Prof::where('cin', $request['cin'])->first();
        if ($isProfExist) {
            return $this->sendError('CIN déja existe...!', $validator->errors()); 
        }
        $profInput['cin'] = $request['cin'];
        $profInput['name_prof'] = $request['name_prof'];
        $profInput['phone_prof'] = $request['phone_prof'];
        $profInput['mail_prof'] = $request['mail_prof'];
        $profInput['password'] = bcrypt($request['password']);
        $profInput['matiere_prof'] = $request['matiere_prof'];
        $profInput['classe_prof'] = $request['classe_prof'];
        $prof = Prof::create($profInput);
        return $this->sendResponse($prof, 'Professeur ajouter avec succés');
    }
    public function deleteProfByCIN(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'prof_cin' => 'required',
        ]);

        $student = Prof::where('student_parent', $request['parent_cin']);
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
