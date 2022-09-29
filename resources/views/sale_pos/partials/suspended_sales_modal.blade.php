<!-- Edit Order tax Modal -->
<div class="modal-dialog modal-lg" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">@lang('lang_v1.suspended_sales')</h4>
		</div>
		<div class="modal-body">
			<div class="row">
				@php
					$c = 0;
					$subtype = '';
				@endphp
				@if(!empty($transaction_sub_type))
					@php
						$subtype = '?sub_type='.$transaction_sub_type;
					@endphp
				@endif
				@forelse($sales as $sale)
					@if($sale->is_suspend)
						<div class="col-xs-6 col-sm-3">
							<div class="small-box bg-yellow">
					            <div class="inner text-center">
						            @if(!empty($sale->additional_notes))
						            	<p><i class="fa fa-edit"></i> {{$sale->additional_notes}}</p>
						            @endif
					              <p>{{$sale->invoice_no}}<br>
					              {{@format_date($sale->transaction_date)}}<br>
					              <strong><i class="fa fa-user"></i> {{$sale->name}}</strong></p>
					              <p><i class="fa fa-cubes"></i>@lang('lang_v1.total_items'): {{count($sale->sell_lines)}}<br>
					              <i class="fas fa-money-bill-alt"></i> @lang('sale.total'): <span class="display_currency" data-currency_symbol=true>{{$sale->final_total}}</span>
					              </p>
					              @if($is_tables_enabled && !empty($sale->table->name))
					              	@lang('restaurant.table'): {{$sale->table->name}}
					              @endif
					              @if($is_service_staff_enabled && !empty($sale->service_staff))
					              	<br>@lang('restaurant.service_staff'): {{$sale->service_staff->user_full_name}}
					              @endif
					            </div>
					            <a href="{{action('SellPosController@edit', ['id' => $sale->id]).$subtype}}" class="small-box-footer bg-blue p-10">
					              @lang('sale.edit_sale') <i class="fa fa-arrow-circle-right"></i>
					            </a>
					            <a href="{{action('SellPosController@destroy', ['id' => $sale->id])}}" class="small-box-footer delete-sale bg-red is_suspended">
					              @lang('messages.delete') <i class="fas fa-trash"></i>
					            </a>

								{{-- only show latest products
								remove edit printer
				 --}}
				 
									<a href="#" ids="{{$sale->id}}" style="width: 100%"  type="button" class=" ok btn btn-info block p-10" >Kot <i class="fas fa-arrow-alt-circle-down"></i></a>		
									<a href="#" id="{{$sale->id}}" style="width:100%"  type="button" class=" bill block btn btn-success p-10" >Bill <i class="fas fa-money-bill-alt" aria-hidden="true"></i></a>							
					         </div>
				         </div>
				        @php
				         	$c++;
				        @endphp
					@endif

					@if($c%4==0)
						<div class="clearfix"></div>
					@endif
				@empty
					<p class="text-center">@lang('purchase.no_records_found')</p>
				@endforelse
			</div>
		</div>
		<div class="modal-footer">
		    <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->








{{-- kot --}}
<div id="test2" class="modal fade" role="dialog" style="z-index: 1600;">
	<div class="modal-dialog">
	  <!-- Modal content-->
	  <div class="modal-content">
	     <div class="modal-header">
                <button type="button" class="close" id="close"
                data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
           
              
              </div>
		  
		<div class="modal-body">
		
		      <div class="col-xs-12 text-center" style="margin-top: 0px">
				<h2>KOT</h2>
			</div>
			  
				   
			      <!-- business information here -->
				  <div class="col-xs-12 text-center">
					{{-- <h5 class="text-center" id="address">
						<!-- Shop & Location Name  -->

					</h5> --}}

					
					{{-- <h5 id="mobile"> --}}
						<h5 id="customer12">
							<h5 id="date12"></h5>
							<h5 id="invoice12"></h5>
					   
					</h5>
					<hr>
				   
				</div>

				
	
			
	
			
		    <table class="table table-responsive  table-striped">
      
      
				<thead>
				  <tr>
					
						<th scope="rowspan"><input  checked="true"  class="kot_item_checkbox" id="products_check" type="checkbox" ></th>
						<th   scope="rowspan"> Products</th>
							<th scope="rowspan">Quantity</th>
					
				
				
				
				  </tr>
				</thead>
				<tbody class="sus" id="ye">
			
			
				</tbody>
			  </table>
			  <a  id="btnprn"   class="btnprn btn btn-primary my-4  btn-md" >Print Kot </a>
		</div>      
	  </div>
	</div>
  </div>


<!-- Modal -->
<div class="modal fade fade1" id="bill" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" style="text-align:left; float:left"> Bill </h4>
                <button type="button" class="close" id="close1" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
            </div>
            <div class="modal-body">
                <div class="main">
                    <div class="row">

                        <h2 class="text-center business">4 Tech Brothers</h2>
                        <!-- business information here -->
                        <div class="col-xs-12 text-center">
                            <h5 class="address">
                                <!-- Shop & Location Name  -->

                            </h5>
                            <h5 class="mobile">
                                <h5 class="customer">
                                    <h5 class="status"></h5>
                                    <h5 class="date"></h5>

                                </h5>
                                <h3>Invoice</h3>
                                <hr>

                        </div>

                    </div>

                    <table class="table table-responsive  table-striped">


                        <thead>
                            <tr>

                                <th scope="col">Product</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Unit_price</th>



                            </tr>
                        </thead>
                        <tbody class="billkot">
                        </tbody>
                    </table>
                    <hr>
                    <h4  style="text-align:left; float:left" >Subtotal</h4>
                    <h4 class="Subtotal " style="text-align:right; float:right"></h4>
               <br>
               <br>
                    <a   href="#" id="btnbill"  class="btnbill btn btn-primary my-4  btn-md" >Print Bill </a>
           

                </div>


            </div>

        
        </div>

    </div>

</div>
</div>





  <script>



$('.bill').on('click', function() {
	
$('#bill').modal('show');
var id = $(this).attr('id');
			  $.ajax({
            method: 'GET',
            url: '/bill/' + id,
   
	success: function(data) {

	   console.log(data);
	   var s=data[0].transaction_date;
	   var date= new Date(s)
	
	   var d = date.getDate();
	   var m = date.getMonth() + 1;
	   var y = date.getFullYear();
	 var f= '' + y + '-' + (m<=9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);

  
  	   $(".business").html(data[0].bname);


	   $(".customer").html('Customer:'+' '+data[0].cname);
	   $(".status").html('Invoice_No:'+' '+data[0].invoice_no);
	   $(".mobile").html('Mobile:'+' '+data[0].mobile);
  
   
	   $(".date").html('Date:'+' '+f);
	   $(".Subtotal").html('Rs:'+' '+data[0].final_total);
	   $(".address").html(data[0].landmark +'  '+ data[0].city + '    '+data[0] . zip_code+ '   '+data[0].state+'  '+ data[0].country);
 

		  var res='';
	$.each (data, function (key, value) {
	res +=
	'<tr>'+
		'<td>'+value.name+'</td>'+
		'<td>'+value.quantity+' P(cs)'+'</td>'+
		'<td>'+value.unit_price+'</td>'+
	
	
	  
   '</tr>';

});

$('.billkot').html(res);

	   
},
});
})



$('.ok').on('click',function(){
              
			
			  $('#test2').modal('show');
			  var id = $(this).attr('ids');
		
			  $.ajax({
            method: 'GET',
            url: '/kot/' + id,
			dataType: "json",
            
            success: function(data) {
			   var s=data[0].transaction_date;
               var date= new Date(s)
            
               var d = date.getDate();
               var m = date.getMonth() + 1;
               var y = date.getFullYear();
             var f= '' + y + '-' + (m<=9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);

			   $("#customer12").html('Customer:'+' '+data[0].cname);
			
			   $("#date12").html('Date:'+' '+f);
			   $("#invoice12").html('Invoice_No:'+' '+data[0].invoice_no);
			//    $(".address").html('Address:'+' '+data[0].landmark +'  '+ data[0].city + '    '+data[0] . zip_code+ '   '+data[0].state+'  '+ data[0].country);
			//    $(".mobile").html('Mobile:'+' '+data[0].mobile);
         

	

			   var res='';
            $.each (data, function (key, value) {
				
            res +=
            '<tr>'+
			
      '<td> '+'<input checked="" class="custom_name" id="kot_item_checkbox_269" type="checkbox"   >'+'</td>'+
	  '<td>'+value.name+'</td>'+
				'<td>'+value.quantity+' P(cs)'+'</td>'+
			
			
           '</tr>';


   });
   $('.sus').html(res);

            },
        });
		})
		$('#products_check').on('click',function(){
		
			var checkAll = this.checked;
			$(".custom_name").each(function(){
            // $(this).attr("checked", true);
			
			this.checked=checkAll;
})
			
	})
	

		$('.btnprn').on('click',function(){
			// $('[type="checkbox"]:not(:checked)').closest('tr').hide();
			$("#ye input[type='checkbox']:not(:checked)").closest("tr").remove();

		
		
	$('[type="checkbox"]:checked').hide();
			$(".kot_item_checkbox").hide() ;

              
			var ButtonControl = document.getElementById("btnprn");
            ButtonControl.style.visibility = "hidden";
			var close = document.getElementById("close");
            close.style.visibility = "hidden";
			  // $(".conatainer").printThis();
		

			  $('#test2').printThis({
			
			  });

			setTimeout(function(){
  $('#test2').modal('hide')
}, 3000);


setTimeout(function(){
	$(".kot_item_checkbox").show() ;
},4000);

setTimeout(function(){
ButtonControl.style.visibility = "visible";
}, 4000);
setTimeout(function(){
close.style.visibility = "visible";
}, 3000);


				   
				})
				
				
			
$('.btnbill').on('click' ,function () {

    var ButtonControl = document.getElementById("btnbill");
            ButtonControl.style.visibility = "hidden";

            var close1 = document.getElementById("close1");
            close1.style.visibility = "hidden";
            

    $('#bill').printThis();

    setTimeout(() => {
        $('#bill').modal('hide');
    }, 3000);


setTimeout(() => {
    ButtonControl.style.visibility = "visible";
    close1.style.visibility = "visible";
}, 5000);
})



			
</script>

<style type="text/css">
	@media print {
		#printbtn {
			display :  none;
		}
	}

	</style>