<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CashRegisterTransaction extends Model
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    // for auto increment id
    public $incrementing = false;

    public static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $business_id = str_pad(request()->session()->get('user.business_id'), 1, 0, STR_PAD_LEFT);
            // $location_id = str_pad('1', 1, 0, STR_PAD_LEFT);
            // $location_id = 3;
            $location_id = request()->session()->get('business_location.id');
            $last_row = CashRegisterTransaction::latest('ai_id')->first();


            if (!isset($last_row) && $last_row == null) {
                $last_id = "0-" . $business_id . "-" . $location_id . "-A";
                $model->id = $last_id;
                // $latest_id = $last_id;
                // $last_id_exploded = explode('-', $latest_id);
            } else {
                $latest_id = $last_row->ai_id;
                $num2alpha = CashRegisterTransaction::num2alpha($latest_id + 1);
                $model->id = str_pad(($latest_id + 1), 1, 0, STR_PAD_LEFT)  . '-' . $business_id . '-' . $location_id . '-' . $num2alpha;
                // $last_id_exploded = explode('-', $latest_id);
            }
            // $last_id_alpha = $last_id_exploded[0];
            // $last_id_num =  $last_id_exploded[3];
            // $alpha2num = Transaction::alpha2num($last_id_alpha);

        });
    }

    static function num2alpha($n)
    {
        $r = '';
        for ($i = 1; $n >= 0 && $i < 10; $i++) {
            $r = chr(0x41 + ($n % pow(26, $i) / pow(26, $i - 1))) . $r;
            $n -= pow(26, $i);
        }
        return $r;
    }

    static function alpha2num($a)
    {
        $r = 0;
        $l = strlen($a);
        for ($i = 0; $i < $l; $i++) {
            $r += pow(26, $i) * (ord($a[$l - $i - 1]) - 0x40);
        }
        return $r - 1;
    }
}
