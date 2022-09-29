<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

use App\Transaction;
use App\Utils\TransactionUtil;

use function GuzzleHttp\json_encode;

class OnlineApiSync extends Controller
{
    public function businessRegValidate(request $request)
    {
        return  $request->all();
    }

    public function salesUpload(request $request)
    {
        return response()->json($request->all());
    }


    protected $transactionUtil;

    public function __construct(TransactionUtil $transactionUtil)
    {
        $this->transactionUtil = $transactionUtil;
    }

    public function get_suppliers()
    {
        if (!request()->has('business_id') || request()->only('business_id') == null) {
            return json_encode(array('error' => 'Something Went Wrong'));
        }
        $business_id = request()->only('business_id');
        $supply = [];

        $suppliers = DB::table('contacts')->where('type', 'supplier')->where('business_id', $business_id)->get();
        foreach ($suppliers as $supplier) {
            $supplier_without = Arr::except((array) $supplier, ['ai_id', 'sync_status']);
            $supply['suppliers'][] = $supplier_without;
        }
        return response()->json($supply);
    }

    public function getVldRecords(request $request)
    {
        $vld_records = [];

        $local_rec = $request->all()[0];
        $vld = DB::table('variation_location_details')->where('id', $local_rec['id'])
            ->pluck('qty_available')
            ->first();
        return json_encode($vld);
    }

    function updateVldRecords(Request $request)
    {
        // return response()->json($request->all());
        $local_rec = $request->all()[0];
        $vld = DB::table('variation_location_details')->updateOrInsert(
            [
                'id' => $local_rec['id']
            ],
            $local_rec
        );
        return json_encode($vld);
    }

    function updatePurchaseLineVLD(request $request)
    {
        // return response()->json($request->all());
        $local_rec = $request->all()['p_line'];
        DB::beginTransaction();
        $p_line = DB::table('purchase_lines')->updateOrInsert(['id' => $local_rec['id']], $local_rec);
        DB::commit();
        return json_encode($p_line);
    }

    // get latest Purchase lines
    function latestPlines()
    {
        $product_id = request('product_id');
        $variation_id = request('variation_id');
        $p_line_records = DB::table('purchase_lines')
            ->where('product_id', $product_id)
            ->where('variation_id', $variation_id)
            ->get();

        return json_encode($p_line_records);
    }

    function transactionsRecords4Pline()
    {
        $request = request()->only('transaction_id');
        $transaction =  DB::table('transactions')->where('id', $request)->first();
        $transaction_without_ai_id = Arr::except((array)$transaction, ['ai_id']);
        return  json_encode($transaction_without_ai_id);
    }
    function saleTables(Request $request)
    {
        $msg = array("msg" => "success");

        DB::beginTransaction();


        if ($request->has('contacts')) {
            $sales_data = $request->input('contacts');
            foreach ($sales_data as $data) {
                $data_without_a_id = Arr::except($data, ['ai_id', 'sync_status']);
                $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];
                DB::table('contacts')->updateOrInsert(
                    ['id' => $data['id']],
                    (array) $data_without_a_id_sync_status
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('transactions')) {
            $table_name = 'transactions';
            $sales_data = $request->input('transactions');
            foreach ($sales_data as $data) {
                $data_without_a_id = Arr::except($data, ['ai_id', 'sync_status']);
                $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];
                DB::table($table_name)->updateOrInsert(
                    ['id' => $data['id']],
                    $data_without_a_id_sync_status
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('transaction_payments')) {
            $table_name = 'transaction_payments';
            $sales_data = $request->input('transaction_payments');
            foreach ($sales_data as $data) {
                $data_without_a_id = Arr::except($data, ['ai_id', 'sync_status']);
                $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];
                DB::table($table_name)->updateOrInsert(
                    ['id' => $data['id']],
                    $data_without_a_id_sync_status
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('transaction_sell_lines')) {
            $table_name = 'transaction_sell_lines';
            $sales_data = $request->input('transaction_sell_lines');
            foreach ($sales_data as $data) {
                $data_without_a_id = Arr::except((array) $data, ['ai_id', 'sync_status']);
                $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];
                $data_without_a_id_sync_status['children_type'] = json_encode($data_without_a_id_sync_status['children_type']);
                DB::table($table_name)->updateOrInsert(
                    ['id' =>   $data_without_a_id_sync_status['id']],
                    $data_without_a_id_sync_status
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('cash_registers')) {
            $table_name = 'cash_registers';
            $sales_data = $request->input('cash_registers');
            foreach ($sales_data as $data) {
                $data_without_a_id = Arr::except($data, ['ai_id', 'sync_status']);
                $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];
                DB::table($table_name)->updateOrInsert(
                    ['id' => $data['id']],
                    $data_without_a_id_sync_status
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('cash_register_transactions')) {
            $table_name = 'cash_register_transactions';

            $sales_data = $request->input('cash_register_transactions');
            foreach ($sales_data as $data) {
                $data_without_a_id = Arr::except($data, ['ai_id', 'sync_status']);
                $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];
                DB::table($table_name)->updateOrInsert(
                    ['id' => $data['id']],
                    $data_without_a_id_sync_status
                );
            }
            DB::commit();
            return json_encode($msg);
        } else {
            $error = ["something Went Wrong"];
        }
        return json_encode($error);
    }

    public function saleStockTables(Request $request)
    {
        $msg = array("msg" => "success");
        DB::beginTransaction();

        if ($request->has('transaction_sell_lines_purchase_lines')) {
            $sales_data = $request->input('transaction_sell_lines_purchase_lines');
            foreach ($sales_data as $data) {

                DB::table('transaction_sell_lines_purchase_lines')->updateOrInsert(
                    ['id' => $data['id']],
                    (array) $data
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('purchase_lines')) {
            $sales_data = $request->input('purchase_lines');
            foreach ($sales_data as $data) {
                DB::table('purchase_lines')->updateOrInsert(
                    ['id' => $data['id']],
                    (array) $data
                );
            }
            DB::commit();
            return json_encode($msg);
        } elseif ($request->has('invoice_schemes')) {

            $sales_data = $request->input('invoice_schemes');
            foreach ($sales_data as $data) {
                DB::table('invoice_schemes')->updateOrInsert(
                    ['id' => $data['id']],
                    (array) $data
                );
            }
            DB::commit();
            return json_encode($msg);
        }
    }


    public function destroySale()
    {

        try {

            if (!request()->has('business_id')) {
                $output = ['error' => 'Unauthenticated'];
                return json_encode($output);
            }

            $business_id = request('business_id');
            $transaction_ids = request()->only('transaction_id');
            $output = [];

            DB::beginTransaction();
            foreach ($transaction_ids as $id) {
                if (!is_null(Transaction::where('id', $id)->first())) {

                    $this->transactionUtil->deleteSale($business_id, $id);
                }
            }
            DB::commit();
            $output['success'] = "true";
        } catch (\Exception $e) {
            DB::rollBack();
            // dd($e);
            $output['error'] = "error";
        }

        return json_encode($output);
    }
}
