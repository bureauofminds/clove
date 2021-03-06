package com.spice.clove.plugin.facebook.data
{
	import com.facebook.data.users.FacebookUser;
	import com.spice.clove.plugin.column.render.RenderedColumnData;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	
	
	[Bindable]
	[RemoteClass(alias="facebook.FriendInfo")]
	public class FriendInfo
	{
		
		//--------------------------------------------------------------------------
   	    //
        //  Public Variables
        //
        //--------------------------------------------------------------------------

		public var name:String;
		public var pic_square:String;
		public var profile_url:String;
		public var friendID:String;
		public var dbid:String;
		
		
		
		private var _titleBind:ChangeWatcher;
		private var _iconBind:ChangeWatcher;
		
		//--------------------------------------------------------------------------
   	    //
        //  Private Variables
        //
        //--------------------------------------------------------------------------

		
		private var _ids:Array;
		
		
		//--------------------------------------------------------------------------
   	    //
        //  Constructor
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		 
		
		public function FriendInfo(friendID:String = null)
		{
			this.friendID = friendID;
		}
		
		//--------------------------------------------------------------------------
   	    //
        //  Public Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		public function setInfo(value:FacebookUser):void
		{
			this.name 		 = value.name;
			this.pic_square  = value.pic_square;
			this.profile_url = value.profile_url;
			this.friendID    = value.uid;
		}
		
		
		
		/**
		 */
	
		public function bindRenderedData(data:RenderedColumnData):void
		{
			
			if(_iconBind)
			{
				_iconBind.unwatch();
				_titleBind.unwatch();
				
				this._iconBind = undefined;
				this._titleBind = undefined;
			}
			
			this._titleBind = BindingUtils.bindSetter(data.setTitle,this,"name",false,true);
			this._iconBind  = BindingUtils.bindSetter(data.setIcon,this,"pic_square",false,true);
			
			//before optimization
//			this._titleBind = BindingUtils.bindProperty(data,"title",this,"name",false,true);
//			this._iconBind  = BindingUtils.bindProperty(data,"icon",this,"pic_square",false,true);
		}
		
	}
}