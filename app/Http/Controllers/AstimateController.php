<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Estimate;
use App\Product;
use App\Service; 
use DB; 
use App\WorkshopProduct;
use App\EstimatedService;
use App\Modal;
use App\Brand;
use App\ServiceType;
use App\HeaderLink;
use Mail;
use App\Mail\SendMailToCustomer;
use App\Jobs\SendEMailJob;
use App\Customer;
use App\CustomerDebitLog;
use App\VehicleDetail;
use Auth;
use App\EstimatedProduct;

class AstimateController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
         $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
    }
    public function save(Request $request, $id = null)
    {
        $viewData['pageTitle'] = 'Add Workshop'; 
        $viewData['product'] = Product::pluck('product_name', 'id');
        $viewData['service'] = Service::pluck('service_name', 'id');
        $viewData['model_select'] = Modal::pluck('model_name', 'id');
        $viewData['brand_select'] = Brand::pluck('brand_name', 'id');
        $viewData['ServiceType'] = ServiceType::pluck('service_type_name', 'id');
        $viewData['registered_vehicle_select'] = VehicleDetail::pluck('vehicle_reg_number', 'vehicle_reg_number');
        $viewData['customerNameSelect'] = Customer::pluck('customer_name', 'id');
        $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
        // This if condition for fill detail for update otherwise for save and update 
        if(isset($id) && $id != null ){
            $getFormAutoFillup = Estimate::whereId($id)->first()->toArray();
              $viewData['workshopProductData']= EstimatedProduct::where('workshop_id_es','=',$id)->get();
              $viewData['workshopServiceData']= EstimatedService::where('workshop_id','=',$id)->get();
            return view('SaiAutoCare.estimated.add', $viewData)->with($getFormAutoFillup);
        }
        else if((!isset($id) && $id == null) && !$request->isMethod('post') )
        {
            return view('SaiAutoCare.estimated.add', $viewData);
        }
        else {
             // This if condition for fill detail for  update otherwise for  save 
            if ($request->isMethod('post')){
                $getFormAutoFillup = array();               
                if(isset($request->id) && $request->id != null) 
                {
                    if ($request->isMethod('post')){
                        $PartyManage=    request()->except(['_token','service_id','product_id_es','product_id','service_quantity','product_quantity_es','product_quantity','service_type','service_price','product_price_es','product_price','workshop_product_brand_es','workshop_product_model_es','workshop_service_brand','workshop_service_model','service_type_id']);
                       
                        if(Estimate::where([['id', '=', $request->id]])->update($PartyManage)){
 
                             EstimatedProduct::where('workshop_id_es',$request->id)->forceDelete();
                            EstimatedService::where('workshop_id',$request->id)->forceDelete();
                             if(isset($request->product_id_es[0]) && $request->product_id_es[0]!='')
                            {
                            //     echo  count($request->product_id_es);

                              for($i=0; $i < count($request->product_id_es); $i++){
                                        $WorkshopProduct_es= new EstimatedProduct();
                                        $WorkshopProduct_es->workshop_id_es  =  $request->id;
                                        $WorkshopProduct_es->product_id_es  = $request->product_id_es[$i];
                                        $WorkshopProduct_es->product_quantity_es  = $request->product_quantity_es[$i];
                                        $WorkshopProduct_es->product_price_es = $request->product_price_es[$i];
                                        $WorkshopProduct_es->workshop_product_brand_es    = $request->workshop_product_brand_es[$i];
                                        $WorkshopProduct_es->workshop_product_model_es    = $request->workshop_product_model_es[$i];   
                                        // echo  $request->id;;
                                        // echo "<br/>";
                                        $WorkshopProduct_es->save();
                                }   
                            }  
                        for($i=0; $i < count($request->service_id); $i++){
                                $EstimatedService= new EstimatedService();
                                $EstimatedService->workshop_id    = $request->id;
                                $EstimatedService->service_id    = $request->service_id[$i];
                                $EstimatedService->service_type_id   = $request->service_type_id[$i];            
                                $EstimatedService->service_quantity    = $request->service_quantity[$i];
                                $EstimatedService->service_price    = $request->service_price[$i];
                                $EstimatedService->workshop_service_brand  = $request->brand;
                                $EstimatedService->workshop_service_model  = $request->model_number;
                                $EstimatedService->save();
                        }
                       
                            $request->session()->flash('message.level', 'success');
                            $request->session()->flash('message.content', ' updated Successfully!');
                        }
                    }
                    $viewData['workshopId'] = $request->id;
                    // exit;
                     return redirect('/SaiAutoCare/estimation/add/'.$request->id);
                }
                else
                {
                    
                    $PartyManage =  request()->except(['_token','registered_vehicle','service_id','product_id','status','service_quantity','product_quantity','service_type','service_price','product_price','workshop_product_brand','workshop_product_model','workshop_service_brand','workshop_service_model','service_type_id','product_price_es','workshop_product_brand_es','workshop_product_model_es','workshop_service_brand_es','product_id_es','product_quantity_es']);
                     if(!isset($request->customer_id)) 
                       {
                            $CustomerSave= new Customer();
                            $CustomerSave->customer_name    = $request->name;
                            $CustomerSave->customer_contact_number    = $request->mobile;
                            $CustomerSave->customer_alt_number   = $request->landline;     
                            $CustomerSave->customer_email    = $request->email;
                            $CustomerSave->customer_address=$request->address;
                            $CustomerSave->customer_gstin    = $request->gst_no;
                            $CustomerSave->created_by=Auth::user()->id;
                            $CustomerSave->save();
                            $PartyManage['customer_id']= $CustomerSave->id;
                       }   
                    $PartyManage['status']="pending";
                    $PartyManage = new Estimate($PartyManage);
                    if($PartyManage->save()){
                        // $unit_price_exit=DB::table('purchases')->where('id', $request->product_id)->value('unit_price_exit');
                        // $gstForPurchase=DB::table('purchases')->where('id', $request->product_id)->value('gst');
                        // $price=DB::table('services')->where('id', $request->service_id)->value('price');
                        // $gstForService=DB::table('services')->where('id', $request->service_id)->value('gst');
                        
                        if(isset($request->product_id_es[0]) && $request->product_id_es[0]!='')
                        {
                          for($i=0; $i < count($request->product_id_es); $i++){
                                    $WorkshopProduct_es= new EstimatedProduct();
                                    $WorkshopProduct_es->workshop_id_es  = $PartyManage->id;
                                    $WorkshopProduct_es->product_id_es  = $request->product_id_es[$i];
                                    $WorkshopProduct_es->product_quantity_es  = $request->product_quantity_es[$i];
                                    $WorkshopProduct_es->product_price_es = $request->product_price_es[$i];
                                    $WorkshopProduct_es->workshop_product_brand_es    = $request->workshop_product_brand_es[$i];
                                    $WorkshopProduct_es->workshop_product_model_es    = $request->workshop_product_model_es[$i];    
                                    $WorkshopProduct_es->save();
                            }   
                        }
                       
                        for($i=0; $i < count($request->service_id); $i++){
                                $EstimatedService= new EstimatedService();
                                $EstimatedService->workshop_id    = $PartyManage->id;
                                $EstimatedService->service_id    = $request->service_id[$i];
                                $EstimatedService->service_type_id   = $request->service_type_id[$i];            
                                $EstimatedService->service_quantity    = $request->service_quantity[$i];
                                $EstimatedService->service_price    = $request->service_price[$i];
                                $EstimatedService->workshop_service_brand  =  $request->brand;
                                $EstimatedService->workshop_service_model  =  $request->model_number;
                                $EstimatedService->save();
                        }
                       
                       if(!isset($request->registered_vehicle)) 
                       {
                            $VehicleDetail= new VehicleDetail();
                            if(isset($CustomerSave->id))
                            {
                                 $VehicleDetail->customer_id    = $CustomerSave->id;
                            }
                            else
                            {
                                 $VehicleDetail->customer_id    = $request->customer_id;
                            }
                           
                            $VehicleDetail->workshop_id    = $PartyManage->id;
                            $VehicleDetail->vehicle_reg_number   = $request->vehicle_reg_number;     
                            $VehicleDetail->model_year    = $request->model_year;
                            $VehicleDetail->brand    =$request->brand;
                            $VehicleDetail->vin    = $request->vin;
                            $VehicleDetail->fuel_type    = $request->fuel_type;
                            $VehicleDetail->engine_number   =$request->engine_number;            
                            $VehicleDetail->company_name    = $request->company_name;
                            $VehicleDetail->reg_number    = $request->reg_number;
                            $VehicleDetail->odometer_reading    = $request->odometer_reading;
                            $VehicleDetail->color    = $request->color;
                            $VehicleDetail->due_in    = $request->due_in;
                            $VehicleDetail->due_out    = $request->due_out;
                            $VehicleDetail->key_number    = $request->key_number;
                            
                            $VehicleDetail->model_number    = $request->model_number;
                            $VehicleDetail->advisor    = $request->advisor;
                            $VehicleDetail->notes    = $request->notes;
                            $VehicleDetail->workshop_id    = $request->workshop_id;
                            $VehicleDetail->save();
                       }  
                      
                       
                        
                        $request->session()->flash('message.level', 'success');
                        $request->session()->flash('message.content', ' Saved Successfully!');
                    }
                    $viewData['registered_vehicle_select'] = VehicleDetail::pluck('vehicle_reg_number', 'vehicle_reg_number');
                     $viewData['workshopId'] = $PartyManage->id;
                     // exit;
                    return view('SaiAutoCare.estimated.add', $viewData);
                }
            }
        }
    }
   // this is for search 
    public function view(Request $request)
    {
           $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
        $viewData['model_select'] = Modal::pluck('model_name', 'id');
        $viewData['brand_select'] = Brand::pluck('brand_name', 'id');
         $viewData['customerNameSelect'] = Customer::pluck('customer_name', 'id');
        if($request->isMethod('post')) 
        {
            $viewData['pageTitle'] = 'Add Party';           
            $workshop= DB::table('estimates');
            $workshop->leftJoin('modals','modals.id','=','estimates.model_number');
            $workshop->leftJoin('brands','brands.id','=','estimates.brand');
            $getFormAutoFillup=$request->all();
            $workshop->where('workshops.deleted_at','=',null);
            if($request->has('id') && $request->id !=''){
                $workshop->where('workshops.id', '=', $request->id);
            }
            if($request->has('customer_id') && $request->customer_id !=''){
                $workshop->where('workshops.customer_id', '=', $request->customer_id);
            }
            if($request->has('created_at_from') && $request->created_at_from !=''){
                $workshop->whereDate('workshops.created_at', '<=', $request->created_at_from);
            }
            if($request->has('created_at_to') && $request->created_at_to !=''){
                $workshop->whereDate('workshops.created_at', '>=', $request->created_at_to);
            }
            if($request->has('mobile') && $request->mobile !=''){
                $workshop->where('workshops.mobile', '=', $request->mobile);
            }
            if($request->has('email') && $request->email !=''){
                $workshop->where('workshops.email', '=', $request->email);
            }
            if($request->has('vehicle_reg_number_for_search') && $request->vehicle_reg_number_for_search !=''){
                $workshop->where('workshops.vehicle_reg_number', 'like', '%'.$request->vehicle_reg_number_for_search.'%');
            }
             if($request->has('brand') && $request->brand !=''){
                $workshop->where('workshops.brand', '=', $request->brand);
            }
             if($request->has('model_number') && $request->model_number !=''){
                 $workshop->where('workshops.model_number', '=', $request->model_number);
            }
            $workshop->select('workshops.*','brands.brand_name as company_name_from_brand','modals.model_name as modelNumber');
            $workshop->orderBy('id','desc');
            $workshop= $workshop->get();
            $viewData['workshop']=json_decode(json_encode($workshop), true);
            return view('SaiAutoCare.estimated.search', $viewData)->with($getFormAutoFillup);
        }else
        {
            $viewData['pageTitle'] = 'Estimation  Details';           
            $workshop= DB::table('estimates');
            $workshop->leftJoin('modals','modals.id','=','estimates.model_number');
            $workshop->leftJoin('brands','brands.id','=','estimates.brand');
            $workshop->where('estimates.deleted_at','=',null);
            $workshop->select('estimates.*','brands.brand_name as company_name_from_brand','modals.model_name as modelNumber');
            $workshop->orderBy('estimates.id','desc');
            $workshop= $workshop->get();
            $viewData['workshop']=json_decode(json_encode($workshop), true);
            return view('SaiAutoCare.estimated.search', $viewData);
        }
      
    }
    public function trash(Request $request,$id)
    {
           $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
        if(($id!=null) && (Estimate::where('id',$id)->delete())){
            $request->session()->flash('message.level', 'warning');
            $request->session()->flash('message.content', 'Workshop was Trashed!');
            $viewData['pageTitle'] = 'Workshop';        
            $viewData['workshop'] = Workshop::paginate(10);
            return view('SaiAutoCare.estimated.search', $viewData);
        }else{
            session()->flash('status', ['danger', 'Operation was Failed!']);
            $viewData['pageTitle'] = 'Workshop';        
            $viewData['workshop'] = Workshop::paginate(10);
            return view('SaiAutoCare.estimated.search', $viewData);
       }
    
    }
    public function trashedList()
    {
           $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
         $TrashedParty = Workshop::orderBy('deleted_at', 'desc')->onlyTrashed()->simplePaginate(10);
         return view('SaiAutoCare.estimated.delete', compact('TrashedParty', 'TrashedParty'));
      
    }
    public function permanemetDelete(Request $request,$id)
    {
           $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
        if(($id!=null) && (Estimate::where('id',$id)->forceDelete())){
            $request->session()->flash('message.level', 'warning');
            $request->session()->flash('message.content', "Workshop was deleted Permanently and Can't rollback in Future!"); 
        }else{
            session()->flash('status', ['danger', 'Operation was Failed!']);
       }
         $TrashedParty = Estimate::orderBy('deleted_at', 'desc')->onlyTrashed()->simplePaginate(10);
         return view('SaiAutoCare.estimated.delete', compact('TrashedParty', 'TrashedParty'));
    }
    public function viewIndivisual($id)
    {
        $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
        $getIndivisualWorkshopDetail = Estimate::whereId($id)->first()->toArray();
  
        if($getIndivisualWorkshopDetail['is_workshop'] == 1)
        {
             $brandName=Brand::whereId($getIndivisualWorkshopDetail['brand'])->first()->toArray();
            $model_number=Modal::whereId($getIndivisualWorkshopDetail['model_number'])->first()->toArray();
            
            $viewData['brandName']=$brandName['brand_name'];
            $viewData['model_numberName']=$model_number['model_name'];
        }
       
        $workshop_products_estimateds = DB::table('estimated_products')
        ->join('products','products.id','=','estimated_products.product_id_es')
        ->select('products.product_name','estimated_products.product_quantity_es','estimated_products.product_price_es as ProductWorkshopPrice','products.hsn as ProductHsn','products.unit_price_exit as UnitExitPrice','products.gst as ProductGst','products.sgst as Productsgst','products.cgst as Productcgst','products.igst as Productigst','products.discount_value as discount_value')
        ->where('workshop_id_es',$getIndivisualWorkshopDetail['id'])->get();
         $WorkshopProduct = DB::table('workshop_products')
        ->join('products','products.id','=','workshop_products.product_id')
        ->select('products.id','products.product_name','workshop_products.product_quantity','workshop_products.product_price as ProductWorkshopPrice','products.hsn as ProductHsn','products.unit_price_exit as UnitExitPrice','products.gst as ProductGst','products.sgst as Productsgst','products.cgst as Productcgst','products.igst as Productigst','products.discount_value as discount_value')
        ->where('workshop_id',$getIndivisualWorkshopDetail['id'])->get();
        $EstimatedService = DB::table('estimated_services')
        ->join('services','services.id','=','estimated_services.service_id')
        ->where('workshop_id',$getIndivisualWorkshopDetail['id'])->get();
        $viewData['WorkshopProduct']=$WorkshopProduct;
        $viewData['WorkshopService']=$EstimatedService;
        $viewData['workshop_products_estimateds']=$workshop_products_estimateds;
        $viewData['workshopId']="";
        return view('SaiAutoCare.estimated.view',$viewData)->with($getIndivisualWorkshopDetail);
    }
    public function viewByWorkshop($id)
    {
           $viewData['header_link'] =  HeaderLink::where("menu_id",'3')->select("link_title","link_name")->orderBy('id','desc')->get();
        $getIndivisualWorkshopDetail = Workshop::whereId($id)->first()->toArray();
        $WorkshopProduct = DB::table('workshop_products')
        ->join('products','products.id','=','workshop_products.product_id')
        ->where('workshop_id',$getIndivisualWorkshopDetail['id'])->get();
        $EstimatedService = DB::table('workshop_services')
        ->join('services','services.id','=','workshop_services.service_id')
        ->where('workshop_id',$getIndivisualWorkshopDetail['id'])->get();
        $viewData['WorkshopProduct']=$WorkshopProduct;
        $viewData['EstimatedService']=$EstimatedService;
        $viewData['workshopId']="";
        return view('SaiAutoCare.estimated.view',$viewData)->with($getIndivisualWorkshopDetail);
    }
} 
