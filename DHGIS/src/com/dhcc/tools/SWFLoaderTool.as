package com.dhcc.tools
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	import com.dhcc.event.SWFLoaderEvent;
	//import cn.com.dhcc.system.configManager;
	
	public class SWFLoaderTool
	{
		private var curLoadSWFCnt:int=0;
		
		private var eventdispacher:EventDispatcher;
		
		private var swfDir:Dictionary=new Dictionary();
		
		
		
		 
		
		public function SWFLoaderTool(Cfgxml:XML,dispacher:EventDispatcher)

		{
			this.eventdispacher=dispacher;
						
			var swfList:XMLList=Cfgxml.SWFLoader.SWF;
			
			
			curLoadSWFCnt=swfList.length();
			
			for each(var swf_node:XML in swfList)
			{
				var swfloader:Loader=new Loader();
				
				var context:LoaderContext=new LoaderContext(false,ApplicationDomain.currentDomain,null);
				
				//swfloader.contentLoaderInfo.addEventListener(Event.COMPLETE,swfloadCompleted);
				
				//swfloader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrHandler); //addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrHandler);
				//localStorage.clear();
				var swfName:String=swf_node.@name;
				
				//if(null==configManager.config.LoadSWFDic[swfName])
				//{
					//configManager.config.LoadSWFDic[swfName]=swfloader;
					var swfpath:String=swf_node.@path;
					var dataStr:String=null;
					swfDir[swfpath]=swfName;
					var req:URLRequest=new URLRequest(swfpath);	
					req.contentType = "application/octet-stream";
					swfloader.load(req,context);
				//}
				/*
				else
				{
					LoadEnd();
					
				}*/
			}
		}
		
		protected function ioErrHandler(e:IOErrorEvent):void
		{
			
			LoadEnd();
		}
		
		private function LoadEnd():void
		{
			
			curLoadSWFCnt--;
			
			if(curLoadSWFCnt==0)
			{
				this.dispatchEvent(new SWFLoaderEvent(SWFLoaderEvent.SwfLoaderEnd));
			}
		}
		
		/**
		 *  swf资源加载完成时的回调函数
		 *  @langversion 4.5
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.1
		 *  @productversion HuituAppFramework 1.0
		 */
		protected function swfloadCompleted(e:Event):void
		{
			LoadEnd();
		}
		
		/**
		 *  WSEvent事件发布
		 *  @langversion 4.5
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.1
		 *  @productversion HuituAppFramework 1.0
		 */
		public function dispatchEvent(event:Event):void
		{
			
			eventdispacher.dispatchEvent(event);
		}
		
		/**
		 *  添加事件监听回调函数
		 *  @langversion 4.5
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.1
		 *  @productversion HuituAppFramework 1.0
		 */
		public function addEventListener(type:String,fun:Function):void
		{
			eventdispacher.addEventListener(type,fun);

		}
		
		/**
		 *  移除事件监听回调函数
		 *  @langversion 4.5
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.1
		 *  @productversion HuituAppFramework 1.0
		 */
		public function removeEventListener(type:String,fun:Function):void
		{
			eventdispacher.removeEventListener(type,fun);
		}
	}


}