package classes.Scenes.Areas.HighMountains
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.GlobalFlags.kFLAGS;
import classes.IMutations.*;
import classes.Scenes.SceneLib;
import classes.internals.*;

import coc.view.CoCButton;

public class Izumi extends Monster
	{
		// Set trace outout for this classes' content.
		private var combatDebug:Boolean = true;
		
		public function Izumi()
		{
			var lvlMulti:Number = flags[kFLAGS.IZUMI_LVL_UP];
			if (player.hasStatusEffect(StatusEffects.RiverDungeonA)) {
				initStrTouSpeInte(330, 230, 170, 150);
				initWisLibSensCor(150, 70, 45, 15);
				this.weaponAttack = 70;
				this.armorDef = 18;
				this.armorMDef = 14;
				this.bonusHP = 1600;
				this.bonusLust = 169;
				this.level = 50;
				this.additionalXP = 250;
			}
			else if (flags[kFLAGS.IZUMI_LVL_UP] < 1) {
				initStrTouSpeInte(280, 190, 140, 130);
				initWisLibSensCor(130, 50, 35, 15);
				this.weaponAttack = 60;
				this.armorDef = 16;
				this.armorMDef = 12;
				this.bonusHP = 1200;
				this.bonusLust = 127;
				this.level = 42;
				this.additionalXP = 200;
			}
			else if (flags[kFLAGS.IZUMI_LVL_UP] <= 3) {	//leave min and max levels to easily balance npc combat
				initStrTouSpeInte(280 + 25*lvlMulti, 190 + 20*lvlMulti, 140 + 15*lvlMulti, 130 + 10*lvlMulti);
				initWisLibSensCor(130 + 10*lvlMulti, 50 + 10*lvlMulti, 35 + 5*lvlMulti, 15);
				this.weaponAttack = 60 + 5*lvlMulti;
				this.armorDef = 16 + lvlMulti;
				this.armorMDef = 12 + lvlMulti;
				this.bonusHP = 1200 + 200*lvlMulti;
				this.bonusLust = 127 + 21*lvlMulti;
				this.level = 42 + 6*lvlMulti;
				this.additionalXP = 200 + 25*lvlMulti;
			}
			else if (flags[kFLAGS.IZUMI_LVL_UP] <= 7) {
				lvlMulti -= 6;
				initStrTouSpeInte(385 + 30*lvlMulti, 275 + 25*lvlMulti, 205 + 20*lvlMulti, 110 + 10*lvlMulti);
				initWisLibSensCor(110 + 10*lvlMulti, 30 + 10*lvlMulti, 25 + 5*lvlMulti, 15);
				this.weaponAttack = 80 + 10*lvlMulti;
				this.armorDef = 23 + lvlMulti;
				this.armorMDef = 16 + lvlMulti;
				this.bonusHP = 2000 + 200*lvlMulti;
				this.bonusLust = 211 + 21*lvlMulti;
				this.level = 66 + 6*lvlMulti;
				this.additionalXP = 300 + 50*lvlMulti;
			}
			else if (flags[kFLAGS.IZUMI_LVL_UP] == 8) {
				initStrTouSpeInte(510, 405, 290, 220);
				initWisLibSensCor(220, 140, 80, 15);
				this.weaponAttack = 125;
				this.armorDef = 30;
				this.armorMDef = 20;
				this.bonusHP = 3000;
				this.bonusLust = 295;
				this.level = 90;
				this.additionalXP = 500;
			}
			else if (flags[kFLAGS.IZUMI_LVL_UP] == 9) {
				initStrTouSpeInte(545, 460, 315, 240);
				initWisLibSensCor(240, 160, 90, 15);
				this.weaponAttack = 140;
				this.armorDef = 32;
				this.armorMDef = 21;
				this.bonusHP = 3400;
				this.bonusLust = 316;
				this.level = 96;
				this.additionalXP = 550;
			}//level up giving 2x all growns and so follow next level ups's as long each npc break lvl 100 (also makes npc use new better gear)
			if (player.hasStatusEffect(StatusEffects.RiverDungeonA)) {
				this.a = "the ";
				this.short = "mist Oni";
				this.long = "You're fighting the immense Mist Oni. Standing around 11 feet tall and wielding little more than her fists, she is the picture of strength and power. She is clad in a scandalous blue and white Kimono, the garment drawing your eyes to her humongous breasts, and her perfectly sculpted thighs. A curious horns juts from her head, the texture of it almost lost amongst the rock lining the inside of the cave. On her exposed skin you could see faint glimer of purple lines.";
				this.gems = 100 + rand(25);
				this.drop = new ChainedDrop().add(armors.SPKIMO, 0.1)
						.add(necklaces.OBNECK, 0.1)
						.add(consumables.ONISAKE, 0.5)
						.add(useables.PCSHARD, 1);
				this.createPerk(PerkLib.JobBrawler, 0, 0, 0, 0);
				this.createPerk(PerkLib.EpicToughness, 0, 0, 0, 0);
				this.createPerk(PerkLib.Regeneration, 0, 0, 0, 0);
				this.createPerk(PerkLib.LegendaryStrength, 0, 0, 0, 0);
			}
			else {
				this.a = "";
				this.short = "Izumi";
				this.long = "You're fighting the immense Oni, Izumi.  Standing around 11 feet tall and wielding little more than her fists, she is the picture of strength and power.  She is clad in a scandalous blue and white Kimono, the garment drawing your eyes to her humongous breasts, and her perfectly sculpted thighs.  A curious horns juts from her head, the texture of it almost lost amongst the rock lining the inside of the cave.\n\nA distinctly cocky grin is painted across her face, her undivided attention focused upon you.";
				this.gems = 50 + rand(50);
				this.drop = new ChainedDrop().add(armors.SPKIMO,1/10)
						.add(necklaces.OBNECK,1/5)
						.elseDrop(consumables.ONISAKE);
			}
			this.imageName = "izumi";
			// this.plural = false;
			this.createVagina(false, VaginaClass.WETNESS_SLICK, VaginaClass.LOOSENESS_NORMAL);
			createBreastRow(Appearance.breastCupInverse("GG")); // The doc mentions her breasts would be around D/DD on a "normal human" so err, winging this shit
			this.ass.analLooseness = AssClass.LOOSENESS_TIGHT;
			this.ass.analWetness = AssClass.WETNESS_DRY;
			this.tallness = 132;
			this.hips.type = Hips.RATING_AVERAGE+1;
			this.butt.type = Butt.RATING_TIGHT+1;
			this.bodyColor = "creamy-white";
			this.hairColor = "golden";
			this.hairLength = 25;
			this.weaponName = "fist";
			this.weaponVerb="punch";
			this.armorName = "silken kimono";
			this.lust = 10;
			this.lustVuln = 0.33;
			this.createPerk(PerkLib.JobWarrior, 0, 0, 0, 0);
			this.createPerk(PerkLib.EpicStrength, 0, 0, 0, 0);
			this.createPerk(PerkLib.UniqueNPC, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 1) this.createPerk(PerkLib.JobBrawler, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 2) this.createPerk(PerkLib.EpicToughness, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 3) this.createPerk(PerkLib.Regeneration, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 4) this.createPerk(PerkLib.LegendaryStrength, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 5) this.createPerk(PerkLib.JobGuardian, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 6) this.createPerk(PerkLib.LegendaryToughness, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 7) this.createPerk(PerkLib.PrestigeJobBerserker, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 8) this.createPerk(PerkLib.MythicalStrength, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 9) IMutationsLib.OniMusculatureIM.acquireMutation(this, "none");
			checkMonster();
		}

		override public function changeBtnWhenBound(btnStruggle:CoCButton, btnBoundWait:CoCButton):void{
			if (player.hasStatusEffect(StatusEffects.Titsmother)) {
				btnStruggle.call(titSmotherStruggle);
				btnBoundWait.call(titSmotherWait);
			}
			else if (player.hasStatusEffect(StatusEffects.Chokeslam)) {
				btnStruggle.call(chokeSlamStruggle);
				btnBoundWait.call(chokeSlamWait);
			}
		}

		// Override won/lost calls
		override public function defeated(hpVictory:Boolean):void
		{
			if (player.hasStatusEffect(StatusEffects.RiverDungeonA)) cleanupAfterCombat();
			else {
				this.cleanup();
				SceneLib.mountain.izumiScenes.touchThatFluffyHorn();
			}
		}
		
		// Monster won, not player, gg for descriptive method names
		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (player.hasStatusEffect(StatusEffects.RiverDungeonA)) SceneLib.dungeons.riverdungeon.defeatedByMistOni();
			else {
				flags[kFLAGS.IZUMI_TIMES_LOST_FIGHT]++;
				this.cleanup();
				if (player.hasStatusEffect(StatusEffects.Titsmother))
					SceneLib.mountain.izumiScenes.deathBySnuSnuIMeanGiantOniTits();
				else
					SceneLib.mountain.izumiScenes.fuckedUpByAFuckhugeOni();
			}
		}
		
		// Override combat AI
		override protected function performCombatAction():void
		{
			// Handle chokeslam mechanics
			if (player.hasStatusEffect(StatusEffects.Chokeslam))
			{
				if (combatDebug) trace("ChokeSlam Rounds to Damage: " + player.statusEffectv1(StatusEffects.Chokeslam));
				
				player.addStatusValue(StatusEffects.Chokeslam,1,-1);
				
				if (player.statusEffectv1(StatusEffects.Chokeslam) <= 0)
				{
					chokeSlamDamage();
					cleanupChokeslam();
				}
				
				return;
			}
			
			// Handle titsmother
			if (player.hasStatusEffect(StatusEffects.Titsmother))
			{
				return;
			}
			
			// Titsmother toggle; gonna need to play with this, it should only be used once per fight
			if (this.HPRatio() <= 0.25)
			{
				if (!this.hasStatusEffect(StatusEffects.UsedTitsmother))
				{
					trace("Could use titsmother...");
				}
			}
			
			if ((this.HPRatio() <= 0.25) && (!this.hasStatusEffect(StatusEffects.UsedTitsmother)))
			{
				if (combatDebug) trace("Using Titsmother!");
				titSmother();
				this.createStatusEffect(StatusEffects.UsedTitsmother, 0, 0, 0, 0);
			}
			else
			{
				var actions:Array = [straightJab, straightJab, straightJab, roundhouseKick, roundhouseKick, roundhouseKick, chokeSlam];
				
				if (!player.hasStatusEffect(StatusEffects.Groundpound))
				{
					actions.push(groundPound);
					actions.push(groundPound);
				}
				
				actions[rand(actions.length)]();
			}
		}
		
		// Remove any lingering effects from the player once combat is over
		public function cleanup():void
		{
			if (combatDebug) trace("Cleaning up lingering effects...");
			cleanupChokeslam();
			cleanupTitsmother();
		}
		
		private function oniname():String {
			if (player.hasStatusEffect(StatusEffects.RiverDungeonA)) return "Mist Oni";
			else return "Izumi";
		}
		
		// Quick punch at the player
		// Light damage
		public function straightJab():void
		{
			outputText("Quick as a flash, " + oniname() + " lashes out with her free hand, aiming for your head.");
			var damage:int = int((str + 175) - rand(player.tou) - player.armorDef);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 2) damage += 50;
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 6) damage += 50;
			if (player.getEvasionRoll())
			{
				outputText("  You deftly dodge under the lightning-quick punch.");
			}
			else if (damage <= 0)
			{
				outputText("  You lash out and manage to deflect the blow before it can connect.");
			}
			else
			{
				outputText("  Her fist connects with your chin with a mighty crack, sending you sailing across the cave.  " + oniname() + " smirks at you as you");
				if (player.isNaga()) outputText(" raise back up onto your [legs]");
				else outputText(" stand");
				outputText(" and dust yourself off. ");
				
				player.takePhysDamage(damage, true);
			}
		}

		// Roundhouse Kick
		// Milkd lust increase
		public function roundhouseKick():void
		{
			outputText("" + oniname() + " leaps backwards onto one foot, spinning around and unleashing a thundering roundhouse kick.  Luckily, you manage to duck just in time, avoiding what surely would have been a monstrously powerful blow.  Unfortunately, as " + oniname() + "’s leg scythes through the air over your head, you find your gaze naturally following the line of her thigh muscles until you’re staring directly up the fluttering folds of " + oniname() + "’s increasingly impractical kimono.\n\n");
			if (player.cor >= 50 || player.lib >= 50 || player.sens >= 50)
			{
				outputText("You fall backwards and stagger away, already feeling a flush of warmth colouring your cheeks, trying to drag your mind back to the fight and away from... other things.");
				if (flags[kFLAGS.IZUMI_LVL_UP] >= 6) player.takeLustDamage(30 + player.lib / 10, true);
				else if (flags[kFLAGS.IZUMI_LVL_UP] >= 2) player.takeLustDamage(20 + player.lib / 10, true);
				else player.takeLustDamage(10 + player.lib / 10, true);
			}
			else
			{
				outputText("You furrow a brow at the Oni's ineffectual attack, not entirely sure if she was intending to hurt you or turn you on.  Her thighs did look rather tantalizing though...");
				if (flags[kFLAGS.IZUMI_LVL_UP] >= 6) player.takeLustDamage(15 + player.lib / 20, true);
				else if (flags[kFLAGS.IZUMI_LVL_UP] >= 2) player.takeLustDamage(10 + player.lib / 20, true);
				else player.takeLustDamage(5 + player.lib / 20, true);
			}
		}
		
		// Bind player for 3 turns. If the player doesn't break out in time, they take huge damage.
		// On escape, Izumi takes some damage
		public function chokeSlam():void
		{
			if (player.getEvasionRoll())
			{
				outputText("" + oniname() + " surges towards you, closing the distance between you within the blink of an eye. You narrowly avoid her crushing grip, twisting away from her grasp at the last moment.  The enormous Oni lets loose a deep, satisfied laugh.");
			}
			else
			{
				outputText("" + oniname() + " surges towards you, smashing aside your guard and seizing you by the throat in the blink of an eye.  Lifting you above her head, you can only struggle to breathe as the enormous Oni grins at you like some sort of prize.");
				player.createStatusEffect(StatusEffects.Chokeslam, 3, 0, 0, 0);
				
				if (combatDebug) trace("Applied Chokeslam effect");
			}
		}
		
		// Struggle against izumi's chokeslam
		public function chokeSlamStruggle():void
		{
			clearOutput();
			var brokeFree:Boolean;
			if ((rand(player.str) > this.str / 2) || player.hasPerk(PerkLib.FluidBody))
			{
				brokeFree = true;
			}
			if (brokeFree)
			{
				if (combatDebug) trace("Escaped from Chokeslam grapple");
				chokeSlamEscape();
			}
			else
			{
				outputText("" + oniname() + "'s grip around your throat continues to strangle the breath from your lungs as she holds you aloft.  Your fingers tighten in turn around the Oni's wrist, fighting against her");
				if (player.str < 90) outputText(" immense");
				else outputText(" impressive");
				outputText(" strength, in an attempt to free yourself from her crushing embrace, without success.");
				player.takePhysDamage(75 + rand(15), true);
			}
			SceneLib.combat.enemyAIImpl();
		}
		
		// OH HEY ITS A THING
		public function chokeSlamWait():void
		{
			clearOutput();
			outputText("Your feet dangle uselessly in the air as " + oniname() + " holds you aloft.  Why bother resisting?  She's just so <i>strong</i>, her fingers wrapped so completely around your neck...");
			player.takePhysDamage(75 + rand(15), true);
			if (flags[kFLAGS.PC_FETISH] >= 2)
			{
				outputText(" and to be honest, the grip isn't an entirely unplesent experience, either.  If only " + oniname() + " would stop playing around and just <i>take you</i> already.");
				player.takeLustDamage(5, true);
			}
			else
			{
				outputText(".");
			}
			SceneLib.combat.enemyAIImpl();
		}
		
		// Player fails to escape from the chokeslam, and after 3 rounds gets nailed to the fuckin floor
		public function chokeSlamDamage():void
		{
			outputText("With a grunt of effort, " + oniname() + " hauls you through the air, her iron-like grip around your throat providing the perfect anchor to propel you towards the ground.  Before you have a chance to react, the Oni drives you into the unforgiving stone lining the floor of the cave.\n\n");

			outputText("The hit is extreme enough to leave you dazed for a moment, splayed out across the floor.  When you rouse yourself back to full consciousness a few seconds later, the cave is still echoing with the sound of the impact, a testament to the strength of the Oni - and your resilience.");
			
			var damage:int = int ((str + 225) - rand(player.tou) - player.armorDef);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 2) damage += 100;
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 6) damage += 100;
			player.takePhysDamage(damage, true);
		}
		
		// Player escapes from the chokeslam attack
		public function chokeSlamEscape():void
		{
			var damage:Number = 50 + rand(player.str);
			if (combatDebug) trace("Escaping from Chokeslam!");
			
			outputText("Scrabbling desperately against her wrist, you narrow your eyes at the Oni woman’s superior expression,");
			if (player.isBiped()) outputText(" raise a [leg] and kick her roundly");
			else if (player.isNaga()) outputText(" raise your tail and slap her solidly");
			else outputText(" and slap her square");
			outputText(" in the face.  " + oniname() + " drops you, staggering back in surprise.  \"Ow!\"  She actually yelps, covering her face with her hands.\n\n");

			outputText("You drop to the ground and roll away, expecting some form of retribution.  " + oniname() + " glares at you from behind her hand for a moment, then snickers.  Slowly, she drops back into her fighting stance and gestures for your bout to continue.");
			outputText("<b>(<font color=\"#800000\">" + damage + "</font>)</b>");
			cleanupChokeslam();
			
			this.HP -= damage;
			
		}
		
		// Remove the effect post-combat
		public function cleanupChokeslam():void
		{
			if (player.hasStatusEffect(StatusEffects.Chokeslam))
			{
				trace("Removing chokeslam");
				
				player.removeStatusEffect(StatusEffects.Chokeslam);
			}
		}
		
		// Groundslam, does damage and slows the player if they don't dodge the hit
		public function groundPound():void
		{
			outputText("" + oniname() + " raises one mighty foot and slams it to the ground with a victorious yell.  The ground itself actually shakes below your feet, threatening to knock you off balance.\n\n");
			
			if (player.getEvasionRoll())
			{
				outputText("Leaping to the side, you manage to steady yourself against the wall, keeping your footing.");
			}
			else
			{
				outputText("The rumbling actually knocks you off your feet, sprawling on the ground and banging your head.  As the shaking subsides, you pull yourself upright, but you feel a little unsteady on your [feet] after the disorienting impact.");
				
				var spdReducedBy:int = int(player.spe * 0.25);
				player.buff("Groundpound").addStats({"spe":-spdReducedBy}).withText("Groundpound!").combatPermanent();


				if (combatDebug) trace("Applying Groundslam slow");
			}
			
		}
		
		// Binding attack, mild lust increase per turn until the player breaks out. Not TOO hard to break out, though.
		// Attack will be used ONCE, when Izumi reaches ~25% hp.
		public function titSmother():void
		{
			if (combatDebug) trace("Titsmother attack!");
			
			// Attack will ALWAYS hit, but be relatively easy to break out of
			outputText("With a sudden burst of speed, the Oni woman bullrushes you, slapping aside your hasty defence.  You brace yourself for a powerful impact, but rather than strike you she instead thrusts her arm straight past your head.  Bemused, you turn your head to follow her fist, just in time to see her crook her elbow and yank you back towards her - hard.  Pulled right off your [feet] by the sudden strike, you slam");
			if (player.hasMuzzle()) outputText(" muzzle-");
			else outputText(" face-");
			outputText("first into " + oniname() + " - specifically, into her chest.  Shocked by suddenly having your face rammed into the pillowy soft expanse of " + oniname() + "’s bust, you rear back only to be slammed straight back into the mountainous expanse by " + oniname() + "’s arm.");
			
			player.createStatusEffect(StatusEffects.Titsmother, 0, 0, 0, 0);
			if (flags[kFLAGS.IZUMI_LVL_UP] >= 6) player.takeLustDamage((player.lib / 15) + 15 + rand(15), true);
			else if (flags[kFLAGS.IZUMI_LVL_UP] >= 2) player.takeLustDamage((player.lib / 15) + 10 + rand(10), true);
			else player.takeLustDamage((player.lib / 15) + 5 + rand(5), true);
		}
		
		// Remove the effect post-combat
		public function cleanupTitsmother():void
		{
			if (player.hasStatusEffect(StatusEffects.Titsmother))
			{
				player.removeStatusEffect(StatusEffects.Titsmother);
				if (combatDebug) trace("Removing Titsmother");
			}
		}
		
		// Struggle handler for titsmother attack
		public function titSmotherStruggle():void
		{
			if (combatDebug) trace("Titsmother Struggle");
			var brokeFree:Boolean;
			if ((rand(player.str) > this.str / 4) || player.hasPerk(PerkLib.FluidBody))
			{
				brokeFree = true;
			}
			if (brokeFree)
			{
				if (combatDebug) trace("Broke free of Titsmother!");
				titSmotherEscape();
			}
			else
			{
				if (rand(2) == 0)
				{
					clearOutput();
					outputText("\"Hah!  Say goodnight, ‘cause I’m going to choke the fight right out of you!\"  She cries exuberantly, forcibly mashing your face into her bosom.  It would appear that she is trying to throttle you, but only having one hand is making the task difficult.  You can breathe just fine, but having your face forced into the constantly jostling mass of tit-flesh before you is distracting to say the least.\n\n");
					outputText("You scrabble desperately against " + oniname() + "’s grip, trying not to think about where you’re placing your hands, or how soft and pliant the flesh beneath you is, or any number of other upsetting little details - but to no avail.  " + oniname() + "’s grip is incredibly strong.  You hang there for a moment, trying to get your breath back for another attempt as " + oniname() + " jostles and presses against you from all sides.");
				}
				else
				{
					clearOutput();
					if (player.hasCock())
					{
						outputText("Assaulted by the sensation of being pressed against such warm flesh, you can already feel [eachCock] starting to stiffen against your will.  Your hardening erection");
						if (player.cockTotal() > 1) outputText("s");
						outputText(" just makes things even more unbearable, as the harder");
						if (player.cockTotal() > 1) outputText(" they get");
						else outputText(" it gets");
						outputText(", the more insistently your");
						if (player.cockTotal() > 1) outputText(" erections throb");
						else outputText(" erection throbs");
						outputText(", pressed up against " + oniname() + "’s stomach muscles.  Her muscles ripple and undulate as she struggles to keep you in her grip, abs flexing, bumping, encircling your insistent erection");
						if (player.cockTotal() > 1) outputText("s");
						outputText(", stimulating you even further.  You realize in a flash of panic that if you don’t get out of this soon, you may actually... ");
					}
					else
					{
						outputText("" + oniname() + "’s bust encloses you on all sides, leaving you feeling like you’re trapped in some kind of breast sarcophagus.  The heat radiating from the soft flesh combines with the scent of whatever strange drug " + oniname() + " had been smoking, now hanging around her like some heady perfume.");
					}
				}
				player.takeLustDamage(player.lib / 15 + 5 + rand(5), true);
			}
			SceneLib.combat.enemyAIImpl();
		}
		
		// Player breaks free of tiSmother and applies damage to Izumi
		public function titSmotherEscape():void
		{
			if (combatDebug) trace("Escaping TitSmother!");
			clearOutput();
			if (player.str < 90)
			{
				outputText("Straining with all your might, you still can’t quite manage to break " + oniname() + "’s grip, but you do manage to somehow slide upwards through the valley of her bust.  " + oniname() + "’s face looms into view, the enormous woman gritting her teeth as she attempts to crush the fight out of you.  In an act of desperation, you rear back and then knife forwards in a brutal headbutt.\n\n");
				outputText("\"Ack!\"  Your forehead connects with her chin in a collision that probably hurts you as much as her, judging by the searing pain that lances through your forehead as she drops you to the floor. Meanwhile, " + oniname() + " staggers back, rubbing at her chin.  \"Ow.  That hurt, kid!\"  She says reproachfully.  The two of you take a moment to shake the cobwebs from your heads before dropping back into your combat stances, a little more wary this time around.\n\n");
			}
			else
			{
				outputText("Locking your arms against " + oniname() + "’s shoulders, you heave with all your might against the musclebound Oni girl’s choke hold.  You can feel her arm straining to hold you, struggling to resist, giving ground....");
				if (player.isBiped())
				{
					outputText("  As soon as you can, you hike up your legs and place your feet firmly on " + oniname() + "’s stomach, adding your leg muscles to the effort.");
				}
				outputText("  " + oniname() + " grits her teeth and growls as she pulls with all her might, trying to force your limbs to give way, but to no avail - with a final thrust, " + oniname() + " lets out a yelp as you knock her arm aside and leap away.  " + oniname() + " rolls her arm around a little, massaging her shoulder as she regards you, thoughtfully.  Then she reaches up and fans at her face with one hand, grinning that suggestive grin.\n\n");
			}
			outputText("\"Oh my,\" she purrs, lasciviously. \"Aren’t you the impressive one?  Keep surprising me like that and I might just forget about this handicap...\" ");
			cleanupTitsmother();
			var damage:Number = (15 + rand(player.str));
			this.HP -= damage;
			outputText("<b>(<font color=\"#800000\">" + damage + "</font>)</b>");
		}
		
		// Wait handler for titsmother attack
		public function titSmotherWait():void
		{
			clearOutput();
			if (combatDebug) trace("Waiting during TitSmother");
			outputText("With your face crushed into the Oni's cleavage, you can't help but wonder; why bother resisting?  She's just so <i>strong</i>, and her breasts feel so lushious against your [face]...");
			player.takeLustDamage(player.lib / 10 + 5 + rand(5), true);
			if (flags[kFLAGS.PC_FETISH] >= 2)
			{
				outputText(" and to be honest, her grip isn't an entirely unplesent experience, either.  If only " + oniname() + " would stop playing around and just <i>take you</i> already.");
				player.takeLustDamage(5, true);
			}
			else
			{
				outputText(".");
			}
			SceneLib.combat.enemyAIImpl();
		}
	}
}
