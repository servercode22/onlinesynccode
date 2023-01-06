<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Transaction;
use App\TransactionSellLine;
use App\TransactionSellLinesPurchaseLines;
use App\Utils\TransactionUtil;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpKernel\Event\ResponseEvent;

class IdController extends Controller
{
    //

    public function kot($id){
    //    $sale=Transaction::find($id);
    $data = DB::table('transaction_sell_lines')

    ->join('transactions','transactions.id','=','transaction_sell_lines.transaction_id')
    ->join('products','products.id','=','transaction_sell_lines.product_id')
    ->join('contacts','contacts.id','=','transactions.contact_id')
    
    
    
   
    ->select('transaction_sell_lines.quantity','transactions.invoice_no','transactions.id','transactions.transaction_date','products.name','contacts.name as cname')->where('transactions.id','=',$id)


    ->get();

    // return view('kot')->with('data',$data);
    return Response($data);


    }

    public function index(){
     
  
$ok=Transaction::latest('id')->first();
$id=$ok->id;
        
      
$data = DB::table('transaction_sell_lines')
->join('products','products.id','=','transaction_sell_lines.product_id')
->join('transactions','transactions.id','=','transaction_sell_lines.transaction_id')
->join('contacts','contacts.id','=','transactions.contact_id')
->join('business_locations','business_locations.id','=','transactions.business_id')



->select('transaction_sell_lines.quantity','products.name as pro_name','transactions.invoice_no','transactions.transaction_date','contacts.name','transaction_sell_lines.created_at')->where('transaction_sell_lines.transaction_id','=',$id)
    
        ->get();
        return response($data);
// $ok=TransactionSellLinesPurchaseLines::latest('id')->first();
// $id=$ok->sell_line_id;

// $tran=TransactionSellLine::find($id);

// $aa=$tran->transaction_id;



      
// $data=DB::table('transaction_sell_lines') 
// ->join('transactions','transactions.id','=','transaction_sell_lines.transaction_id')
// ->join('products','products.id','=','transaction_sell_lines.product_id')
// ->select('transaction_sell_lines.quantity','transactions.invoice_no','transactions.id','products.name as pro_name')->where('transaction_sell_lines.transaction_id','=',$aa)->get();
//         return response($data);
     
    }


    public function bill($id){
     
        $data = DB::table('transaction_sell_lines')

    ->join('transactions','transactions.id','=','transaction_sell_lines.transaction_id')
    ->join('products','products.id','=','transaction_sell_lines.product_id')
    ->join('contacts','contacts.id','=','transactions.contact_id')
    ->join('business_locations','business_locations.id','=','transactions.business_id')
    
    
    
   
    ->select('transaction_sell_lines.quantity','transactions.invoice_no','transactions.id','transactions.transaction_date','products.name','contacts.name as cname','business_locations.mobile','business_locations.country','business_locations.city','business_locations.state','business_locations.zip_code','business_locations.name as bname','business_locations.landmark','transaction_sell_lines.created_at','transactions.final_total','transaction_sell_lines.unit_price')->where('transactions.id','=',$id)


    ->get();

    // return view('kot')->with('data',$data);
    return Response($data);

    
}

}