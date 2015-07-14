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
			trace("");
			trace("handling keyCode: [" + keyCode + "]");

			switch (keyCode) {
				case Keyboard.C :
				case Keyboard.D :
				case Keyboard.E :
				case Keyboard.F :
				case Keyboard.G :
				case Keyboard.A :
				case Keyboard.B :
					var keyName:String = String.fromCharCode(keyCode);
					trace("switching to key " + keyName);
					dispatcher(KeyChangeRequestedMessage.byKeyName(keyName));
					break;

				case 188 : // < == b
				case 37 : // LEFT
				case 40 : // DOWN
					trace("switching DOWN by one half step");
					dispatcher(KeyChangeRequestedMessage.byInterval(-1));
					break;

				case 190 : // > == #
				case 38 : // UP
				case 39 : // RIGHT
					trace("switching UP by one half step");
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
					var idx:int = keyCode - 49;
					trace("switching to index " + idx)
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(idx));
					break;

				case 48 : // 0 == A
					trace("switching to index 9")
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(9));
					break;

				case 189 : // 11 or - == Bb
					trace("switching to index 10")
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(10));
					break;

				case 187 : // 12 or = == B
					trace("switching to index 11")
					dispatcher(KeyChangeRequestedMessage.byKeyIndex(11));
					break;

				default :
					trace("[" + keyCode + "] was ignored for navigational purposes");
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
					keysModel.currentKeyIndex = keysModel.chromaticScale.length - 1;
				}
			} else if (intervalSize > 0) { // going forwards
				if (keysModel.currentKeyIndex < keysModel.chromaticScale.length - 1) {
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
				trace('could not get chords for the requested key');
			}
		}
	}
}