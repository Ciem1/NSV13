//Contains the target item datums for Steal objectives.

/datum/objective_item
	var/name = "Śmieszną trąbkę rowerową!  Honk!"
	var/targetitem = /obj/item/bikehorn		//typepath of the objective item
	var/difficulty = 9001							//vaguely how hard it is to do this objective
	var/list/excludefromjob = list()				//If you don't want a job to get a certain objective (no captain stealing his own medal, etcetc)
	var/list/altitems = list()				//Items which can serve as an alternative to the objective (darn you blueprints)
	var/list/special_equipment = list()

/datum/objective_item/proc/check_special_completion() //for objectives with special checks (is that slime extract unused? does that intellicard have an ai in it? etcetc)
	return 1

/datum/objective_item/proc/TargetExists()
	return TRUE

/datum/objective_item/steal/New()
	..()
	if(TargetExists())
		GLOB.possible_items += src
	else
		qdel(src)

/datum/objective_item/steal/Destroy()
	GLOB.possible_items -= src
	return ..()

/datum/objective_item/steal/caplaser
	name = "zabytkowy pistolet laserowy Kapitana."
	targetitem = /obj/item/gun/energy/laser/captain
	difficulty = 5
	excludefromjob = list(JOB_NAME_CAPTAIN)

/datum/objective_item/steal/hoslaser
	name = "osobisty glock Komendanta, 'Winona'."
	targetitem = /obj/item/gun/ballistic/automatic/pistol/glock/security/hos
	difficulty = 10
	excludefromjob = list("Head Of Security")

/datum/objective_item/steal/handtele
	name = "ręczny teleporter."
	targetitem = /obj/item/hand_tele
	difficulty = 5
	excludefromjob = list(JOB_NAME_CAPTAIN, JOB_NAME_RESEARCHDIRECTOR)

/datum/objective_item/steal/jetpack
	name = "jetpack Kapitana."
	targetitem = /obj/item/tank/jetpack/oxygen/captain
	difficulty = 5
	excludefromjob = list(JOB_NAME_CAPTAIN)

/datum/objective_item/steal/magboots
	name = "zaawansowane buty magnetyczne Szefa Inżynierii."
	targetitem =  /obj/item/clothing/shoes/magboots/advance
	difficulty = 5
	excludefromjob = list(JOB_NAME_CHIEFENGINEER)

/datum/objective_item/steal/capmedal
	name = "medal Kapitaństwa."
	targetitem = /obj/item/clothing/accessory/medal/gold/captain
	difficulty = 5
	excludefromjob = list(JOB_NAME_CAPTAIN)

/datum/objective_item/steal/hypo
	name = "hypospray."
	targetitem = /obj/item/reagent_containers/hypospray/CMO
	difficulty = 5
	excludefromjob = list(JOB_NAME_CHIEFMEDICALOFFICER)

/datum/objective_item/steal/nukedisc
	name = "nuklearny dysk uwierzytelniający."
	targetitem = /obj/item/disk/nuclear
	difficulty = 5
	excludefromjob = list(JOB_NAME_CAPTAIN)

/datum/objective_item/steal/nukedisc/check_special_completion(obj/item/disk/nuclear/N)
	return !N.fake

/datum/objective_item/steal/riot
	name = "strój do zamieszek."
	targetitem = /obj/item/clothing/suit/armor/riot
	difficulty = 3
	excludefromjob = list(JOB_NAME_HEADOFSECURITY, JOB_NAME_WARDEN)

/datum/objective_item/steal/reactive
	name = "reakcyjną zbroję teleportującą (reactive teleport armor)."
	targetitem = /obj/item/clothing/suit/armor/reactive/teleport
	difficulty = 5
	excludefromjob = list(JOB_NAME_RESEARCHDIRECTOR)

/datum/objective_item/steal/documents
	name = "tajne dokumenty dowolnej organizacji."
	targetitem = /obj/item/documents //Any set of secret documents. Doesn't have to be NT's
	difficulty = 5

/datum/objective_item/steal/nuke_core
	name = "wysoko radioaktywny rdzeń pulutonowy z pokładowego modułu autodestrukcji. Upewnij się, że jesteś ubrany w odpowiednie środki ochrony osobistej podczas pozyskiwania rdzenia!"
	targetitem = /obj/item/nuke_core
	difficulty = 15

/datum/objective_item/steal/nuke_core/New()
	special_equipment += /obj/item/storage/box/syndie_kit/nuke
	..()

/datum/objective_item/steal/supermatter
	name = "odłamek kryształu supermaterii. Upewnij się, że jesteś ubrany w odpowiednie środki ochrony osobistej podczas pozyskiwania srebra!"
	targetitem = /obj/item/nuke_core/supermatter_sliver
	difficulty = 15

/datum/objective_item/steal/supermatter/New()
	special_equipment += /obj/item/storage/box/syndie_kit/supermatter
	..()

/datum/objective_item/steal/supermatter/TargetExists()
	return GLOB.main_supermatter_engine != null

//Items with special checks!
/datum/objective_item/steal/plasma
	name = "28 moli plazmy (pełen zbiornik). Upewnij się, że napełniłeś zbiornik dodatkową plazmą, gdyż nie zaczyna on pełny!"
	targetitem = /obj/item/tank
	difficulty = 3
	excludefromjob = list(JOB_NAME_CHIEFENGINEER,JOB_NAME_RESEARCHDIRECTOR,JOB_NAME_STATIONENGINEER,JOB_NAME_SCIENTIST,JOB_NAME_ATMOSPHERICTECHNICIAN)

/datum/objective_item/steal/plasma/check_special_completion(obj/item/tank/T)
	var/target_amount = text2num(name)
	var/found_amount = 0
	found_amount += T.air_contents.get_moles(GAS_PLASMA)
	return found_amount>=target_amount


/datum/objective_item/steal/functionalai
	name = "działające AI."
	targetitem = /obj/item/aicard
	difficulty = 20 //beyond the impossible

/datum/objective_item/steal/functionalai/check_special_completion(obj/item/aicard/C)
	for(var/mob/living/silicon/ai/A in C)
		if(isAI(A) && A.stat != DEAD) //See if any AI's are alive inside that card.
			return 1
	return 0

/datum/objective_item/steal/blueprints
	name = "plany statku."
	targetitem = /obj/item/areaeditor/blueprints
	difficulty = 10
	excludefromjob = list(JOB_NAME_CHIEFENGINEER)
	altitems = list(/obj/item/photo)

/datum/objective_item/steal/blueprints/check_special_completion(obj/item/I)
	if(istype(I, /obj/item/areaeditor/blueprints))
		return TRUE
	if(istype(I, /obj/item/photo))
		var/obj/item/photo/P = I
		if(P.picture.has_blueprints)	//if the blueprints are in frame
			return TRUE
	return FALSE

/datum/objective_item/steal/slime
	name = "niewykorzystaną próbkę ekstraktu ze slime'a."
	targetitem = /obj/item/slime_extract
	difficulty = 3
	excludefromjob = list(JOB_NAME_RESEARCHDIRECTOR,JOB_NAME_SCIENTIST)

/datum/objective_item/steal/slime/check_special_completion(obj/item/slime_extract/E)
	if(E.Uses > 0)
		return 1
	return 0

/datum/objective_item/steal/blackbox
	name = "Czarną Skrzynkę (the blackbox)."
	targetitem = /obj/item/blackbox
	difficulty = 10
	excludefromjob = list(JOB_NAME_CHIEFENGINEER,JOB_NAME_STATIONENGINEER,JOB_NAME_ATMOSPHERICTECHNICIAN)

//Unique Objectives
/datum/objective_item/unique/docs_red
	name = "\"Czerwone\" tajne dokumenty."
	targetitem = /obj/item/documents/syndicate/red
	difficulty = 10

/datum/objective_item/unique/docs_blue
	name = "\"Niebieskie\" tajne dokumenty."
	targetitem = /obj/item/documents/syndicate/blue
	difficulty = 10

/datum/objective_item/special/New()
	..()
	if(TargetExists())
		GLOB.possible_items_special += src
	else
		qdel(src)

/datum/objective_item/special/Destroy()
	GLOB.possible_items_special -= src
	return ..()

//Old ninja objectives.
/datum/objective_item/special/pinpointer/nuke
	name = "wskaźnik Kapitana."
	targetitem = /obj/item/pinpointer
	difficulty = 10

/datum/objective_item/special/aegun
	name = "zaawansowany pistolet energetyczny (advanced energy gun)."
	targetitem = /obj/item/gun/energy/e_gun/nuclear
	difficulty = 10

/datum/objective_item/special/ddrill
	name = "diamentowe wiertło."
	targetitem = /obj/item/pickaxe/drill/diamonddrill
	difficulty = 10

/datum/objective_item/special/boh
	name = "torbę bez dna (bag of holding)."
	targetitem = /obj/item/storage/backpack/holding
	difficulty = 10

/datum/objective_item/special/hypercell
	name = "hiper-pojemną baterię."
	targetitem = /obj/item/stock_parts/cell/hyper
	difficulty = 5

/datum/objective_item/special/laserpointer
	name = "wskaźnik laserowy."
	targetitem = /obj/item/laser_pointer
	difficulty = 5

/datum/objective_item/special/corgimeat
	name = "mięso corgiego."
	targetitem = /obj/item/reagent_containers/food/snacks/meat/slab/corgi
	difficulty = 5

/datum/objective_item/stack/New()
	..()
	if(TargetExists())
		GLOB.possible_items_special += src
	else
		qdel(src)

/datum/objective_item/stack/Destroy()
	GLOB.possible_items_special -= src
	return ..()

//Stack objectives get their own subtype
/datum/objective_item/stack
	name = "5 jednostek tektury."
	targetitem = /obj/item/stack/sheet/cardboard
	difficulty = 9001

/datum/objective_item/stack/check_special_completion(obj/item/stack/S)
	var/target_amount = text2num(name)
	var/found_amount = 0

	if(istype(S, targetitem))
		found_amount = S.amount
	return found_amount>=target_amount

/datum/objective_item/stack/diamond
	name = "10 diamentów."
	targetitem = /obj/item/stack/sheet/mineral/diamond
	difficulty = 10

/datum/objective_item/stack/gold
	name = "50 sztabek złota."
	targetitem = /obj/item/stack/sheet/mineral/gold
	difficulty = 15

/datum/objective_item/stack/uranium
	name = "25 sztabek wzbogaconego uranu."
	targetitem = /obj/item/stack/sheet/mineral/uranium
	difficulty = 10
