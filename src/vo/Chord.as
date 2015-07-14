/**
 * Created by rodnolan on 15-07-12.
 */
package vo {
	import flash.utils.Dictionary;

	public class Chord {
		private var _name:String;
		private var _toneNumber:uint;

		public function toString():String {
			return this.name + "(" + this.toneNumber + ")";
		}

		public function Chord(toneNumber:uint, letterName:String) {
			if (toneNumber > 7) {
				throw new Error("invalid value for scale degree")
			}
			this._toneNumber = toneNumber;
			this._name = letterName;
		}

		[Bindable]
		public function get name():String {
			return this._name;
		}

		[Bindable]
		public function get romanNumeral():String {
			return Chord.ROMAN_NUMERALS[this.toneNumber];
		}

		[Bindable]
		public function get toneNumber():uint {
			return this._toneNumber;
		}

		[Bindable]
		public function get toneName():String {
			return Chord.TONES[this.toneNumber];
		}

		private static const ROMAN_NUMERALS:Dictionary = new Dictionary();
		Chord.ROMAN_NUMERALS[1] = "I";
		Chord.ROMAN_NUMERALS[2] = "ii";
		Chord.ROMAN_NUMERALS[3] = "iii";
		Chord.ROMAN_NUMERALS[4] = "IV";
		Chord.ROMAN_NUMERALS[5] = "V";
		Chord.ROMAN_NUMERALS[6] = "vi";
		Chord.ROMAN_NUMERALS[7] = "vii";

		private static const TONES:Dictionary = new Dictionary();
		Chord.TONES[1] = "tonic";
		Chord.TONES[2] = "supertonic";
		Chord.TONES[3] = "mediant";
		Chord.TONES[4] = "subdominant";
		Chord.TONES[5] = "dominant";
		Chord.TONES[6] = "superdominant";
		Chord.TONES[7] = "leading tone";
	}
}
