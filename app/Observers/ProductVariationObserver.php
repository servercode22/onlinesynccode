<?php

namespace App\Observers;

use App\ProductVariation;

class ProductVariationObserver
{
    public function creating(ProductVariation $model)
    {

        $business_id = request()->session()->get('user.business_id');
        // $location_id = 3;
        $location_id = request()->session()->get('business_location.id');
        $last_row = ProductVariation::latest('ai_id')->first();

        if (!isset($last_row) && $last_row == null) {
            $last_id = "A-" . $business_id . "-" . $location_id . "-0";
            $model->id = $last_id;
        } else {
            $latest_id = $last_row->ai_id;
            $num2alpha = ProductVariation::num2alpha($latest_id + 1);
            $model->id = $num2alpha  . '-' . $business_id . '-' . $location_id . '-' . ($latest_id + 1);
        }
    }

    /**
     * Handle the product variation "created" event.
     *
     * @param  \App\ProductVariation  $productVariation
     * @return void
     */
    public function created(ProductVariation $productVariation)
    {
        //
    }

    /**
     * Handle the product variation "updated" event.
     *
     * @param  \App\ProductVariation  $productVariation
     * @return void
     */
    public function updated(ProductVariation $productVariation)
    {
        //
    }

    /**
     * Handle the product variation "deleted" event.
     *
     * @param  \App\ProductVariation  $productVariation
     * @return void
     */
    public function deleted(ProductVariation $productVariation)
    {
        //
    }

    /**
     * Handle the product variation "restored" event.
     *
     * @param  \App\ProductVariation  $productVariation
     * @return void
     */
    public function restored(ProductVariation $productVariation)
    {
        //
    }

    /**
     * Handle the product variation "force deleted" event.
     *
     * @param  \App\ProductVariation  $productVariation
     * @return void
     */
    public function forceDeleted(ProductVariation $productVariation)
    {
        //
    }
}
