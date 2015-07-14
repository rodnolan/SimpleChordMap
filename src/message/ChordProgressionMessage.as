/**
 * Created by rodnolan on 15-07-11.
 */
package message {
	import vo.Chord;

	public class ChordProgressionMessage {
		public var chord:Chord;

		[Selector]
		public var selector:String;

		public function ChordProgressionMessage(chord:Chord, selector:String = "addChord") {
			this.chord = chord;
			this.selector = selector;
		}
	}
}


