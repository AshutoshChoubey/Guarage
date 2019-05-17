<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkshopsWithoutgst extends Model
{
  protected $guarded = ['_token','id', 'created_at', 'updated_at','deleted_at'];
	protected $dates = ['deleted_at'];
}
