/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations 
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Player;
import classes.Races;

public class HumanFatMutation extends IMutationPerkType
    {
        override public function get mName():String {
            return "Human Fat";
        }
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier == 1){
                descS = "Your altered fat tissue allows to increase your natural toughness and thickness.";
            }
            if (pTier == 2){
                descS = "Your fat tissue continue to increase your natural toughness and thickness gained from previous change. (+15% of max core Tou as phantom Tou)";
            }
            if (pTier == 3){
                descS = "Your fat tissue increased again your natural toughness and thickness limit. Increased damage reduction against physical damage & increase natural resistance to damage, increase max Hunger cap by 50 (if PC have Hunger bar active) (+45% of max core Tou as phantom Tou)";
            }
            return descS;
        }

        //Mutation Requirements
        override public function pReqs(pCheck:int = -1):void{
            try{
                var pTier:int = (pCheck != -1 ? pCheck : currentTier(this, player));
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireFatTissueMutationSlot()
                    .requireCustomFunction(function (player:Player):Boolean {
                        return player.thickness >= 100 && player.racialScore(Races.HUMAN) > 16;
                    }, "100+ thickness & Human race (17+)");
                }
                else{
                    var pLvl:int = pTier * 30;
                    this.requireLevel(pLvl);
                }
            }catch(e:Error){
                trace(e.getStackTrace());
            }
        }

        //Mutations Buffs
        override public function buffsForTier(pTier:int, target:Creature):Object {
            var pBuffs:Object = {};
            if (pTier == 1) pBuffs['tou.mult'] = 0.15;
            if (pTier == 2) pBuffs['tou.mult'] = 0.45;
            if (pTier == 3) pBuffs['tou.mult'] = 0.9;
            return pBuffs;
        }

        public function HumanFatMutation() 
		{
			super(mName + " IM", mName, SLOT_FAT, 3);
        }

    }
}
