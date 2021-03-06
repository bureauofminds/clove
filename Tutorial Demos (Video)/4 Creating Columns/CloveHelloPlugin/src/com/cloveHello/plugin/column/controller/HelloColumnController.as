package com.cloveHello.plugin.column.controller
{
	import com.cloveHello.plugin.CloveHelloPlugin;
	import com.cloveHello.plugin.column.render.HelloColumnItemRenderer;
	import com.cloveHello.plugin.service.cue.CallDataCue;
	import com.spice.clove.events.CloveColumnEvent;
	import com.spice.clove.plugin.column.control.ColumnController;
	import com.spice.clove.plugin.column.render.RenderedColumnData;
	
	import flash.events.Event;
	
	public class HelloColumnController extends ColumnController
	{
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
        
        /**
		 */
		 
		public function HelloColumnController()
		{
			super(new HelloColumnItemRenderer());
			
			this.title = "Hello Column";
		}
		
		//--------------------------------------------------------------------------
   	    //
        //  Getters / Setters
        //
        //--------------------------------------------------------------------------

		
		/**
		 */
		
		public function get plugin():CloveHelloPlugin
		{
			return CloveHelloPlugin(this.pluginController.plugin);
		}
		
		
		//--------------------------------------------------------------------------
   	    //
        //  Protected Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		override protected function onColumnStartLoad(event:CloveColumnEvent):void
		{
			this.loadOlderContent(null);
		}
        /**
		 */
		 
		override protected function loadOlderContent(data:RenderedColumnData):void
		{
			
			var start:int;
			
			if(data)
			{
				start = Number(data.rowuid);
			}
			
			var cue:CallDataCue = new CallDataCue(start);
			this.setLoadCue(cue);
			
			cue.addEventListener(Event.COMPLETE,onCueComplete);
			
			this.plugin.call(cue);
			
		}
		
		//--------------------------------------------------------------------------
   	    //
        //  Private Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		private function onCueComplete(event:Event):void
		{
			var cue:CallDataCue = CallDataCue(event.target);
			this.fillColumn(cue.data);
			
		}
		
		

	}
}