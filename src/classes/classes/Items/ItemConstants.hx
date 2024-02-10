package classes.Items {
import classes.ItemType;
import classes.internals.EnumValue;
import classes.internals.Utils;

/**
 * Names & constants shared across various item types
 */
public class ItemConstants extends Utils {
	
	///////////////////////////////
	// Constants for all/any items
	///////////////////////////////
	
	// Item categories
	public static const CATEGORY_WEAPON_MELEE:String  = "weapon";
	public static const CATEGORY_WEAPON_RANGED:String = "weaponranged";
	public static const CATEGORY_SHIELD:String        = "shield";
	public static const CATEGORY_ARMOR:String         = "armor";
	public static const CATEGORY_UNDERGARMENT:String  = "undergarment";
	public static const CATEGORY_NECKLACE:String      = "necklace";
	public static const CATEGORY_JEWELRY_HEAD:String  = "headjewelry";
	public static const CATEGORY_JEWELRY_RING:String  = "jewelry";
	public static const CATEGORY_JEWELRY_MISC:String  = "miscjewelry";
	public static const CATEGORY_VEHICLE:String       = "vehicle";
	public static const CATEGORY_FLYING_SWORD:String  = "flyingsword";
	public static const CATEGORY_CONSUMABLE:String    = "consumable";
	public static const CATEGORY_USABLE:String        = "useable";
	public static const CATEGORY_OTHER:String         = "other";
	
	/////////////////////
	// Generic equipable
	/////////////////////
	/**
	 * EnumValue properties:
	 * - id ("WEAPON_MELEE")
	 * - value (0)
	 * - name ("Weapon")
	 * - category: CATEGORY_XXXX
	 * - nothing: function():Equipable
	 */
	public static const EquipmentSlots:/*EnumValue*/Array = [];
	
	public static const SLOT_WEAPON_MELEE:int   = 0;
	EnumValue.add(EquipmentSlots, SLOT_WEAPON_MELEE, "WEAPON_MELEE", {
		name: "Weapon (Melee)",
		category: CATEGORY_WEAPON_MELEE,
		nothing: function():ItemType {
			return WeaponLib.FISTS;
		}
	});
	public static const SLOT_WEAPON_RANGED:int  = 1;
	EnumValue.add(EquipmentSlots, SLOT_WEAPON_RANGED, "WEAPON_RANGED", {
		name: "Weapon (Ranged)",
		category: CATEGORY_WEAPON_RANGED,
		nothing: function():ItemType {
			return WeaponRangeLib.NOTHING;
		}
	})
	public static const SLOT_ARMOR:int          = 2;
	EnumValue.add(EquipmentSlots, SLOT_ARMOR, "ARMOR", {
		name: "Armor",
		category: CATEGORY_ARMOR,
		nothing: function():ItemType {
			return ArmorLib.NOTHING;
		}
	})
	public static const SLOT_SHIELD:int         = 3;
	EnumValue.add(EquipmentSlots, SLOT_SHIELD, "SHIELD", {
		name: "Shield",
		category: CATEGORY_SHIELD,
		nothing: function():ItemType {
			return ShieldLib.NOTHING;
		}
	})
	public static const SLOT_UNDER_TOP:int = 4;
	EnumValue.add(EquipmentSlots, SLOT_UNDER_TOP, "UNDER_TOP", {
		name: "Upper underwear",
		category: CATEGORY_UNDERGARMENT,
		nothing: function():ItemType {
			return UndergarmentLib.NOTHING;
		}
	})
	public static const SLOT_UNDER_BOTTOM:int = 5;
	EnumValue.add(EquipmentSlots, SLOT_UNDER_BOTTOM, "UNDER_BOTTOM", {
		name: "Lower underwear",
		category: CATEGORY_UNDERGARMENT,
		nothing: function():ItemType {
			return UndergarmentLib.NOTHING;
		}
	})
	public static const SLOT_RING_1:int         = 6;
	EnumValue.add(EquipmentSlots, SLOT_RING_1, "RING_1", {
		name: "Ring (1st)",
		category: CATEGORY_JEWELRY_RING,
		nothing: function():ItemType {
			return JewelryLib.NOTHING;
		}
	})
	public static const SLOT_RING_2:int         = 7;
	EnumValue.add(EquipmentSlots, SLOT_RING_2, "RING_2", {
		name: "Ring (2nd)",
		category: CATEGORY_JEWELRY_RING,
		nothing: function():ItemType {
			return JewelryLib.NOTHING;
		}
	})
	public static const SLOT_RING_3:int         = 8;
	EnumValue.add(EquipmentSlots, SLOT_RING_3, "RING_3", {
		name: "Ring (3rd)",
		category: CATEGORY_JEWELRY_RING,
		nothing: function():ItemType {
			return JewelryLib.NOTHING;
		}
	})
	public static const SLOT_RING_4:int         = 9;
	EnumValue.add(EquipmentSlots, SLOT_RING_4, "RING_4", {
		name: "Ring (4th)",
		category: CATEGORY_JEWELRY_RING,
		nothing: function():ItemType {
			return JewelryLib.NOTHING;
		}
	})
	public static const SLOT_JEWELRY_MISC_1:int = 10;
	EnumValue.add(EquipmentSlots, SLOT_JEWELRY_MISC_1, "JEWELRY_MISC_1", {
		name: "Accessory (1st)",
		category: CATEGORY_JEWELRY_MISC,
		nothing: function():ItemType {
			return MiscJewelryLib.NOTHING;
		}
	})
	public static const SLOT_JEWELRY_MISC_2:int = 11;
	EnumValue.add(EquipmentSlots, SLOT_JEWELRY_MISC_2, "JEWELRY_MISC_2", {
		name: "Accessory (2nd)",
		category: CATEGORY_JEWELRY_MISC,
		nothing: function():ItemType {
			return MiscJewelryLib.NOTHING;
		}
	})
	public static const SLOT_HEAD:int           = 12;
	EnumValue.add(EquipmentSlots, SLOT_HEAD, "HEAD", {
		name: "Head Accessory",
		category: CATEGORY_JEWELRY_HEAD,
		nothing: function():ItemType {
			return HeadJewelryLib.NOTHING;
		}
	})
	public static const SLOT_NECK:int           = 13;
	EnumValue.add(EquipmentSlots, SLOT_NECK, "NECK", {
		name: "Necklace",
		category: CATEGORY_NECKLACE,
		nothing: function():ItemType {
			return NecklaceLib.NOTHING;
		}
	})
	public static const SLOT_FLYING_SWORD:int   = 14;
	EnumValue.add(EquipmentSlots, SLOT_FLYING_SWORD, "FLYING_SWORD", {
		name: "Flying Sword",
		category: CATEGORY_FLYING_SWORD,
		nothing: function():ItemType {
			return FlyingSwordsLib.NOTHING;
		}
	})
	public static const SLOT_VEHICLE:int        = 15;
	EnumValue.add(EquipmentSlots, SLOT_VEHICLE, "VEHICLE", {
		name: "Vehicle",
		category: CATEGORY_VEHICLE,
		nothing: function():ItemType {
			return VehiclesLib.NOTHING;
		}
	})
	
	public static var EquipmentSlotIds:/*int*/Array; // can't do = ... because of the init. order
	EquipmentSlotIds = Utils.mapOneProp(EquipmentSlots, "value");
	
	/////////////////
	// Armors
	/////////////////
	
	// Armor 'perks'
	public static const AP_LIGHT:String           = "Light";
	public static const AP_MEDIUM:String          = "Medium";
	public static const AP_HEAVY:String           = "Heavy";
	public static const AP_LIGHT_AYO:String       = "Light Ayo";
	public static const AP_HEAVY_AYO:String       = "Heavy Ayo";
	public static const AP_ULTRA_HEAVY_AYO:String = "Ultra Heavy Ayo";
	
	/////////////////
	// Weapons
	/////////////////
	
	// Weapon classes
	public static const WT_AXE:String           = "Axe";
	public static const WT_DAGGER:String        = "Dagger"; //~
	public static const WT_DUELING:String       = "Dueling";
	public static const WT_EXOTIC:String        = "Exotic";
	public static const WT_GAUNTLET:String      = "Gauntlet";
	public static const WT_MACE_HAMMER:String   = "Mace/Hammer";
	public static const WT_POLEARM:String       = "Polearm";
	public static const WT_RIBBON:String        = "Ribbon";
	public static const WT_SCYTHE:String        = "Scythe";
	public static const WT_SPEAR:String         = "Spear";
	public static const WT_STAFF:String         = "Staff";
	public static const WT_SWORD:String         = "Sword";
	public static const WT_WHIP:String          = "Whip";
	public static const WT_WAND:String         	= "Wand";
	public static const WT_TOME:String         	= "Tome";
	// Ranged weapon classes
	public static const WT_BOW:String           = "Bow";
	public static const WT_CROSSBOW:String      = "Crossbow";
	public static const WT_THROWING:String      = "Throwing";
	public static const WT_DUAL_FIREARMS:String = "Dual Firearms";
	public static const WT_PISTOL:String        = "Pistol";
	public static const WT_RIFLE:String         = "Rifle";
	public static const WT_2H_FIREARM:String    = "2H Firearm";
	public static const WT_DUAL_2H_FIREARMS:String = "Dual 2H Firearms";
	
	// Weapon 'perks' (specials)
	public static const WP_DUAL:String         = "Dual";
	public static const WP_DUAL_SMALL:String   = "Dual Small";
	public static const WP_DUAL_LARGE:String   = "Dual Large";
	public static const WP_DUAL_MASSIVE:String = "Dual Massive";
	public static const WP_SMALL:String        = "Small";
	public static const WP_LARGE:String        = "Large";
	public static const WP_MASSIVE:String      = "Massive";
	public static const WP_HYBRID:String       = "Hybrid";
	public static const WP_WHIPPING:String     = "Whipping";
	public static const WP_WHIRLWIND:String    = "Whirlwind";
	public static const WP_STAFF:String        = "Staff";
	public static const WP_AP10:String         = "AP10";
	public static const WP_AP30:String         = "AP30";
	public static const WP_AP40:String         = "AP40";
	public static const WP_AP45:String         = "AP45";
	public static const WP_AP60:String         = "AP60";
	public static const WP_AP100:String        = "AP100";
	public static const WP_STUN10:String       = "Stun10";
	public static const WP_STUN15:String       = "Stun15";
	public static const WP_STUN20:String       = "Stun20";
	public static const WP_STUN25:String       = "Stun25";
	public static const WP_STUN30:String       = "Stun30";
	public static const WP_STUN40:String       = "Stun40";
	public static const WP_STUN50:String       = "Stun50";
	public static const WP_BLEED10:String      = "Bleed10";
	public static const WP_BLEED25:String      = "Bleed25";
	public static const WP_BLEED45:String      = "Bleed45";
	public static const WP_BLEED100:String     = "Bleed100";
	public static const WP_LGWRATH:String      = "LGWrath";
	public static const WP_MGWRATH:String      = "MGWrath";
	public static const WP_MAGICAL:String	   = "MAGICDMG";
	
	public static const WEAPON_PERK_NAMES:Object = createMapFromPairs([
		[WP_AP10, "10% Armor Penetration"],
		[WP_AP30, "30% Armor Penetration"],
		[WP_AP40, "40% Armor Penetration"],
		[WP_AP45, "45% Armor Penetration"],
		[WP_AP60, "60% Armor Penetration"],
		[WP_AP100, "100% Armor Penetration"],
		[WP_STUN10, "+10% Stun"],
		[WP_STUN15, "+15% Stun"],
		[WP_STUN20, "+20% Stun"],
		[WP_STUN25, "+25% Stun"],
		[WP_STUN30, "+30% Stun"],
		[WP_STUN40, "+40% Stun"],
		[WP_STUN50, "+50% Stun"],
		[WP_BLEED10, "+10% Bleed"],
		[WP_BLEED25, "+25% Bleed"],
		[WP_BLEED45, "+45% Bleed"],
		[WP_BLEED100, "+100% Bleed"],
		[WP_LGWRATH, "Low Grade Wrath"],
		[WP_MGWRATH, "Mid Grade Wrath"],
	])
	
	///////////////////
	// Jewelry (rings)
	///////////////////
	
	// Modifiers
	public static const RINGEFF_MINLUST:int        = 1;
	public static const RINGEFF_FERTILITY:int      = 2;
	public static const RINGEFF_SF:int             = 3;
	public static const RINGEFF_MP:int             = 4;
	public static const RINGEFF_HP:int             = 5;
	public static const RINGEFF_ATTACK_POWER:int   = 6;
	public static const RINGEFF_SPELL_POWER:int    = 7;
	public static const RINGEFF_PURITY:int         = 8;
	public static const RINGEFF_CORRUPTION:int     = 9;
	public static const RINGEFF_WR:int             = 10;
	public static const RINGEFF_R_ATTACK_POWER:int = 11;
	public static const RINGEFF_SOUL_POWER:int     = 12;
	
	////////////////
	// Head jewelry
	////////////////
	
	// Types
	public static const HJT_CROWN:String   = "Crown";
	public static const HJT_HAIRPIN:String = "Hairpin";
	public static const HJT_HELMET:String  = "Helmet";
	public static const HJT_TIARA:String   = "Tiara";
	
	// Modifiers
	
	public static const HEADEFF_SF:int             = 1;
	public static const HEADEFF_MP:int             = 2;
	public static const HEADEFF_HP:int             = 3;
	public static const HEADEFF_ATTACK_POWER:int   = 4;
	public static const HEADEFF_SPELL_POWER:int    = 5;
	public static const HEADEFF_R_ATTACK_POWER:int = 6;
	//public static const HEADEFF_:int             = 7;
	public static const HEADEFF_WR:int             = 8;
	public static const HEADEFF_FIRE_R:int         = 9;
	public static const HEADEFF_ICE_R:int          = 10;
	public static const HEADEFF_LIGH_R:int         = 11;
	public static const HEADEFF_DARK_R:int         = 12;
	public static const HEADEFF_POIS_R:int         = 13;
	public static const HEADEFF_MAGIC_R:int        = 14;
	public static const HEADEFF_LUST_R:int         = 15;
	public static const HEADEFF_PHYS_R:int         = 16;
	
	///////////////////
	// Undergarment
	///////////////////
	
	// Types
	public static const UT_ANY:int      = -1; // NOTHING only
	public static const UT_TOP:int      = 0;
	public static const UT_BOTTOM:int   = 1;
	public static const UT_FULL:int     = 2;
	
	///////////////////
	// Enchanted items
	///////////////////
	
	/**
	 * EnumValue properties:
	 * - value: code (1)
	 * - id: var name ("MAGICAL")
	 *
	 * - name: display name ("magical")
	 * - buttonColor: button label color
	 * - valueMul: Base value multiplier
	 */
	public static const Rarities:/*EnumValue*/Array = [];
	
	public static const RARITY_COMMON:int    = 0;
	public static const RARITY_MAGICAL:int   = 1;
	public static const RARITY_RARE:int      = 2;
	public static const RARITY_LEGENDARY:int = 3;
	public static const RARITY_DIVINE:int    = 4;
	EnumValue.add(Rarities, RARITY_COMMON, "COMMON", {
		name: "common",
		buttonColor: "#000000",
		valueMul: 1
	});
	EnumValue.add(Rarities, RARITY_MAGICAL, "MAGICAL", {
		name: "magical",
		buttonColor: "#0000C0",
		valueMul: 1
	});
	EnumValue.add(Rarities, RARITY_RARE, "RARE", {
		name: "rare",
		buttonColor: "#006000",
		valueMul: 2
	});
	EnumValue.add(Rarities, RARITY_LEGENDARY, "LEGENDARY", {
		name: "legendary",
		buttonColor: "#FFFF40",
		valueMul: 3
	});
	EnumValue.add(Rarities, RARITY_DIVINE, "DIVINE", {
		name: "divine",
		buttonColor: "#80EEEE",
		valueMul: 4
	});
	
	public static const BTNCOLOR_CURSED:String = "#800000";
	
	public static const CS_HIDDEN_UNCURSED:int = 0;
	public static const CS_KNOWN_UNCURSED:int  = 1;
	public static const CS_HIDDEN_CURSED:int   = 2;
	public static const CS_KNOWN_CURSED:int    = 3;
	
	public static const CSBITMASK_CURSED:int = 2; // 0b10
	public static const CSBITMASK_KNOWN:int  = 1; // 0b01
	
	public function ItemConstants() {
	}
}
}
