<?php

namespace Modules\Connector\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Modules\Connector\Transformers\CommonResource;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{

    public function locationPermission()
    {
        if (!request()->has('location_permission')) {
            $msg = ['error' => 'Unauthenticated'];
            return json_encode($msg);
        }
        $branch_permission = request()->only('location_permission');

        $permission = DB::table('permissions')->where('name', $branch_permission)->first();
        return json_encode($permission);
    }

    function defaultPermissions()
    {

        $defult_permissions = Permission::where('id', '<=', 81)->get(); // DB::table('permissions');
        return CommonResource::collection($defult_permissions);
    }
}
