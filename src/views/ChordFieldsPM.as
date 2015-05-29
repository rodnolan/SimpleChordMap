package views {
	import controllers.KeyController;
	
	import flash.events.KeyboardEvent;
	
	import message.KeyChangeRequestedMessage;

	public class ChordFieldsPM {
		
		import message.KeyChangedMessage;
		
		private var view:ChordFields;
		private var fieldNames:Array; 

		[Inject]
		public var ctrlr:KeyController;

		[MessageDispatcher]
		public var dispatcher:Function;

		public function init(view:ChordFields):void {
			this.view = view;
			fieldNames = [ "crdN1", "crdN2", "crdN3", "crdN4", "crdN5", "crdN6" ];
			
			// this message populates the chords at startup
			dispatcher(KeyChangeRequestedMessage.byKeyIndex(0));
			
			view.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			
			// and this allows keystrokes to be recognized at startup
			view.setFocus();
		}
		
		private function onKeyDown(event:KeyboardEvent):void {
			ctrlr.handleKeyDown(event);
		}
		
		[MessageHandler]
		public function updateChordNames(msg:KeyChangedMessage):void {
			trace("updating the chords in the UI with " + msg.chords);
			var crdNamesForSelectedKey:Array = msg.chords;
			fieldNames.forEach(function (item:*, index:int, array:Array):void {
				trace(item + " is at index " + index);
				this[item] = crdNamesForSelectedKey[index];
			}, view);
		}
	}	
}