/**
 * Created by rodnolan on 15-07-11.
 */
package views {
	import flash.events.MouseEvent;

	import message.ChordProgressionMessage;

	import mx.collections.ArrayCollection;

	import vo.Chord;

	public class ChordProgressionsPM {
		private var view:ChordProgressionsContainer;

		[Bindable]
		public var currentChordProgression:ArrayCollection;

		[Bindable]
		public var transposedProgression:ArrayCollection;

		public function init(view:ChordProgressionsContainer):void {
			currentChordProgression = new ArrayCollection();
			transposedProgression = new ArrayCollection();
			this.view = view;
			view.lstCurrentProgression.labelFunction = labelFunction;
			view.clearBtn.addEventListener(MouseEvent.CLICK, clearProgressions)
		}

		public function labelFunction(item:Chord):String {
			return item.romanNumeral + " - " + item.name;
		}

		private function clearProgressions(event:MouseEvent):void {
			currentChordProgression.removeAll();
		}

		[MessageHandler]
		public function addChordToProgression(msg:ChordProgressionMessage):void {
			currentChordProgression.addItem(msg.chord);
		}
	}
}
