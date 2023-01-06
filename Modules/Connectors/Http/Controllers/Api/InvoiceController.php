<?php

namespace Modules\Connector\Http\Controllers\Api;

use App\InvoiceLayout;
use App\InvoiceScheme;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\Connector\Transformers\CommonResource;
use Modules\Connector\Transformers\InvoiceLayoutResource;


class InvoiceController extends ApiController
{
    public function schemesIndex()
    {
        if (!request()->has('business_id')) {
            $msg = ['error' => 'Unauthenticated'];
            return json_encode($msg);
        }

        $business_id = request()->only('business_id');
        $schemes = InvoiceScheme::where('business_id', $business_id)->get();
        return CommonResource::collection($schemes);
    }

    public function layoutsIndex()
    {
        if (!request()->has('business_id')) {
            $msg = ['error' => 'Unauthenticated'];
            return json_encode($msg);
        }

        $business_id = request()->only('business_id');
        $layouts = InvoiceLayout::where('business_id', $business_id)->get();
        return InvoiceLayoutResource::collection($layouts);
    }
}
