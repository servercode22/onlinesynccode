<?php

namespace Modules\Connector\Transformers;

use Illuminate\Http\Resources\Json\Resource;
use App\Utils\ProductUtil;
use App\PurchaseLine;

class ProductResource extends Resource
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
        $array['sub_unit_ids'] = !empty($array['sub_unit_ids']) ? json_encode($array['sub_unit_ids']) : $array['sub_unit_ids'];

        $send_lot_detail = !empty(request()->input('send_lot_detail')) && request()->input('send_lot_detail') == 1 ? true : false;

        $purchase_lines = !empty(request()->input('purchase_lines')) && request()->input('purchase_lines') == 1 ? true : false;
        $productUtil = new ProductUtil;
        foreach ($array['product_variations'] as $key => $value) {
            foreach ($value['variations'] as $k => $v) {

                $array['product_variations'][$key]['variations'][$k]['combo_variations'] = json_encode($v['combo_variations']);

                if ($purchase_lines && !empty($v['variation_location_details'])) {
                    foreach ($v['variation_location_details'] as $u => $w) {

                        $purchase_lines = [];
                        $purchase_lines_table = PurchaseLine::where('variation_id', $w['variation_id'])
                            ->leftJoin('transactions as t', 'purchase_lines.transaction_id', '=', 't.id')
                            ->where('t.location_id', $w['location_id'])
                            ->select(
                                'purchase_lines.id',
                                "purchase_lines.transaction_id",
                                "purchase_lines.product_id",
                                "purchase_lines.variation_id",
                                "purchase_lines.quantity",
                                "purchase_lines.pp_without_discount",
                                "purchase_lines.discount_percent",
                                "purchase_lines.purchase_price",
                                "purchase_lines.purchase_price_inc_tax",
                                "purchase_lines.item_tax",
                                "purchase_lines.tax_id",
                                "purchase_lines.purchase_order_line_id",
                                "purchase_lines.quantity_sold",
                                "purchase_lines.quantity_adjusted",
                                "purchase_lines.quantity_returned",
                                "purchase_lines.po_quantity_purchased",
                                "purchase_lines.mfg_quantity_used",
                                "purchase_lines.mfg_date",
                                "purchase_lines.exp_date",
                                "purchase_lines.lot_number",
                                "purchase_lines.sub_unit_id",
                                "purchase_lines.created_at",
                                "purchase_lines.updated_at",
                            )
                            ->get();

                        foreach ($purchase_lines_table as $pl) {
                            $purchase_lines[] = $pl;
                        }
                        $array['product_variations'][$key]['variations'][$k]['variation_location_details'][$u]['purchase_lines'] = $purchase_lines;
                    }

                    if (isset($v['group_prices'])) {
                        $array['product_variations'][$key]['variations'][$k]['selling_price_group'] = $v['group_prices'];
                        unset($array['product_variations'][$key]['variations'][$k]['group_prices']);
                    }
                    //get discounts for each location
                    $discounts = [];
                    foreach ($array['product_locations'] as $pl) {
                        $selling_price_group = $pl['selling_price_group_id'];
                        $location_discount = $productUtil->getProductDiscount($this, $array['business_id'], $pl['id'], false, $selling_price_group, $v['id']);
                        if (!empty($location_discount)) {
                            $discounts[] = $location_discount;
                        }
                    }

                    $array['product_variations'][$key]['variations'][$k]['discounts'] = $discounts;
                }
            }
        }
        return $array;
        // return array_diff_key($array, array_flip($this->__excludeFields()));
    }

    private function __excludeFields()
    {
        return [
            'created_at',
            'updated_at',
            'brand_id',
            'unit_id',
            'category_id',
            'sub_category_id',
            'tax',
            'tax_type',
        ];
    }
}

// dd($purchase_lines);
                            //  [
                            //     "purchase_lines.id" => $pl->id,
                            //     "purchase_lines.transaction_id" => $pl->transaction_id,
                            //     "purchase_lines.product_id" => $pl->product_id,
                            //     "purchase_lines.variation_id" => $pl->variation_id,
                            //     "purchase_lines.quantity" => $pl->quantity,
                            //     "purchase_lines.pp_without_discount" => $pl->pp_without_discount,
                            //     "purchase_lines.discount_percent" => $pl->discount_percent,
                            //     "purchase_lines.purchase_price" => $pl->purchase_price,
                            //     "purchase_lines.purchase_price_inc_tax" => $pl->purchase_price_inc_tax,
                            //     "purchase_lines.item_tax" => $pl->item_tax,
                            //     "purchase_lines.tax_id" => $pl->tax_id,
                            //     "purchase_lines.purchase_order_line_id" => $pl->purchase_order_line_id,
                            //     "purchase_lines.quantity_sold" => $pl->quantity_sold,
                            //     "quantity_adjusted" => $pl->quantity_adjusted,
                            //     "quantity_returned" => $pl->quantity_returned,
                            //     "po_quantity_purchased" => $pl->po_quantity_purchased,
                            //     "mfg_quantity_used" => $pl->mfg_quantity_used,
                            //     "mfg_date" => $pl->mfg_date,
                            //     "exp_date" => $pl->exp_date,
                            //     "lot_number" => $pl->lot_number,
                            //     "sub_unit_id" => $pl->sub_unit_id,
                            //     "created_at" => $pl->created_at,
                            //     "updated_at" => $pl->updated_at
                            // ];
                            // dd($purchase_lines);