/// @description Define the basic character sheet

//Lore/Storytelling
creature_race        = "Unknown";
creature_race_plural = "Unknowables";
creature_description = "The Unknowables are a mysterious race, nothing is actully known about these creatures.";

//character level and experiance
character_level = 1;
character_xp    = 0;

//health and magic
stats_max_health = 30;
stats_max_energy = 30;

stats_health_regen = 0.01;
stats_energy_regen = 0.1;

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

//behviour logic - @todo tie this into a state machine
entity_state = enum_entity_state.idle;

entity_logic[enum_entity_state.idle]   = simple_entity_idle;
entity_logic[enum_entity_state.patrol] = simple_entity_patrol;
entity_logic[enum_entity_state.attack] = simple_melee_attack;

/////////////////////////////////////

//store this entities current path
path = path_add();

//what is the current entities world position
current_x = -1;
current_y = -1;

//where would the entity like to go (used when patrolling/investigation etc)
target_x = -1;
target_y = -1;

//various timers, used to control things like alert/idle timers
timer_idle  = 0;
timer_alert = 0;

/////////////////////////////////////






//is it this entities turn?
active = false;
action = false; //queue an player "aimed" action

stats_health = stats_max_health;
stats_energy = stats_max_energy;



