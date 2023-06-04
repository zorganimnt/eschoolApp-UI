<?php

namespace App\Http\Controllers\API;
use Illuminate\Http\JsonResponse;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;

class BaseController extends Controller
{
    /**
    * success response method.
    *
    * @return \Illuminate\Http\Response
    */

    public function sendResponse($result, $message) :  JsonResponse
    {
    	$response = [
            'success' => true,
            'message' => $message,
            'data'    => $result,
        ];
        return response()->json($response, 200);
    }

    /**
    * return error response.
    *
    * @return \Illuminate\Http\Response
    */

    public function sendError($error, $errorMessages = [], $code = 404) : JsonResponse
    {
    	$response = [

            'success' => false,
            'message' => $error,
        ];

        if (!empty($errorMessages)) {
            $response['data'] = $errorMessages;
        }
        return response()->json($response, $code);
    }
}