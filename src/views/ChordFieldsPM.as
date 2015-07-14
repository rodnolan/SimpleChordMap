package views {
	import controllers.KeyController;

	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	import message.ChordProgressionMessage;
	import message.KeyChangeRequestedMessage;
	import message.KeyChangedMessage;

	public class ChordFieldsPM {
		private var view:ChordFields;
		private var fieldNames:Array;

		[Inject]
		public var ctrlr:KeyController;

		[MessageDispatcher]
		public var dispatcher:Function;

		public function init(view:ChordFields):void {
			this.view = view;
			fieldNames = [
				"chordRenderer1",
				"chordRenderer2a",
				"chordRenderer2b",
				"chordRenderer3",
				"chordRenderer4",
				"chordRenderer5a",
				"chordRenderer5b",
				"chordRenderer6"
			];
			fieldNames.forEach(function (item:*, index:int, array:Array):void {
				this[item].addEventListener(MouseEvent.CLICK, onChordClicked);
			}, view);

			// this message populates the chords at startup
			dispatcher(KeyChangeRequestedMessage.byKeyIndex(0));

			view.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);

			// and this allows keystrokes to be recognized at startup
			view.setFocus();
		}

		private function onKeyDown(event:KeyboardEvent):void {
			ctrlr.handleKeyDown(event);
		}

		public function onChordClicked(event:MouseEvent):void {
			dispatcher(new ChordProgressionMessage(event.currentTarget.chord));
		}

		[MessageHandler]
		public function updateChordNames(msg:KeyChangedMessage):void {
			trace("updating the chords in the UI with " + msg.chords);
			msg.chords.forEach(function (item:*, index:int, array:Array):void {
				// the names of the public properties of the view are crd1, ..., crd6
				this["crd" + (index + 1)] = item;
			}, view);
		}
	}
}