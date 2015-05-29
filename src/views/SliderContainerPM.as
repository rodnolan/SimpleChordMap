package views {
	import controllers.KeyController;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import message.KeyChangeRequestedMessage;
	import message.KeyChangedMessage;
	
	import model.KeysModel;
	
	import mx.events.SliderEvent;

	public class SliderContainerPM {
		
		private var view:SliderContainer;
		
		[Bindable]
		[Inject]
		public var keysModel:KeysModel;
		
		[Inject]
		public var ctrlr:KeyController;

		[MessageDispatcher]
		public var dispatcher:Function;

		public function init(view:SliderContainer):void {
			this.view = view;
			
			view.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			view.keySlider.addEventListener(SliderEvent.CHANGE, onSliderChange);
			view.keySlider.dataTipFormatFunction = keySliderDataTipFormatter;
		}
		
		private function onKeyDown(event:KeyboardEvent):void {
			ctrlr.handleKeyDown(event);
		}
		
		private function onSliderChange(event:Event):void {
			keysModel.currentKeyIndex = event.target.value;
			dispatcher(KeyChangeRequestedMessage.byKeyIndex(keysModel.currentKeyIndex));
		}
		
		private function keySliderDataTipFormatter(value:Number):Object {
			return keysModel.chromaticScale[view.keySlider.value]; 
		}
		
		[MessageHandler]
		public function updateSliderValue(msg:KeyChangedMessage):void {
			trace("updating the slider to reflect the current key " + msg.keyIndex);
			this.view.keySlider.value = msg.keyIndex;
		}
	}
}