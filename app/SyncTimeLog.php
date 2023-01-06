<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class SyncTimeLog extends Model{
    protected $table = "sync_time_log";
    protected $guarded = ['id'];
    
    
}