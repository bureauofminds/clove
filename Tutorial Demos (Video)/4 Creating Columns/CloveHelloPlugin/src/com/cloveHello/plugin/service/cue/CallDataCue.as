package com.cloveHello.plugin.service.cue
{
	import com.cloveHello.plugin.service.vo.MessageVO;
	import com.spice.utils.queue.cue.StateCue;
	
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	[Event("complete")]
	
	public class CallDataCue extends StateCue
	{
		
		//--------------------------------------------------------------------------
   	    //
        //  Private Variables
        //
        //--------------------------------------------------------------------------

		private var _data:Array;
		private var _start:int;
		private var _length:Number;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
        
        /**
		 */
		 
		public function CallDataCue(start:int,length:Number = 50)
		{
			_start = start;
			_length = length;
		}
		
		//--------------------------------------------------------------------------
   	    //
        //  Getters / Setters
        //
        //--------------------------------------------------------------------------

		
		/**
		 */
		
		public function get data():Array
		{
			return this._data;
		}
		
		//--------------------------------------------------------------------------
   	    //
        //  Public Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		override public function init():void
		{
			super.init();
			
			var n:Number = _start + _length;
			
			var data:Array = [];
			
			var now:Date = new Date();
			
			
			for(var i:int = _start; i < n; i++)
			{
				data.push(new MessageVO(i.toString(),"Title - "+i,"Message -"+i,new Date(now.getTime() - 1000*60*60*24*i)));	
			}
			
			this._data = data;
			
			flash.utils.setTimeout(onTimeout,1000);
			
		}
		
		
		//--------------------------------------------------------------------------
   	    //
        //  Private Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		private function onTimeout():void
		{
			
			this.dispatchEvent(new Event(Event.COMPLETE));
			
			
			this.complete();
		}

	}
}