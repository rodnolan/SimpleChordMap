package model {

import flash.utils.Dictionary;
import vo.Chord;

public class KeysModel {
		public var chromaticScale:Array;
		public var chordsForKey:Dictionary;
		public var currentKeyIndex:uint;

		public function KeysModel() {
			chromaticScale = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"];
			chordsForKey = new Dictionary();
			chordsForKey["C"] =
					[
						chord(1, "C"),
						chord(2, "Dm"),
						chord(3, "Em"),
						chord(4, "F"),
						chord(5, "G"),
						chord(6, "Am"),
						chord(7, "Bdim")
					];

			chordsForKey["Db"] =
					[
						chord(1, "Db"),
						chord(2, "Ebm"),
						chord(3, "Fm"),
						chord(4, "Gb"),
						chord(5, "Ab"),
						chord(6, "Bbm"),
						chord(7, "Cdim")
					];

			chordsForKey["D"] =
					[
						chord(1, "D"),
						chord(2, "Em"),
						chord(3, "F#m"),
						chord(4, "G"),
						chord(5, "A"),
						chord(6, "Bm"),
						chord(7, "C#dim")
					];

			chordsForKey["Eb"] =
					[
						chord(1, "Eb"),
						chord(2, "Fm"),
						chord(3, "Gm"),
						chord(4, "Ab"),
						chord(5, "Bb"),
						chord(6, "Cm"),
						chord(7, "Ddim")
					];

			chordsForKey["E"] =
					[
						chord(1, "E"),
						chord(2, "F#m"),
						chord(3, "G#m"),
						chord(4, "A"),
						chord(5, "B"),
						chord(6, "C#m"),
						chord(7, "D#dim")
					];

			chordsForKey["F"] =
					[
						chord(1, "F"),
						chord(2, "Gm"),
						chord(3, "Am"),
						chord(4, "Bb"),
						chord(5, "C"),
						chord(6, "Dm"),
						chord(7, "Edim")
					];

			chordsForKey["Gb"] =
					[
						chord(1, "Gb"),
						chord(2, "Abm"),
						chord(3, "Bbm"),
						chord(4, "C"),
						chord(5, "D"),
						chord(6, "Ebm"),
						chord(7, "Fdim")
					];

			chordsForKey["G"] =
					[
						chord(1, "G"),
						chord(2, "Am"),
						chord(3, "Bm"),
						chord(4, "C"),
						chord(5, "D"),
						chord(6, "Em"),
						chord(7, "F#dim")
					];

			chordsForKey["Ab"] =
					[
						chord(1, "Ab"),
						chord(2, "Bbm"),
						chord(3, "Cm"),
						chord(4, "Db"),
						chord(5, "Eb"),
						chord(6, "Fm"),
						chord(7, "Gdim")
					];

			chordsForKey["A"] =
					[
						chord(1, "A"),
						chord(2, "Bm"),
						chord(3, "C#m"),
						chord(4, "D"),
						chord(5, "E"),
						chord(6, "F#m"),
						chord(7, "G#dim")
					];

			chordsForKey["Bb"] =
					[
						chord(1, "Bb"),
						chord(2, "Cm"),
						chord(3, "Dm"),
						chord(4, "Eb"),
						chord(5, "F"),
						chord(6, "Gm"),
						chord(7, "Adim")
					];

			chordsForKey["B"] =
					[
						chord(1, "B"),
						chord(2, "C#m"),
						chord(3, "D#m"),
						chord(4, "E"),
						chord(5, "F#"),
						chord(6, "G#m"),
						chord(7, "A#dim")
					];

			// although the dim chord (vii∘) isn't used, it's included for completeness
			// must confirm accuracy of that ∘ chord for the b keys
			currentKeyIndex = 0;
		}

		private function chord(toneNumber:uint, letterName:String):Chord {
			return new Chord(toneNumber, letterName);
		}

		public function getChordForKeyAndNumber(key:String, number:uint):Chord {
			return chordsForKey[key][number];
		}
	}
}