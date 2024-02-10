package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

public class GremlinRace extends Race {
	public static const GremlinEyeColors:/*String*/Array = ["red", "yellow", "purple", "orange"];
	public static const GremlinSkinColors:/*String*/Array = ["light", "tan", "dark"];
	public static const GremlinHairColors:/*String*/Array = ["emerald", "green", "dark green", "aqua", "light green"];
    public static const RaceBody:/*String*/Array = [
        /*Antenna*/		"Human",
        /*Arms*/		"Human",
        /*Balls*/		"Human",
        /*Breasts*/		"Human",
        /*Nips*/		"Human",
        /*Ears*/		"Snake",
        /*Eyes*/		"Gorgon",
        /*Face*/		"Snake",
        /*Gills*/		"None",
        /*Hair*/		"Gorgon",
        /*Horns*/		"Human",
        /*LowerBody*/	"Snake",
        /*RearBody*/	"Human",
        /*Skin*/		"Snake",
        /*Ovipositor*/	"Human",
        /*Oviposition*/	"Human",
        /*GlowingAss*/	"Human",
        /*Tail*/		"Human",
        /*Tongue*/		"Snake",
        /*Wings*/		"Human",
        /*Penis*/		"Lizard",
        /*Vagina*/		"Lizard",
        /*Perks*/		"Human"];
	
	public function GremlinRace(id:int) {
		super("Gremlin", id, []);//RaceBody);
        //tfRace = RaceMem.GREMLIN;
	}
	
	public override function setup():void {
		
		addScores()
				.faceType(Face.CRAZY, +1)
				.earType(Ears.GREMLIN, +1, -1000)
				.hairType(Hair.CRAZY, +1)
				.eyeColor(ANY(GremlinEyeColors), +1)
				.height(LESS_THAN(48), +2)
				.hasVagina(+1)
				.skinPlainOnly(+1)
				.femininity(GREATER_THAN(70), +2)
				.corruption(AT_LEAST(20), +1)
				.hasPerk(PerkLib.GoblinoidBlood, +1)
				.hasPerk(PerkLib.BouncyBody, +1)
				.hasPerk(PerkLib.Soulless, +1)
		/*	if (hasPerk(MutationsLib.BlackHeart))
				gremlinCounter++;
			if (hasPerk(MutationsLib.BlackHeartPrimitive))
				gremlinCounter++;
			if (hasPerk(MutationsLib.BlackHeartEvolved))
				gremlinCounter++;
			if (hasPerk(MutationsLib.BlackHeart) && hasPerk(PerkLib.ChimericalBodySemiImprovedStage))
				gremlinCounter++;
			if (hasPerk(MutationsLib.BlackHeartPrimitive) && hasPerk(PerkLib.ChimericalBodySemiSuperiorStage))
				gremlinCounter++;
			if (hasPerk(PerkLib.DemonicLethicite))
				gremlinCounter+=1;
		*/
		addConditionedScores(
				function (body:BodyData):Boolean {
					return body.player.hasPlainSkinOnly();
				},
				"plain skin; ")
				.skinColor1(ANY(GremlinSkinColors), +1, -1000)
				.hairColor1(ANY(GremlinHairColors), +1)
				.armType(Arms.HUMAN, +1)
				.legType(LowerBody.HUMAN, +1)
				.noWings(+1)
				.noTail(+1);
		
		addBloodline(PerkLib.GoblinsDescendant, PerkLib.BloodlineGoblin);
		addMutation(IMutationsLib.NaturalPunchingBagIM);
		
		buildTier(15, "gremlin")
				.buffs({
					"str.mult": -0.50,
					"spe.mult": +0.75,
					"int.mult": +1.20,
					"lib.mult": +1.00,
					"sens": +20
				})
				.end();
		
		buildTier(18, "high gremlin")
				.buffs({
					"str.mult": -0.50,
					"spe.mult": +0.90,
					"int.mult": +1.35,
					"lib.mult": +1.15,
					"sens": +20
				})
				.end();
	}
}
}
