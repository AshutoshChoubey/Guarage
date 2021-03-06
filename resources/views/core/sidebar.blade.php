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
<div class="sidebar">
  <nav class="sidebar-nav">
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link" href="{{asset('/')}}dashboard"><i class="icon-speedometer"></i> Dashboard </a>
      </li>

      <li class="nav-title">
        Dynamic Automobile Elements
      </li>
       @php
        $role_id=Auth::user()->role_id;
      @endphp
      @if($role_id==1)
      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-address-book-o"></i> Workshop</a>
        <ul class="nav-dropdown-items">
           
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/workshop/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/workshop/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/workshop/delete')}}"><i class="icon-trash"></i> Trash  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ asset('/') }}/SaiAutoCare/customer/add "><i class="fa fa-user-plus" aria-hidden="true"></i> Customers</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/sale/add')}}"><i class="fa fa-dot-circle-o" aria-hidden="true"></i>Sale Spare</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/sale/sale_return')}}"><i class="fa fa-building" aria-hidden="true"></i></i>Return Spare Log</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href=" {{asset('/CustomerCreditDebitLog/search')}}"><i class="fa fa-inr" aria-hidden="true"></i></i> Customer Log  </a>
          </li>
        </ul>
      </li>

 <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-bullhorn"></i> Workshop WGst</a>
        <ul class="nav-dropdown-items">
           
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/workshopWTax/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/workshopWTax/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
          <li class="nav-item" style="display: none">
            <a class="nav-link" href="{{asset('/SaiAutoCare/workshop/delete')}}"><i class="icon-trash"></i> Trash  </a>
          </li>
         
           <li class="nav-item" style="display: none">
            <a class="nav-link" href="{{asset('/SaiAutoCare/sale/add')}}"><i class="fa fa-dot-circle-o" aria-hidden="true"></i>Sale Spare</a>
          </li>
          
        </ul>
      </li>

      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-tty" aria-hidden="true"></i>Estimate</a>
        <ul class="nav-dropdown-items">
           
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/estimation/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/estimation/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
        </ul>
      </li>

      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-bicycle" aria-hidden="true"></i> Supplier</a>
        <ul class="nav-dropdown-items">
           <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/supplier/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href=" {{asset('/SaiAutoCare/supplier/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href=" {{asset('/SupplierCreditDebitLog/search')}}"><i class="fa fa-snowflake-o" aria-hidden="true"></i> Supplier Log  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href=" {{asset('/SaiAutoCare/supplier/delete')}}"><i class="icon-trash"></i> Trash  </a>
          </li>
        </ul>
      </li>

      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i>Spare</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/product/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/product/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/product/delete')}}"><i class="icon-trash"></i> Trash  </a>
          </li>
        </ul>
      </li>

       <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-shopping-bag" aria-hidden="true"></i>Purchase</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/purchase/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/purchase/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/purchase/delete')}}"><i class="icon-trash"></i> Trash  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/purchase/purhase_return')}}"><i class="fa fa-snowflake-o" aria-hidden="true"></i> Purchase Return Log  </a>
          </li>
        </ul>
      </li>
      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-cogs fa-spin" aria-hidden="true"></i></i>Service</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/service/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/service/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/SaiAutoCare/service/delete')}}"><i class="icon-trash"></i> Trash  </a>
          </li>
        </ul>
      </li>
       @endif
      @if($role_id==2 || $role_id==1)
      <li class="nav-item nav-dropdown" style="display:none">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-book fa-fw" aria-hidden="true"></i>Marketing</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/marketing/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/marketing/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
            @if($role_id==1)
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/marketing/delete')}}"><i class="icon-trash"></i> Delete  </a>
          </li>
          @endif
        </ul>
      </li>
      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-inr "></i>Credit Debit Log</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/credit-debit/add')}}"><i class="fa fa-user"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/credit-debit/search')}}"><i class="fa fa-search"></i> Search  </a>
          </li>
            @if($role_id==1)
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/credit-debit/delete')}}"><i class="icon-trash"></i> Delete  </a>
          </li>
          @endif
        </ul>
      </li>
       @endif
       @if($role_id==1)
       <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-wrench" aria-hidden="true"></i>Master Entery</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/master/brands')}}"><i class="fa fa-user"></i> Brands</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/master/modal')}}"><i class="fa fa-search"></i> Model  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/master/service_name')}}"><i class="icon-trash"></i> Service Name  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/master/service_type')}}"><i class="icon-trash"></i> Serice Type  </a>
          </li>
        </ul>
      </li>
       <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-universal-access fa-spin" aria-hidden="true"></i>Multi User</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/employee')}}"><i class="fa fa-user"></i> Add User</a>
          </li>          
        </ul>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{asset('/employee-list')}}"><i class="fa fa-list"></i>User List</a>
          </li>          
        </ul>
      </li>
      @endif
      
      <!--  <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-puzzle"></i>Stock</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="/sample/buttons"><i class="icon-puzzle"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/sample/cards"><i class="icon-puzzle"></i> Search  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/sample/forms"><i class="icon-trash"></i> Trash  </a>
          </li>
        </ul>
      </li>
      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-puzzle"></i>User</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="/sample/buttons"><i class="icon-puzzle"></i> Add</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/sample/cards"><i class="icon-puzzle"></i> Search  </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/sample/forms"><i class="icon-puzzle"></i> Trash  </a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="/sample/forms"><i class="icon-puzzle"></i> Permission  </a>
          </li>
        </ul>
      </li> -->

  </nav>
  <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>
