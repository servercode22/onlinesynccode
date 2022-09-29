<?php

namespace Modules\Connector\Transformers;

use Illuminate\Http\Resources\Json\Resource;

use App\Utils\Util;

class NotificationTemplateResource extends Resource
{

    public function toArray($request)
    {
        $array = parent::toArray($request);

        $array['email_body'] = !empty($array['email_body']) ? json_encode($array['email_body']) : null;
        return $array;
    }
}
