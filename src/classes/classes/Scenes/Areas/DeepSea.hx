/**
 * @author Stadler (mostly) and Ormael (choice of enemies encounters and other events)
 * Area with lvl 50-70 enemies.
 * Currently a Work in Progress.
 */

package classes.Scenes.Areas
{
import classes.*;
import classes.Scenes.API.Encounters;
import classes.Scenes.API.GroupEncounter;
import classes.Scenes.SceneLib;

use namespace CoC;

public class DeepSea extends BaseContent
{

	public function DeepSea() {
		onGameInit(init);
	}

	private var _deepSeaEncounter:GroupEncounter = null;
	public function get deepSeaEncounter():GroupEncounter {
		return _deepSeaEncounter;
	}

	private function init():void {
		_deepSeaEncounter = Encounters.group("deepsea", /*{
			player.createStatusEffect(StatusEffects.NoPlantsArea, 0, 0, 0, 0);
			CoC.instance.exploration.genericDemonsEncounters1();
		},*/ /*{
			flags[kFLAGS.SHARK_OR_TIGERSHARK_GIRL] = 1;
			player.underwaterCombatBoost();
			player.createStatusEffect(StatusEffects.NoPlantsArea, 0, 0, 0, 0);
			sharkGirlScene.oceanSharkGirlEncounter();
		},*/ /*{
			flags[kFLAGS.SHARK_OR_TIGERSHARK_GIRL] = 2;
			player.underwaterCombatBoost();
			player.createStatusEffect(StatusEffects.NoPlantsArea, 0, 0, 0, 0);
			sharkGirlScene.oceanTigersharkGirlEncounter();
		},*/ /*{
			player.createStatusEffect(StatusEffects.NoPlantsArea, 0, 0, 0, 0);
			CoC.instance.exploration.genericImpEncounters2();
		},/* /*{

		},*/ {
			name: "nothing",
			call: findNothing
		});
	}

	public function exploreDeepSea():void {
		clearOutput();
		SceneLib.exploration.counters.deepSea++;
		doNext(camp.returnToCampUseOneHour);
		deepSeaEncounter.execEncounter();
		flushOutputTextToGUI();
	}

	private function findNothing():void {
		clearOutput();
		outputText("You swim through the depths of the sea barely seeing anything for over an hour, finding nothing before you decied to give up and return to the shore.\n\n");
		if (rand(2) == 0) {
			//1/3 chance for strength
			if (rand(3) == 0 && player.str < 200) {
				outputText("The effort of struggling in the ocean depths has made you stronger.");
				dynStats("str", .5);
			}
			//1/3 chance for toughness
			else if (rand(3) == 1 && player.tou < 200) {
				outputText("The effort of struggling in the ocean depths has made you tougher.");
				dynStats("tou", .5);
			}
			//1/3 chance for speed
			else if (rand(3) == 2 && player.spe < 200) {
				outputText("The effort of struggling in the ocean depths has made you faster.");
				dynStats("tou", .5);
			}
		}
		doNext(camp.returnToCampUseTwoHours);
	}
}
}
