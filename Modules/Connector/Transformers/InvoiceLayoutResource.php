<?php

namespace Modules\Connector\Transformers;

use Illuminate\Http\Resources\Json\Resource;

class InvoiceLayoutResource extends Resource
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
        $array['common_settings'] = !empty($array['common_settings']) ? json_encode($array['common_settings']) : null;
        $array['qr_code_fields'] = !empty($array['qr_code_fields']) ? json_encode($array['qr_code_fields']) : null;
        return $array;
    }
}