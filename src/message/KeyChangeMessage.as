package message {
	public class KeyChangeMessage {
		public var intervalSize:int; // -1 or 1
		public var keyIndex:int;     // 1 to 12
		public var keyName:String;   // C, C#/Db, D, D#/Eb, E, F, F#/Gb, G, G#/Ab, A, A#/Bb, B
		
		public static const INTERVAL:String = "interval";
		public static const NAME:String = "name";
		public static const INDEX:String = "index";
		
		[Selector]
		public var selector:String;
		
		public function KeyChangeMessage(selector:String, intervalSize:int = 0, keyName:String = null, keyIndex:uint = 0) {
			this.selector = selector;
			if (intervalSize != 0)
				this.intervalSize = intervalSize;
			if (keyName) 
				this.keyName = keyName;
			if (keyIndex != 0)
				this.keyIndex = keyIndex;
		}
		
		public static function byInterval(intervalSize:int):KeyChangeMessage {
			return new KeyChangeMessage(KeyChangeMessage.INTERVAL, intervalSize);
		}
		public static function byKeyName(keyName:String):KeyChangeMessage {
			return new KeyChangeMessage(KeyChangeMessage.NAME, 0, keyName);
		}
		public static function byKeyIndex(keyIndex:uint):KeyChangeMessage {
			return new KeyChangeMessage(KeyChangeMessage.INDEX, 0, null, keyIndex);
		}
		
	}
}