package message {
	public class KeyChangedMessage {
		
		public var selector:String;
		public var chords:Array;
		public var keyIndex:uint;
		
		public function KeyChangedMessage(chords:Array, keyIndex:uint, selector:String = "updateChordNames") {
			this.selector = selector;
			this.keyIndex = keyIndex;
			this.chords = chords;
		}
	}
}