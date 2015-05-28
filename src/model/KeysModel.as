package model {
	import flash.utils.Dictionary;

	public class KeysModel {
		public var chromaticScale:Array;
		public var chordsForKey:Dictionary; 

		public function KeysModel() {
			chromaticScale = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"];
			chordsForKey = new Dictionary();
			
			chordsForKey["C"] = ["C","Dm","Em","F","G","Am"];
			chordsForKey["Db"] = ["Db","Ebm","Fm","Gb","Ab","Bbm"];
			chordsForKey["D"] = ["D","Em","F#m","Gm","A","Bm"];
			chordsForKey["Eb"] = ["Eb","Fm","Gm","Ab","Bb","Cm"];
			chordsForKey["E"] = ["E","F#m","G#m","A","B","C#m"];
			chordsForKey["F"] = ["F","Gm","Am","Bb","C","Dm"];
			chordsForKey["Gb"] = ["Gb","Abm","Bbm","C","D","Ebm"];
			chordsForKey["G"] = ["G","Am","Bm","C","D","Em"];
			chordsForKey["Ab"] = ["Ab","Bbm","Cm","Db","Eb","Fm"];
			chordsForKey["A"] = ["A","Bm","C#m","D","E","F#m"];
			chordsForKey["Bb"] = ["Bb","Cm","Dm","Eb","F","Gm"];
			chordsForKey["B"] = ["B","C#m","D#m","E","F#","G#m"];
		}
		
	}
}