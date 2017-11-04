/// @description "Skeleton"
event_inherited();

//Lore/Storytelling
creature_race        = "Skeleton";
creature_race_plural = "Skeletons";
creature_description = "Possible human, missing a few of the 206 expected pieces.";

//character level and experiance
character_level = 1;
character_xp    = 0;

//health and magic
stats_max_health = 30;
stats_max_energy = 30;

//attributes
attribute_str = 8;
attribute_dex = 8;
attribute_con = 8;
attribute_int = 8;
attribute_wis = 8;
attribute_chr = 8;

//inventory - equipped
equipped_helmet     = noone;
equipped_amulet     = noone;
equipped_shoulders  = noone;
equipped_torso      = noone;
equipped_gloves     = noone;
equipped_belt       = noone;
equipped_legs       = noone;
equipped_boots      = noone;
equipped_weapon     = noone;
equipped_offhand    = noone;
equipped_left_ring  = noone;
equipped_right_ring = noone;

//inventory - not equipped
inventory = ds_list_create();

//abilities (spells are just abilities)
abilities = ds_list_create();

//
initiative = 5;


/////////////////////////////////////

//vary the amount of health at spawn - @todo build into a traits - sickly/hardy???
var health_bonus = floor(random_range(-10, 20));
var magic_bonus = floor(random_range(-10, 20));

//
stats_max_health += health_bonus;
stats_health += health_bonus;

/////////////////////////////////////

stats_health = stats_max_health;
stats_energy = stats_max_energy;

