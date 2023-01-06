<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransactionSellLine extends Model
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    public $incrementing = false;
    public static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $business_id = str_pad(request()->session()->get('user.business_id'), 1, 0, STR_PAD_LEFT);
            // $location_id = 3;
            $location_id = request()->session()->get('business_location.id');

            $last_row = TransactionSellLine::latest('ai_id')->first();


            if (!isset($last_row) && $last_row == null) {
                $last_id = "0-" . $business_id . "-" . $location_id . "-A";
                $model->id = $last_id;
                // $latest_id = $last_id;
                // $last_id_exploded = explode('-', $latest_id);
            } else {
                $latest_id = $last_row->ai_id;
                $num2alpha = TransactionSellLine::num2alpha($latest_id + 1);
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

    
    public function transaction()
    {
        return $this->belongsTo(\App\Transaction::class);
    }

    public function product()
    {
        return $this->belongsTo(\App\Product::class, 'product_id');
    }

    public function variations()
    {
        return $this->belongsTo(\App\Variation::class, 'variation_id');
    }

    public function modifiers()
    {
        return $this->hasMany(\App\TransactionSellLine::class, 'parent_sell_line_id')
            ->where('children_type', 'modifier');
    }

    public function sell_line_purchase_lines()
    {
        return $this->hasMany(\App\TransactionSellLinesPurchaseLines::class, 'sell_line_id');
    }

    /**
     * Get the quantity column.
     *
     * @param  string  $value
     * @return float $value
     */
    public function getQuantityAttribute($value)
    {
        return (float)$value;
    }

    public function lot_details()
    {
        return $this->belongsTo(\App\PurchaseLine::class, 'lot_no_line_id');
    }

    public function get_discount_amount()
    {
        $discount_amount = 0;
        if (!empty($this->line_discount_type) && !empty($this->line_discount_amount)) {
            if ($this->line_discount_type == 'fixed') {
                $discount_amount = $this->line_discount_amount;
            } elseif ($this->line_discount_type == 'percentage') {
                $discount_amount = ($this->unit_price_before_discount * $this->line_discount_amount) / 100;
            }
        }
        return $discount_amount;
    }

    /**
     * Get the unit associated with the purchase line.
     */
    public function sub_unit()
    {
        return $this->belongsTo(\App\Unit::class, 'sub_unit_id');
    }

    public function order_statuses()
    {
        $statuses = [
            'received',
            'cooked',
            'served'
        ];
    }

    public function service_staff()
    {
        return $this->belongsTo(\App\User::class, 'res_service_staff_id');
    }

    /**
     * The warranties that belong to the sell lines.
     */
    public function warranties()
    {
        return $this->belongsToMany('App\Warranty', 'sell_line_warranties', 'sell_line_id', 'warranty_id');
    }

    public function line_tax()
    {
        return $this->belongsTo(\App\TaxRate::class, 'tax_id');
    }

    public function so_line()
    {
        return $this->belongsTo(\App\TransactionSellLine::class, 'so_line_id');
    }
}
