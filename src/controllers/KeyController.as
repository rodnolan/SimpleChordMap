package controllers {
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import message.KeyChangeRequestedMessage;
	import message.KeyChangedMessage;
	
	import model.KeysModel;

	public class KeyController {
		
		[Inject]
		public var keysModel:KeysModel;
				
		[MessageDispatcher]
		public var dispatcher:Function;

		public function handleKeyDown(event:KeyboardEvent):void {
			var keyCode:int = event.keyCode;
			trace("the controller is in control of " + keyCode);
			
			switch (keyCode) {
				case Keyboard.C : 
				case Keyboard.D : 
				case Keyboard.E : 
				case Keyboard.F :  
				case Keyboard.G : 
				case Keyboard.A :  
				case Keyboard.B : 
					dispatcher(KeyChangeRequestedMessage.byKeyName(String.fromCharCode(keyCode)));
					break;
				
				case 188 : // < == b
					dispatcher(KeyChangeRequestedMessage.byInterval(-1));
					break;
				
				case 190 : // > == #
					dispatcher(KeyChangeRequestedMessage.byInterval(1));
					break;
				
				case 37 : // LEFT
				case 40 : // DOWN
					dispatcher(KeyChangeRequestedMessage.byInterval(-1));
					break;
				
				case 38 : // UP
				case 39 : // RIGHT
					dispatcher(KeyChangeRequestedMessage.byInterval(1));
					break;
				
				case 49 : // 1 == C
				case 50 : // 2 == Db
				case 51 : // 3 == D
				case 52 : // 4 == Eb
				case 53 : // 5 == E
				case 54 : // 6 == F
				case 55 : // 7 == Gb
				case 56 : // 8 == G
				case 57 : // 9 == Ab
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(keyCode - 49));
					break;
				
				case 48 : // 0 == A
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(9));
					break;
				
				case 189 : // 11 or - == Bb
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(10));
					break;
				
				case 187 : // 12 or = == B
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(11));
					break;
			}
		}

		[MessageHandler(selector="interval")]
		public function keyChangeByInterval(event:KeyChangeRequestedMessage):void {
			var intervalSize:int = event.intervalSize;
			if (intervalSize < 0) { // going backwards
				if (keysModel.currentKeyIndex > 0) {
					keysModel.currentKeyIndex--;
				} else { 
					keysModel.currentKeyIndex = keysModel.chromaticScale.length-1;
				}
			} else if (intervalSize > 0) { // going forwards
				if (keysModel.currentKeyIndex < keysModel.chromaticScale.length-1) {
					keysModel.currentKeyIndex++;
				} else { 
					keysModel.currentKeyIndex = 0;
				}					
			}
			broadcastKeyChanged();
		}
		
		[MessageHandler(selector="name")]
		public function keyChangeByName(event:KeyChangeRequestedMessage):void {
			keysModel.currentKeyIndex = keysModel.chromaticScale.indexOf(event.keyName);
			broadcastKeyChanged();
		}
		[MessageHandler(selector="index")]
		public function keyChangeByIndex(event:KeyChangeRequestedMessage):void {
			keysModel.currentKeyIndex = event.keyIndex;
			broadcastKeyChanged();
		}
		
		private function broadcastKeyChanged():void {
			var crdNamesForSelectedKey:Array;
			if (keysModel.currentKeyIndex >= 0 && keysModel.currentKeyIndex < keysModel.chromaticScale.length) {
				crdNamesForSelectedKey = keysModel.chordsForKey[keysModel.chromaticScale[keysModel.currentKeyIndex]];
				dispatcher(new KeyChangedMessage(crdNamesForSelectedKey, keysModel.currentKeyIndex));
			} else {
				trace('coud not get chords for the requested key');
			}
		}
	}
}