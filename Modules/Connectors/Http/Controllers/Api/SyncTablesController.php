<?php

namespace Modules\Connector\Http\Controllers\Api;

use App\InvoiceLayout;
use App\InvoiceScheme;
use App\NotificationTemplate;
use App\Variation;
use App\VariationTemplate;
use App\VariationValueTemplate;
use App\Warranty;
use App\Transaction;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\Connector\Transformers\CommonResource;
use Illuminate\Support\Facades\DB;
use Modules\Connector\Transformers\NotificationTemplateResource;
use App\Utils\TransactionUtil;


class SyncTablesController extends ApiController
{



    public function variationsTemplates()
    {
        if (!request()->has('business_id')) {
            $msg = ['error' => 'Unauthenticated'];
            return json_encode($msg);
        }

        $business_id = request()->only('business_id');
        $variations_temp = VariationTemplate::where('business_id', $business_id)->get();
        foreach ($variations_temp as $var_temp) {
            $var_temp->variation_value_templates = VariationValueTemplate::where('variation_template_id', $var_temp->id)->get();
        }
        return CommonResource::collection($variations_temp);
    }

    public function warranty()
    {
        if (!request()->has('business_id')) {
            $msg = ['error' => 'Unauthenticated'];
            return json_encode($msg);
        }
        $business_id = request()->only('business_id');

        $warranty = Warranty::where('business_id', $business_id)->get();
        return CommonResource::collection($warranty);
    }

    public function notifications()
    {
        if (!request()->has('business_id')) {
            $msg = ['error' => 'Unauthenticated'];
            return json_encode($msg);
        }
        $business_id = request()->only('business_id');
        $notification = NotificationTemplate::where('business_id', $business_id)->get();
        return NotificationTemplateResource::collection($notification);
    }

    public function transaction()
    {
        $transaction_id = request()->only('transaction_id');
        return json_encode(DB::table('transactions')->where('id', $transaction_id)->first());
    }
}
