////////////////////
//MORE DRONE TYPES//
////////////////////
//Drones with custom laws
//Drones with custom shells
//Drones with overridden procs
//Drones with camogear for hat related memes
//Drone type for use with polymorph (no preloaded items, random appearance)


//More types of drones
/mob/living/simple_animal/drone/syndrone
	name = "Syndron"
	desc = "Zmodyfikowany dron naprawczy Syndykatu. Wygląda jak zapowiedź kłopotów."
	icon_state = "drone_synd"
	icon_living = "drone_synd"
	picked = TRUE //the appearence of syndrones is static, you don't get to change it.
	health = 30
	maxHealth = 120 //If you murder other drones and cannibalize them you can get much stronger
	initial_language_holder = /datum/language_holder/drone/syndicate
	faction = list(FACTION_SYNDICATE)
	speak_emote = list("hisses")
	bubble_icon = "syndibot"
	heavy_emp_damage = 10
	laws = \
	"1. Przeszkadzaj nie-syndronom.\n"+\
	"2. Zabijaj nie-syndrony.\n"+\
	"3. Niszcz nie-syndrony."
	default_storage = /obj/item/uplink
	default_hatmask = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	hacked = TRUE
	flavortext = null

/mob/living/simple_animal/drone/syndrone/Initialize(mapload)
	. = ..()
	var/datum/component/uplink/hidden_uplink = internal_storage.GetComponent(/datum/component/uplink)
	hidden_uplink.telecrystals = 10

/mob/living/simple_animal/drone/syndrone/Login()
	..()
	to_chat(src, "<span class='notice'>Syndron online. Protokoły eksterminacji aktywne.</span>" )

/mob/living/simple_animal/drone/syndrone/badass
	name = "Badass Syndrone"
	default_hatmask = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	default_storage = /obj/item/uplink/nuclear

/mob/living/simple_animal/drone/syndrone/badass/Initialize(mapload)
	. = ..()
	var/datum/component/uplink/hidden_uplink = internal_storage.GetComponent(/datum/component/uplink)
	hidden_uplink.telecrystals = 30
	var/obj/item/implant/weapons_auth/W = new/obj/item/implant/weapons_auth(src)
	W.implant(src, force = TRUE)

/mob/living/simple_animal/drone/snowflake
	default_hatmask = /obj/item/clothing/head/chameleon/drone

/mob/living/simple_animal/drone/snowflake/Initialize(mapload)
	. = ..()
	desc += " Wygląda na to, że ten dron posiada na 'głowie' mały holoprojektor."

/obj/effect/mob_spawn/drone/syndrone
	name = "Nieaktywny syndron"
	desc = "Nieaktywny zmodyfikowany dron naprawczy Syndykatu. Może lepiej, żeby się nie aktywował."
	icon_state = "syndrone_item"
	mob_name = "syndrone"
	mob_type = /mob/living/simple_animal/drone/syndrone

/obj/effect/mob_spawn/drone/syndrone/badass
	name = "badass syndrone shell"
	mob_name = "badass syndrone"
	mob_type = /mob/living/simple_animal/drone/syndrone/badass

/obj/effect/mob_spawn/drone/snowflake
	name = "Nieaktywny holodron"
	desc = "Nieaktywny dron naprawczy z wbudowanym holoprojektorem czapek."
	mob_name = "snowflake drone"
	mob_type = /mob/living/simple_animal/drone/snowflake

/mob/living/simple_animal/drone/polymorphed
	default_storage = null
	default_hatmask = null
	picked = TRUE
	flavortext = null

/mob/living/simple_animal/drone/polymorphed/Initialize(mapload)
	. = ..()
	liberate()
	visualAppearence = pick(MAINTDRONE, REPAIRDRONE, SCOUTDRONE)
	if(visualAppearence == MAINTDRONE)
		var/colour = pick("grey", "blue", "red", "green", "pink", "orange")
		icon_state = "[visualAppearence]_[colour]"
	else
		icon_state = visualAppearence

	icon_living = icon_state
	icon_dead = "[visualAppearence]_dead"

/obj/effect/mob_spawn/drone/dusty
	name = "derelict drone shell"
	desc = "A long-forgotten drone shell. It seems kind of... Space Russian."
	icon = 'icons/mob/drone.dmi'
	icon_state = "drone_maint_hat"
	mob_name = "derelict drone"
	mob_type = /mob/living/simple_animal/drone/derelict
	short_desc = "You are a long forgotten drone!"
	flavour_text = "You are a drone on Kosmicheskaya Stantsiya 13. Something has brought you out of hibernation, and the station is in gross disrepair. \
	Build, repair, maintain and improve the station that housed you on activation."

/mob/living/simple_animal/drone/derelict
	name = "derelict drone"
	default_hatmask = /obj/item/clothing/head/ushanka
