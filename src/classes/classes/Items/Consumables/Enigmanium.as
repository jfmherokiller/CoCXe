/**
 * Coded by Liadri on 03.10.2018.
 */
package classes.Items.Consumables {
import classes.Appearance;
import classes.BodyParts.Arms;
import classes.BodyParts.Ears;
import classes.BodyParts.Eyes;
import classes.BodyParts.Face;
import classes.BodyParts.LowerBody;
import classes.BodyParts.Skin;
import classes.BodyParts.Tail;
import classes.BodyParts.Tongue;
import classes.BodyParts.Wings;
import classes.CoC;
import classes.CockTypesEnum;
import classes.EngineCore;
import classes.Items.Alchemy.AlchemyLib;
import classes.Items.Consumable;
import classes.Items.ItemTags;
import classes.Races;
import classes.StatusEffects;
import classes.VaginaClass;

public class Enigmanium extends Consumable {
    public function Enigmanium() {
      super("Enigmanium", "Enigmanium", "a vial of Enigmanium", 40, "This strange brew crafted by Evangeline combines harpy, cat, human and centaur traits. Supposedly it could allow you to become a sphinx.");
      withTag(ItemTags.U_TF);
      refineableInto(
              AlchemyLib.DEFAULT_SUBSTANCES_DROP_TABLE,
              AlchemyLib.MULTIRACE_ESSENCE_DROP_TABLE(AlchemyLib.AE_SPHINX, AlchemyLib.AE_CAT)
      )
    }
    public override function useItem(): Boolean {
      var choice: int;
      var changes: Number = 0;
      var changeLimit: Number = player.additionalTransformationChances;
      var temp2: Number = 0;
      var temp3: Number = 0;
      changeLimit += 100; //too many stat changes
      //Text go!
      clearOutput();
      outputText("You chug down the potion pinching your nose and hoping for the best. Knowledge flood your mind. Hey you could as well get to making riddles as a pastime.");

      //Speed raises up to 75
      if (rand(3) == 0 && changes < changeLimit && player.MutagenBonus("spe", 2)) {
        //low speed
        if (player.spe <= 30)
          outputText("[pg]You feel... more balanced, sure of step. You're certain that you've become just a little bit faster.");
        //medium speed
        else if (player.spe <= 60)
          outputText("[pg]You stumble as you shift position, surprised by how quickly you move. After a moment or two of disorientation, you adjust. You're certain that you can run faster now.");
        else
          outputText("[pg]You pause mid-step and crouch. Your leg muscles have cramped up like crazy. After a few moments, the pain passes and you feel like you could chase anything down.");
        changes++;
      }
      //Strength raises to 80
      if (rand(3) == 0 && changes < changeLimit && player.MutagenBonus("str", 1)) {
        if (rand(2) == 0) outputText("[pg]Your muscles feel taut, like a coiled spring, and a bit more on edge.");
        else outputText("[pg]You arch your back as your muscles clench painfully.  The cramp passes swiftly, leaving you feeling like you've gotten a bit stronger.");
        changes++;
      }
      //Toughness drops if over 50
      //Does not add to change total
      if (player.tou > 50 && rand(2) == 0) {
        outputText("[pg]Your body seems to compress momentarily, becoming leaner and noticeably less tough.");
        player.addCurse("tou", 2, 1);
      }
      //IntelliWisGain
      if (rand(4) == 0 && changes < changeLimit && (player.MutagenBonus("int", 2) || player.MutagenBonus("wis", 2))) {
        outputText("[pg]Thousands of glowing symbols, hieroglyphics you remember them being denoted as, appear in vast arrays in your mind. Miraculously, you can make sense of them, as if they were in your own language. Shifting them, you giggle to yourself as you begin crafting a riddle that will surely baffle great minds. The visions end, and you feel incredibly enlightened! Is this how Sanurah feels?");
        changes++;
      }
      //Libido gain
      if (changes < changeLimit && rand(4) == 0) {
        //Cat dicked folks
        if (player.catCocks() > 0) {
          choice = player.findFirstCockType(CockTypesEnum.CAT);
          outputText("[pg]You feel your [cock "+(choice+1)+"] growing hard, the barbs becoming more sensitive. You gently run your hands down them and imagine the feeling of raking the insides of a cunt as you pull.  The fantasy continues, and after ejaculating and hearing the female yowl with pleasure, you shake your head and try to drive off the image.  ");
          if (player.cor < 33) outputText("You need to control yourself better.");
          else if (player.cor < 66) outputText("You're not sure how you feel about the fantasy.");
          else outputText("You hope to find a willing partner to make this a reality.");
        }
        //Else –
        else {
          outputText("[pg]A rush of tingling warmth spreads through your body as it digests the fruit.  You can feel your blood pumping through your extremities, making them feel sensitive and surprisingly sensual.  It's going to be hard to resist getting ");
          if (player.lust > 60) outputText("even more ");
          outputText("turned on.");
        }
        player.addCurse("sen", 2, 1);
        if (player.MutagenBonus("lib", 1))
            changes++; //fair
      }
      if (player.blockingBodyTransformations()) changeLimit = 0;
      //Mare
      if (player.hasVagina()) {
        //Single vag
        if (player.vaginas.length == 1) {
          if (player.vaginas[0].vaginalLooseness <= VaginaClass.LOOSENESS_GAPING && changes < changeLimit && rand(2) == 0) {
            outputText("[pg]You grip your gut in pain as you feel your organs shift slightly.  When the pressure passes, you realize your [vagina] has grown larger, in depth AND size.");
            player.vaginas[0].vaginalLooseness++;
            changes++;
          }
          if (player.vaginas[0].vaginalWetness <= VaginaClass.WETNESS_NORMAL && changes < changeLimit && rand(2) == 0) {
            outputText("[pg]Your [vagina] moistens perceptably, giving off an animalistic scent.");
            player.vaginas[0].vaginalWetness++;
            changes++;
          }
        }
        //Multicooch
        else {
          //determine least wet
          //temp - least wet
          //temp2 - saved wetness
          //temp3 - counter
          temp = 0;
          temp2 = player.vaginas[temp].vaginalWetness;
          temp3 = player.vaginas.length;
          while (temp3 > 0) {
            temp3--;
            if (temp2 > player.vaginas[temp3].vaginalWetness) {
              temp = temp3;
              temp2 = player.vaginas[temp].vaginalWetness;
            }
          }
          if (player.vaginas[temp].vaginalWetness <= VaginaClass.WETNESS_NORMAL && changes < changeLimit && rand(2) == 0) {
            outputText("[pg]One of your " + Appearance.vaginaDescript(player, temp) + " moistens perceptably, giving off an animalistic scent.");
            player.vaginas[temp].vaginalWetness++;
            changes++;
          }
          //determine smallest
          //temp - least big
          //temp2 - saved looseness
          //temp3 - counter
          temp = 0;
          temp2 = player.vaginas[temp].vaginalLooseness;
          temp3 = player.vaginas.length;
          while (temp3 > 0) {
            temp3--;
            if (temp2 > player.vaginas[temp3].vaginalLooseness) {
              temp = temp3;
              temp2 = player.vaginas[temp].vaginalLooseness;
            }
          }
          if (player.vaginas[0].vaginalLooseness <= VaginaClass.LOOSENESS_GAPING && changes < changeLimit && rand(2) == 0) {
            outputText("[pg]You grip your gut in pain as you feel your organs shift slightly.  When the pressure passes, you realize one of your " + Appearance.vaginaDescript(player, temp) + " has grown larger, in depth AND size.");
            player.vaginas[temp].vaginalLooseness++;
            changes++;
          }
        }
        if (player.statusEffectv2(StatusEffects.Heat) < 30 && rand(2) == 0 && changes < changeLimit) {
          if (player.goIntoHeat(true)) {
            changes++;
          }
        }
      }
      //Mare-gina

      //Increase player's breast size, if they are big FF or smaller
      if (player.smallestTitSize() <= 14 && player.gender >= 2 && changes < changeLimit && rand(4) == 0) {
        outputText("[pg]After eating it, your chest aches and tingles, and your hands reach up to scratch at it unthinkingly.  Silently, you hope that you aren't allergic to it.  Just as you start to scratch at your " + player.breastDescript(player.smallestTitRow()) + ", your chest pushes out in slight but sudden growth.");
        player.breastRows[player.smallestTitRow()].breastRating++;
        changes++;
      }

      //Sexual changes would go here if I wasn't a tard.
      //Heat
      if (rand(4) == 0 && changes < changeLimit) {
        var intensified: Boolean = player.inHeat;
        if (player.goIntoHeat(false)) {
          if (intensified) {
            if (rand(2) == 0) outputText("[pg]The itch inside your [vagina] is growing stronger, and you desperately want to find a nice cock to massage the inside.");
            else outputText("[pg]The need inside your [vagina] grows even stronger.  You desperately need to find a mate to 'scratch your itch' and fill your womb with kittens.  It's difficult NOT to think about a cock slipping inside your moist fuck-tunnel, and at this point you'll have a hard time resisting ANY male who approaches.");
          } else {
            outputText("[pg]The interior of your [vagina] clenches tightly, squeezing with reflexive, aching need.  Your skin flushes hot ");
            if (player.isFurCovered()) outputText("underneath your fur ");
            outputText("as images and fantasies ");
            if (player.cor < 50) outputText("assault ");
            else outputText("fill ");
            outputText(" your mind.  Lithe cat-boys with their perfect, spine-covered cocks line up behind you, and you bend over to present your needy pussy to them.  You tremble with the desire to feel the exotic texture of their soft barbs rubbing your inner walls, smearing your [vagina] with their cum as you're impregnated.  Shivering, you recover from the fantasy and pull your fingers from your aroused sex.  <b>It would seem you've gone into heat!</b>");
          }
          changes++;
        }
      }

      //Cat dangly-doo.
      if ((player.catCocks() + player.demonCocks()) < player.cockTotal() && (player.ears.type == Ears.LION || rand(3) > 0) && (player.tailType == Tail.CAT || rand(3) > 0) && changes < changeLimit && rand(4) == 0) {
        //Only transform one cock that is not Cat or Demon
        var i:int = player.findFirstCockNotInType([CockTypesEnum.CAT, CockTypesEnum.DEMON]);
        if (i != -1) {
          CoC.instance.transformations.CockCat(i).applyEffect();
          changes++;
        }
      }

      if (player.isTaur() && (player.isMaleOrHerm()) && changes < changeLimit) {
        //If cocks that aren't Catsified!
        if ((player.catCocks() + player.demonCocks()) < player.cockTotal() && rand(3) == 0 ) {
          var j:int = player.findFirstCockNotInType([CockTypesEnum.CAT, CockTypesEnum.DEMON]);
          if (j != -1) {
            CoC.instance.transformations.CockCat(j).applyEffect();
            player.growCock(temp, rand(4) + 4);
            //Make cock thicker if not thick already!
            if (player.cocks[j].cockThickness <= 2) player.thickenCock(j, 1);
            outputText("  <b>You now have a bigger cock.</b>");
            dynStats("lus", 35, "scale", false);
            player.addCurse("sen", 4, 1);
            player.MutagenBonus("lib", 5);
            changes++;
          }
        } else {
          //temp = current smallest
          var temp:int = player.findCockWithType(CockTypesEnum.CAT, -1, -1,-1, "length");
          if (temp != -1) {
            //Grow smallest cock!
            temp2 = player.growCock(temp, rand(4) + 1);
            dynStats("sen", 1, "lus", 10);

            outputText("[pg]");
            if (temp2 > 2) outputText("Your [cock "+(temp+1)+"] tightens painfully, inches of taut flesh pouring out from your sheath as it grows longer.  Thick animal-pre forms at the flared tip, drawn out from the pleasure of the change.");
            if (temp2 > 1 && temp2 <= 2) outputText("Aching pressure builds within your sheath, suddenly releasing as an inch or more of extra dick flesh spills out.  A dollop of pre beads on the head of your enlarged [cock "+(temp+1)+"] from the pleasure of the growth.");
            if (temp2 <= 1) outputText("A slight pressure builds and releases as your [cock "+(temp+1)+"] pushes a bit further out of your sheath.");
            changes++;
          }
        }

        //Chance of thickness + daydream
        if (rand(2) == 0 && changes < changeLimit && player.catCocks() > 0) {
          var temp0:int = player.findCockWithType(CockTypesEnum.CAT, -1, -1,-1, "thickness");
          if (temp0 != -1) {
            player.thickenCock(temp, .5);
            outputText("[pg]Your [cock "+(temp0+1)+"] thickens inside its sheath, growing larger and fatter as your veins thicken, becoming more noticeable.  It feels right");
            if (player.cor + player.lib > 175) outputText(" Your [cock "+(temp0+1)+"] is perfect for fucking about anything that is a cat or a taur.  You imagine the feel of plowing an equine pussy deeply, bottoming out and unloading sticky jets of horse-jizz into its fertile womb.  Your hand strokes your cat cock of its own accord, musky pre dripping from the spiked tip with each stroke.  Your mind wanders to the thought of you with a harem of pregnant cat or centaurs.");
            else if (player.cor + player.lib >= 100) outputText(" to be a rutting stud.  You ache to find a catgirl in heat to breed with.  Longing to spend your evenings plunging a [cock "+(temp0+1)+"] deep into their passages, dumping load after load of your thick animal-cum into them.  You'd be happy just fucking cunt morning, noon, and night.");
            else if (player.cor + player.lib >= 60 ) outputText(" to be this way... You breath the powerful animalistic scent and fantasize about fucking catgirls and centaurs night and day until their bellies slosh with your cum.");
            else outputText(" to have such a splendid tool.  You idly daydream about cunts and pussies, your [cock "+(temp0+1)+"] plowing them relentlessly, stuffing them pregnant with cum.");

            if (player.cor >= 90) outputText("  You flush hotly and give a twisted smile, resolving to find a fitting subject to rape and relive your fantasies.");
            else if (player.cor >= 60) outputText("  You relish your twisted fantasies, hoping to dream of them again.");
            else if (player.cor >= 30) outputText("  You wonder why you thought such odd things, but they have a certain appeal.");
            else outputText("  You shudder in revulsion at the strange thoughts and vow to control yourself better.");
            dynStats("lus", 10, "scale", false);
            player.MutagenBonus("lib", 0.5);
            changes++;
          }
        }
        //Chance of ball growth if not 3" yet
        if (rand(2) == 0 && changes < changeLimit && player.ballSize <= 3) {
          if (player.balls == 0) {
            CoC.instance.transformations.BallsDuo.applyEffect();
            dynStats("lus", 5, "scale", false);
            player.MutagenBonus("lib", 2);
          } else {
            player.ballSize++;
            if (player.ballSize <= 2) outputText("[pg]A flash of warmth passes through you and a sudden weight develops in your groin.  You pause to examine the changes and your roving fingers discover your [balls] have grown larger than a human's.");
            else outputText("[pg]A sudden onset of heat envelops your groin, focusing on your [sack].  Walking becomes difficult as you discover your [balls] have enlarged again.");
            dynStats("lus", 3, "scale", false);
            player.MutagenBonus("lib", 1);
          }
          changes++;
        }
      }

      //classic horse-taur version
      if (changes < changeLimit && rand(2) == 0 && player.lowerBody == LowerBody.CAT && !player.isTaur()) {
        outputText("[pg]");
        CoC.instance.transformations.LowerBodyCat(4).applyEffect();
        changes++;
      }

      //Wings
      if (player.wings.type == Wings.NONE && changes < changeLimit && player.arms.type == Arms.SPHINX && rand(4) == 0) {
        outputText("[pg]");
        CoC.instance.transformations.WingsFeatheredSphinx.applyEffect();
        changes++;
      }
      //Remove old wings
      if (player.wings.type != Wings.FEATHERED_SPHINX && player.wings.type > Wings.NONE && changes < changeLimit && rand(4) == 0) {
        outputText("[pg]");
        CoC.instance.transformations.WingsNone.applyEffect();
        changes++;
      }


      //generic version
      if (player.lowerBody != LowerBody.CAT && !player.isTaur() && changes < changeLimit && rand(3) == 0) {
        outputText("[pg]");
        CoC.instance.transformations.LowerBodyCat(4).applyEffect();
        player.MutagenBonus("spe", 3);
        changes++;
      }

      //Human skin
      if (player.tailType == Tail.CAT && !player.hasPlainSkinOnly() && changes < changeLimit && rand(4) == 0) {
        outputText("[pg]");
        CoC.instance.transformations.SkinPlain.applyEffect();
        changes++;
      }
      //sphinx color skin
      var SphinxSkinColor: Array = ["dark", "tan"];
      if (!InCollection(player.skinColor, SphinxSkinColor) && player.hasPlainSkinOnly() && changes < changeLimit && rand(3) == 0) {
        outputText("[pg]You feel a crawling sensation on the surface of your skin, starting at the small of your back and spreading to your extremities, ultimately reaching your face.  Holding an arm up to your face, you discover that <b>you now have ");
        player.furColor = randomChoice(SphinxSkinColor);
        outputText("[skin]!</b>");
        changes++;
      }
      //Body type changes.  Teh rarest of the rare.
      //DA EARZ
      if (player.ears.type != Ears.LION && rand(4) == 0 && changes < changeLimit) {
        outputText("[pg]");
        CoC.instance.transformations.EarsLion.applyEffect();
        changes++;
      }
      //DA TAIL (IF ALREADY HAZ URZ)
      if (player.tailType != Tail.CAT && player.ears.type == Ears.LION && rand(4) == 0 && changes < changeLimit) {
        if (player.tailType == Tail.NONE) {
          switch (rand(3)) {
          case 0:
            outputText("[pg]A pressure builds in your backside. You feel under your [armor] and discover an odd bump that seems to be growing larger by the moment. In seconds it passes between your fingers, bursts out the back of your clothes and grows most of the way to the ground. A thick coat of fur springs up to cover your new tail. You instinctively keep adjusting it to improve your balance. <b>You now have a cat-tail.</b>");
            break;
          case 1:
            outputText("[pg]You feel your backside shift and change, flesh molding and displacing into a long, flexible tail! <b>You now have a cat tail.</b>");
            break;
          case 2:
            outputText("[pg]You feel an odd tingling in your spine and your tail bone starts to throb and then swell. Within a few moments it begins to grow, adding new bones to your spine. Before you know it, you have a tail. Just before you think it's over, the tail begins to sprout soft, glossy [fur color] fur. <b>You now have a cat tail.</b>");
            break;
          }
        } else outputText("[pg]You pause and tilt your head... something feels different.  Ah, that's what it is; you turn around and look down at your tail as it starts to change shape, narrowing and sprouting glossy fur. <b>You now have a cat tail.</b>");
        CoC.instance.transformations.TailCat.applyEffect(false);
        changes++;
      }

      //DA Mouth
      if (player.faceType != Face.CAT_CANINES && player.ears.type == Ears.LION && rand(4) == 0 && changes < changeLimit) {
        outputText("[pg]");
        CoC.instance.transformations.FaceCatCanines.applyEffect();
        changes++;
      }

      //Da paws (if already haz ears & tail)
      if (player.tailType == Tail.CAT && player.ears.type == Ears.LION && rand(4) == 0 && changes < changeLimit && player.lowerBody != LowerBody.CAT) {
        outputText("[pg]");
        CoC.instance.transformations.LowerBodyCat(2).applyEffect();
        changes++;
      }

      //Sphinx Arms
      if (player.lowerBody == LowerBody.CAT && rand(4) == 0 && changes < changeLimit && player.arms.type != Arms.SPHINX) {
        outputText("[pg]");
        CoC.instance.transformations.ArmsSphinx.applyEffect();
        changes++;
      }
      //CAT TOUNGE CUZ WHY NOT?
      if (player.faceType == Face.HUMAN && player.tongue.type != Tongue.CAT && rand(3) == 0 && changes < changeLimit) {
        outputText("[pg]");
        CoC.instance.transformations.TongueCat.applyEffect();
        changes++;
      }

      //DAT EYES
      if (player.tailType == Tail.CAT && player.ears.type == Ears.LION && rand(4) == 0 && changes < changeLimit && player.lowerBody == LowerBody.CAT && (player.isFurCovered() || (player.hasCoatOfType(Skin.SCALES) && player.racialScore(Races.DRAGONNE, false) >= 4)) && player.faceType == Face.CAT && player.eyes.type != Eyes.CAT) {
        outputText("\n\n");
        CoC.instance.transformations.EyesCat.applyEffect();
        changes++;
      }
      //FAILSAFE CHANGE
      if (changes == 0) {
        outputText("[pg]Inhuman vitality spreads through your body, invigorating you!\n");
        EngineCore.HPChange(50, true);
        dynStats("lus", 3, "scale", false);
      }
      if (changes < changeLimit) {
        if (rand(2) == 0) outputText(player.modThickness(5, 2));
        if (rand(2) == 0) outputText(player.modTone(76, 2));
        else outputText(player.modFem(85, 2));
      }
      player.refillHunger(20);
      return false;
    }
  }
}
