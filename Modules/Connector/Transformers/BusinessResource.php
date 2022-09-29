<?php

namespace Modules\Connector\Transformers;

use Illuminate\Http\Resources\Json\Resource;

class BusinessResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     * @return array
     */
    public function toArray($request)
    {
        $array = parent::toArray($request);
        // $array['keyboard_shortcuts'] = !empty($array['keyboard_shortcuts']) ? json_decode($array['keyboard_shortcuts'], true) : null;
        $array['weighing_scale_setting'] = !empty($array['weighing_scale_setting']) ? json_encode($array['weighing_scale_setting']) : null;
        $array['enabled_modules'] = !empty($array['enabled_modules']) ? json_encode($array['enabled_modules']) : null;
        $array['ref_no_prefixes'] = !empty($array['ref_no_prefixes']) ? json_encode($array['ref_no_prefixes']) : null;
        $array['email_settings'] = !empty($array['email_settings']) ? json_encode($array['email_settings']) : null;
        $array['sms_settings'] = !empty($array['sms_settings']) ? json_encode($array['sms_settings']) : null;
        $array['common_settings'] = !empty($array['common_settings']) ? json_encode($array['common_settings']) : null;





        // $array['custom_labels'] = !empty($array['custom_labels']) ? json_decode($array['custom_labels'], true) : null;
        // $array['pos_settings'] = !empty($array['pos_settings']) ? json_decode($array['pos_settings'], true) : null;





        // $array['logo'] = !empty($array['logo']) ? url('uploads/business_logos/' . $array['logo']) : null;
        // $array['currency_precision'] = config('constants.currency_precision');
        // $array['quantity_precision'] = config('constants.quantity_precision');

        // foreach ($array['locations'] as $key => $value) {
        //     $array['locations'][$key]['default_payment_accounts'] = !empty($value['default_payment_accounts']) ? json_decode($value['default_payment_accounts'], true) : null;
        // }
        // dd($array);

        return $array;
    }
}
