/**
 *                  系统SWF资源加载事件类
 *  版本：1.0
 *  编码：彭庆华
 *  时间：2013-07-11
 *  说明：
 *      当系统SWF资源请求过程中，资源加载状态发生改变时，将分派该事件。
 *        
 */
package com.dhcc.event
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.osmf.events.LoaderEvent;
	
	/**
	 *  SWFLoaderEvent：系统SWF资源加载事件类，当系统SWF资源请求过程中，资源加载状态发生改变时，将分派该事件。
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	public class SWFLoaderEvent extends Event
	{
		
		public static const SwfLoaderEnd:String="SwfLoaderEnd";

		/**
		 *  SWFLoaderEvent：系统SWF资源加载事件类构造函数
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function SWFLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}