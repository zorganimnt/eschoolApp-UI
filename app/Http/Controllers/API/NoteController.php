<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Note;
use Validator;


class NoteController extends BaseController
{
    public function getNote(){
        $success = Note::all();
        return $this->sendResponse($success, null);
    }

    public function addNote(Request $request)
    {   


        // tawa nlawjou chkounou l user li hat cooredoné bech najemou nzidouh fi table li ynesbou 

            $validator = Validator::make($request->all(), [
                'devoir' => 'required',
                'matiere' => 'required', 
                'student' => 'required',
                'note' => 'required',
                'prof' => 'required',
             
             ]);
            // check rules li l fou9 ken ghalta ykharjou direct b erreur
            if ($validator->fails()) {
                return $this->sendError('Informations incorrect...!', $validator->errors());       
            }
      
            // user table
            $noteInput['devoir'] = $request['devoir'];
            $noteInput['matiere'] = $request['matiere'];
            $noteInput['student'] = $request['student'];
            $noteInput['note'] = $request['note'];
            $noteInput['prof'] = $request['prof'];
            $note = Note::create($noteInput); 

          
            $success= $noteInput; 
            return $this->sendResponse($success, 'note ajouter avec succées...!');
        

        }
      
}
