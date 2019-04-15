<!DOCTYPE html>
<html>
<head>
	<script src="{{ asset('js/jQuery.min.js') }}"></script>
	 <link rel="stylesheet" href="{{ asset('bootstrap-4.1.3/dist/css/bootstrap.css') }}">  
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	     <meta name="discription" content="Ashutosh Kumar Choubey (Full Stack Application Developer)" />
	    {{-- /*
 *  File Name              :
 *  Type                   :   
 *  Description            :   
 *  Author                 : Ashtosh Kumar Choubey
 *  Contact                : 9658476170
 *  Email                  : ashutoshphoenixsoft@gmail.com
 *  Date                   : 12/12/2018  
 *  Modified By            :       
 *  Date of Modification   :     
 *  Purpose of Modification: 
 * 
 */ --}}
<style>
.grid-container {
	display: grid;
	display: inline-grid;
	grid-template-columns: auto auto auto;
	grid-column-gap: 50px;
}
.grid-container2 {
	display: grid;
	display: inline-grid;
	grid-template-columns: 5% 30% 10%  33% 2%;
	grid-column-gap: 4%;
}
.grid-container3 {
	display: grid;
	display: inline-grid;
	grid-template-columns: 30% 10% 10% 30%;
	grid-column-gap: 5%;
}
.grid-item {
  /*padding: 20px;*/
  font-size: 30px;
  text-align: center;
}
p.word-wrap{
	 word-break: keep-all;
}
.logo
{
border-radius: 15px 50px;
  /*border-radius: 25px;*/
  background-position: left top;
  background-repeat: repeat;
  padding: 15px; 
 /* width: 200px;
  height: 150px; */
    /*background-image: linear-gradient(to bottom right, #867f7f, #c8c8d0);*/
    /*color: skyblue;*/
    color: black;
}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   /*text-align: center;*/
}
</style>
<title>Workshop Detail</title>
</head>
<body >
	<table width="100%" border="3">
		{{-- <tr>
			<td align="center" colspan="3">
				<img  src="{{ asset('img/new.jpg') }}" >
				<h4><b>Tax Invoice</b></h4>
			</td>
		</tr> --}}
		<tr>
			<td height="100px"  colspan="2">
				<b style="font-size: 19px;">Guarage AUTOMOBILE</b> <br>
				plot no-34,Kaza<br>
				Asgtr Road,DExcxcv<br>
				Odisha,pin-751724<br>
				mobile:15286923,8579583433<br>
				Email id:ashuashutoshchoubey@gmail.com
			</td>
			<td align="center" >
				<img  src="{{ asset('img/new.jpg') }}" >
				<h4><b>Tax Invoice</b></h4>
			</td>
		</tr>
		<tr>
			<td align="left">CIN No :</td>
			<td align="left">PAN No :</td>
			<td align="left">GSTIN :</td>
		</tr>	
		<tr>
			<td colspan="3" align="center">
				Coustomer Details
			</td>
		</tr>
		<tr>
			<td width="33px">Name :{{$name}}  <br>
				Adress : {{$address}} <br>
				GSTIN : {{ $gst_no }} <br>
				PAN :
			</td>
	     <td width="33px">
			VIN : {{$vin}} <br>
			MAKE : @php
				if(isset($brandName))
				{
					echo $brandName;
				}
				@endphp
				<br>
			MODEL : @php
				if(isset($model_numberName))
				{
					echo $model_numberName;
				}
				@endphp
				<br>
			COLOR : {{ $color }}<br>
			REG NO : {{ $vehicle_reg_number }} <br>
			
		  </td>
		  <td width="33px">
		  	Invoice No :{{ $id }} <br>
		  	Date : <?php echo date("jS \of F Y"); ?><br>
		  	RO No. : <br>
		  	RO Date & Time: {{ $workshop_date }} <br>
		  	K.M.S : {{ $odometer_reading }}<br>
		  	PAYMENT : {{ number_format($paid_price,2) }} <br>
			
			</td>
		</tr>	
		<tr><td colspan="3"><b>SUBMITED PART</b>:{{ $submited_part }}	</td></tr>            
	</table>
	 <table width="100%" border="1">
	 	<tr>
	 		<td rowspan="2" align="center">SL NO</td>
	 		<td rowspan="2" align="center">Part No/Description</td>
	 		<td rowspan="2" align="center">HSN</td>
	 		<td rowspan="2" align="center">Category</td>
	 		<td rowspan="2" align="center">Qty</td>
	 		<td rowspan="2" align="center">Unit Retail Price</td>
	 		<td rowspan="2" align="center">Total Retail Price</td>
	 		<td rowspan="2" align="center">Discount Value</td>
	 		<td rowspan="2" align="center">Total Taxable <br> Price(after Disc)</td>
	 		<td colspan="2" align="center">SGST/UGST</td>
	 		<td colspan="2" align="center">CGST</td>
	 		<td colspan="2" align="center">IGST</td>
	 		<td align="center" rowspan="2">Total Price</td>
	 	</tr>
	 	<tr>
	 		<td align="center">Rate(%)</td>
	 		<td align="center">Amount</td>
	 		<td align="center">Rate(%)</td>
	 		<td align="center">Amount</td>
	 		<td align="center">Rate(%)</td>
	 		<td align="center">Amount</td>
	 	</tr>
	 	@php
	 	$row=0;
	 	$sgst_t=0;
	 	$cgst_t=0;
	 	$igst_t=0;
	 	$total_price=0;
	 	$sl=1;
	 	$sparDiscount=0;
	 	$sparPriceAfterDiscount=0;
	 	$sparDiscountTotal=0;
	 	$sparPriceAfterDiscountTotal=0;
	 	$TotalRetalerPrice=0;
	 	@endphp
	 	
	 	@foreach($WorkshopProduct as $value)
	 		<tr>
	 		<td>{{ $sl }}</td>
	 		<td>{{ $value->product_name }}</td>
	 		<td>{{ $value->ProductHsn }}</td>
	 		<td>&nbsp;</td>
	 		<td>{{ $value->product_quantity }} </td>
	 		<td>{{ $value->UnitExitPrice }}</td>
	 		<td>{{ $value->product_quantity*$value->UnitExitPrice }}</td>
	 		<td>{{ $value->discount_value }}</td>
	 		<td>{{ (($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity }}</td>
	 		@php
	 		$TotalRetalerPrice+=$value->product_quantity*$value->UnitExitPrice;
	 		$sparDiscount+=($value->UnitExitPrice)*$value->discount_value/100;
	 		$sparePriceAfterDiscountForUnit=($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100;
	 		$sparPriceAfterDiscount+=($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100;
	 		$sparDiscountTotal+=(($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity;
	 		$sparPriceAfterDiscountTotal_forUnit=(($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity;
	 		$sparPriceAfterDiscountTotal+=(($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity;
	 		$sl=$sl+1;
	 		// echo $sl;
	 		$total_sgst_amount=($sparePriceAfterDiscountForUnit)*$value->Productsgst/100;
	 		$total_cgst_amount=($sparePriceAfterDiscountForUnit)*$value->Productcgst/100;
	 		$total_igst_amount=($sparePriceAfterDiscountForUnit)*$value->Productigst/100;
	 		// $total_price_final= $sparPriceAfterDiscountTotal+ $total_sgst_amount+$total_cgst_amount+ $total_igst_amount;
	 		$total_retail_price=($value->product_quantity*$sparePriceAfterDiscountForUnit);
	 		$total_price_final= $sparPriceAfterDiscountTotal_forUnit+ $total_sgst_amount*$value->product_quantity+$total_cgst_amount*$value->product_quantity+ $total_igst_amount*$value->product_quantity;
	 		// echo $sparPriceAfterDiscountTotal_forUnit."+ ".$total_sgst_amount*$value->product_quantity."+".$total_cgst_amount*$value->product_quantity."+". $total_igst_amount*$value->product_quantity;
	 		// echo "<br/>";
	 		@endphp
	 		<td>{{$value->Productsgst}}</td>
	 		<td>@php echo $total_sgst_amount*$value->product_quantity @endphp</td>
	 		<td>{{ $value->Productcgst }}</td>
	 		<td>@php echo $total_cgst_amount*$value->product_quantity @endphp</td>
	 		<td>{{ $value->Productigst}}</td>
	 		<td>@php echo $total_igst_amount*$value->product_quantity @endphp</td>
	 		<td>@php echo $total_price_final @endphp</td>
	 		@php 
	 		$row+=$total_retail_price;
	 		$sgst_t+=$total_sgst_amount*$value->product_quantity;
	 		$cgst_t+=$total_cgst_amount*$value->product_quantity;
	 		$igst_t+=$total_igst_amount*$value->product_quantity;
	 		@endphp
	 	</tr>
	 	@endforeach
	 	@if($is_complete==0)
						
			@foreach($workshop_products_estimateds as $value)
			<tr>
	 		<td>{{ $sl }}</td>
	 		<td>{{ $value->product_name }}</td>
	 		<td>{{ $value->ProductHsn }}</td>
	 		<td>&nbsp;</td>
	 		<td>{{ $value->product_quantity_es }} </td>
	 		<td>{{ $value->UnitExitPrice }}</td>
	 		<td>{{ $value->product_quantity_es*$value->UnitExitPrice }}</td>
	 		<td>{{ $value->discount_value }}</td>
	 		<td>{{ (($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity_es }}</td>
	 		@php
	 		$TotalRetalerPrice+=$value->product_quantity_es*$value->UnitExitPrice;
	 		$sparDiscount+=($value->UnitExitPrice)*$value->discount_value/100;
	 		$sparePriceAfterDiscountForUnit=($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100;
	 		$sparPriceAfterDiscount+=($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100;
	 		$sparDiscountTotal+=(($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity_es;
	 		$sparPriceAfterDiscountTotal_forUnit=(($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity_es;
	 		$sparPriceAfterDiscountTotal+=(($value->UnitExitPrice)-($value->UnitExitPrice)*$value->discount_value/100)*$value->product_quantity_es;
	 		$sl=$sl+1;
	 		// echo $sl;
	 		$total_sgst_amount=($sparePriceAfterDiscountForUnit)*$value->Productsgst/100;
	 		$total_cgst_amount=($sparePriceAfterDiscountForUnit)*$value->Productcgst/100;
	 		$total_igst_amount=($sparePriceAfterDiscountForUnit)*$value->Productigst/100;
	 		// $total_price_final= $sparPriceAfterDiscountTotal+ $total_sgst_amount+$total_cgst_amount+ $total_igst_amount;
	 		$total_retail_price=($value->product_quantity_es*$sparePriceAfterDiscountForUnit);
	 		$total_price_final= $sparPriceAfterDiscountTotal_forUnit+ $total_sgst_amount*$value->product_quantity_es+$total_cgst_amount*$value->product_quantity_es+ $total_igst_amount*$value->product_quantity_es;
	 		// echo $sparPriceAfterDiscountTotal_forUnit."+ ".$total_sgst_amount*$value->product_quantity_es."+".$total_cgst_amount*$value->product_quantity_es."+". $total_igst_amount*$value->product_quantity_es;
	 		// echo "<br/>";
	 		@endphp
	 		<td>{{$value->Productsgst}}</td>
	 		<td>@php echo $total_sgst_amount*$value->product_quantity_es @endphp</td>
	 		<td>{{ $value->Productcgst }}</td>
	 		<td>@php echo $total_cgst_amount*$value->product_quantity_es @endphp</td>
	 		<td>{{ $value->Productigst}}</td>
	 		<td>@php echo $total_igst_amount*$value->product_quantity_es @endphp</td>
	 		<td>@php echo $total_price_final @endphp</td>
	 		@php 
	 		$row+=$total_retail_price;
	 		$sgst_t+=$total_sgst_amount*$value->product_quantity_es;
	 		$cgst_t+=$total_cgst_amount*$value->product_quantity_es;
	 		$igst_t+=$total_igst_amount*$value->product_quantity_es;
	 		@endphp
	 	</tr>
			@endforeach
		@endif
	 	
	 	
	 	<tr>
	 		<td colspan="4"><b>Total :</b></td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>@php echo number_format($TotalRetalerPrice,2, '.', ''); @endphp</td>
	 		<td>&nbsp;</td>
	 		<td>@php echo number_format($row,2, '.', ''); @endphp</td>
	 		<td>&nbsp;</td>
	 		<td>@php echo  number_format($sgst_t,2, '.', ''); @endphp</td>
	 		<td>&nbsp;</td>
	 		<td>@php echo number_format($cgst_t,2, '.', ''); @endphp</td>
	 		<td>&nbsp;</td>
	 		<td>@php echo number_format($igst_t,2, '.', ''); @endphp</td>
	 		<td>@php  $total_price=$row+$sgst_t+$cgst_t+$igst_t; 
	 		 echo number_format($total_price,2, '.', '');
	 		 @endphp</td>
	 	</tr>
	 	<!-- spare part ends -->
<!-- Sevice part starts -->
	 	@php
	 	$Total_Taxable_price_service=0;
	 	$Total_sgst_service=0;
	 	$Total_cgst_service=0;
	 	$Total_igst_service=0;
	 	$Total_price_service=0;
	 	$Total_service_gst=0;
	 	$sl2=1;
	 	$serviceAfterDiscount=0;
	 	$IgstAmount=0;
	 	$CgstAmount=0;
	 	$SgstAmount=0;
	 	$GrandTotalPriceForOneService=0;
	 	$TotalServicePrice=0;
	 	@endphp
	 	<tr>
	 		<td colspan="16"><b>LABOUR CHARGES</b></td>
	 	</tr>
	 	@foreach($WorkshopService as $value)
	 	<tr>
	 		@php
	 		$TotalPriceForOneService=($value->service_price-$value->service_price*$value->service_discount/100)+((($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_igst)/100)+((($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_cgst)/100)+((($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_sgst)/100);
	 		@endphp
	 		<td>{{ $sl2 }}</td>
	 		<td>{{$value->service_name }}</td>
	 		<td></td>
	 		<td></td>
	 		<td>{{1}}</td>
	 		<td>{{$value->service_price}}</td>
	 		<td>{{$value->service_price}}</td>
	 		<td>{{ $value->service_discount}}</td>
	 		<td>{{ $value->service_price-$value->service_price*$value->service_discount/100 }}</td>
	 		{{-- <td></td> --}}
	 		<td>{{$value->service_sgst }}</td>
	 		<td>{{ (($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_sgst)/100 }}</td>
	 		<td>{{$value->service_cgst }}</td>
	 		<td>{{ (($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_cgst)/100 }}</td>
	 		<td>{{ $value->service_igst }}</td>
	 		<td> {{ (($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_igst)/100 }}</td>
	 		<td>{{ $TotalPriceForOneService }}</td>
	 		@php
	 		$TotalServicePrice+=$value->service_price-$value->service_price*$value->service_discount/100;
	 		$GrandTotalPriceForOneService+=$TotalPriceForOneService;
	 		$sl2+=$sl2+1;
			$IgstAmount+=(($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_igst)/100;
			$CgstAmount+=(($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_cgst)/100;
			$SgstAmount+=(($value->service_price-$value->service_price*$value->service_discount/100)*$value->service_sgst)/100;
	 		$serviceAfterDiscount=$value->service_price-$value->service_price*$value->service_discount/100;
	 		$Total_Taxable_price_service+=$value->service_price;
            $Total_sgst_service+=$value->service_sgst;
            $Total_cgst_service+=$value->service_cgst;
            $Total_igst_service+=$value->service_igst;
            $Total_price_service+=$Total_Taxable_price_service+$Total_sgst_service+$Total_cgst_service+$Total_igst_service;
            // $Total_service_gst=$Total_sgst_service+$Total_cgst_service+$Total_igst_service;
	 		@endphp
	 	</tr>
	 	@endforeach
	<tr></tr>
	 		<td>Total</td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td>@php echo $TotalServicePrice @endphp</td>
	 		
	 		<td>@php echo $Total_sgst_service @endphp</td>
	 		<td>{{ $SgstAmount }}</td>
	 		<td>@php echo $Total_cgst_service @endphp</td>
	 		<td>{{ $CgstAmount }}</td>
	 		<td>@php echo $Total_igst_service @endphp</td>
	 		<td>{{ $IgstAmount }}</td>
	 		<td>@php echo $GrandTotalPriceForOneService @endphp</td>
	    </tr>
	   	@php
use NumberToWords\NumberToWords;
$numberToWords = new NumberToWords();
$numberTransformer = $numberToWords->getNumberTransformer('en');
$TotaPart=$total_price=$row+$sgst_t+$cgst_t+$igst_t;
$forPay=($GrandTotalPriceForOneService+$TotaPart);
					@endphp
	 	<tr>
	 		<td colspan="9" height="80px">Invoice Value :(In Words):{{ $numberTransformer->toWords($forPay) }}@php
						if($is_complete==0)
						{
							echo "<b>(Estimated Price)</b>";
						}
						@endphp
	 		</td>
	 		<td colspan="7" rowspan="2" style="font-size: 13px" align="center">
	 	          LABOUR TOTAL :@php 
	 	          echo number_format($GrandTotalPriceForOneService,2, '.', '');
	 	           @endphp<br>
	 	         
	 		      
	 		      PART TOTAL :@php 
	 		      $TotaPart=$total_price=$row+$sgst_t+$cgst_t+$igst_t;
	 		       $totalSGST= $SgstAmount+$sgst_t;
	 		      echo number_format($TotaPart,2, '.', ''); @endphp<br>
	 		      
	 		      SGST/UTGST : @php 
	 		      // echo   $SgstAmount."+".$sgst_t;
	 		      // echo "<br/>";
	 		       echo number_format($totalSGST,2, '.', '');
	 		      
	 		      @endphp<br>
	 		      @php
						 $balancePrice = ($GrandTotalPriceForOneService+$TotaPart)-($installmentPayment+$paid_price);
						 $totalCGST=$CgstAmount+$cgst_t;
						 $totalIGST=$IgstAmount+$igst_t;
						@endphp
	 		      
	 		      CGST :@php  echo  number_format($totalCGST,2, '.', '');  @endphp<br>
	 		      
	 		      IGST : @php echo number_format($totalIGST,2, '.', '');  @endphp<br>
	 		      
	 		      GRAND TOTAL :@php 
	 		      $balanceT=$balancePrice-$discount_price;
	 		      $GrandTotal= $TotaPart+$GrandTotalPriceForOneService;
	 		      $Paid= $installmentPayment+$paid_price;
	 		      echo number_format($GrandTotal,2, '.', ''); @endphp<br>
	 		      {{-- PART TOTAL(Rounded Off) :@php echo $TotaPart+$GrandTotalPriceForOneService; @endphp<br> --}}
	 		  		Paid :{{ number_format($Paid,2, '.', '') }}<br>
						{{-- Discount : {{ number_format($discount_price,2) }}<br> --}}
						Balance : {{ number_format($balanceT,2, '.', '') }}<br>
	 		      
	 		      </td>
	 	</tr>
	 	<tr>
	 		<td colspan="6" height="80px">Customer's Signature</td>
	 		<td colspan="3">For WorldGyan Project<br><br><br>
	 			Authorised Signature
	 		</td>
	 	</tr>
	 </table>
</body>
<script src="{{ asset('bootstrap-4.1.3/dist/js/bootstrap.js') }}"></script>
<script type="text/javascript">
	$.ajax({
        type:"POST",
        url: "{{url('/')}}/ajax/updateWorkshopBalance",
        data:{
          "_token": "{{ csrf_token() }}",
          workshop_id:{{ $id }},
          balance : {{ $balancePrice-$discount_price }},
          grandTotal : {{  $TotaPart+$GrandTotalPriceForOneService }}
        },
        dataType : 'html',
        cache: false,
        success: function(data){
        console.log("Workshop Balance Updated Successfully")
        }
      });
</script>
</html>
