//used for holding information about unique properties of maps
//feed it json files that match the datum layout
//defaults to box
//  -Cyberboss

/datum/map_config //NSV EDITED START
	// Metadata
	var/config_filename = "_maps/atlas.json"
	var/defaulted = TRUE  // set to FALSE by LoadConfig() succeeding
	// Config from maps.txt
	var/config_max_users = 0
	var/config_min_users = 0
	var/voteweight = 1
	var/votable = FALSE

	//NSV edits all over
	var/map_name = "NSV Atlas - DEFAULTED"
	var/map_link = null //This is intentionally wrong, this will make it not link to webmap.
	var/map_path = "map_files/Atlas"
	var/map_file = list("atlas.dmm", "atlas2.dmm")
	var/ship_type = /obj/structure/overmap/nanotrasen/battlecruiser/starter
	var/mining_ship_type = null
	var/mine_disable = TRUE //NSV13 option - Allow disabling of mineship loading.
	var/mine_file = "Rocinante.dmm" //Nsv13 option
	var/mine_path = "map_files/Mining/nsv13" //NSV13 option
	var/list/omode_blacklist = list() //NSV13 - Blacklisted overmap modes - ie remove modes
	var/list/omode_whitelist = list() //NSV13 - Whitelisted overmap modes - ie add modes
	var/starmap_path = CONFIG_DIRECTORY + "/" + STARMAP_FILE //NSV13 - What starmap should this map load?
	var/return_system = "Outpost 45" //NSV13 - Which system are we jumping back to when the round ends?
	var/mine_traits = null
	var/has_gulag = FALSE // AQ EDIT

	//NSV13 - special mapvote things
	var/map_description = "No data"
	var/manufacturer = "No data"
	var/mapper = "No data"
	var/commission_date = "No data"
	var/list/strengths
	var/list/weaknesses
	var/list/equipment

	var/traits = list(
		list(
			"Up" = 1,
			"Linkage" = "Self",
			"Station" = 1,
			"Boardable Ship" = 1),
		list(
			"Down" = -1,
			"Linkage" = "Self",
			"Station" = 1,
			"Boardable Ship" = 1)
		)
	var/space_ruin_levels = -1
	var/space_empty_levels = 1

	var/allow_custom_shuttles = TRUE
	var/allow_night_lighting = TRUE
	var/shuttles = list(
		"cargo" = "cargo_gladius",
		"ferry" = "ferry_kilo",
		"emergency" = "emergency_atlas")

//NSV EDITED END
/proc/load_map_config(filename = "next_map", foldername = DATA_DIRECTORY, default_to_box, delete_after, error_if_missing = TRUE)
	if(IsAdminAdvancedProcCall())
		return

	filename = "[foldername]/[filename].json"
	var/datum/map_config/config = new
	if (default_to_box)
		return config
	if (!config.LoadConfig(filename, error_if_missing))
		qdel(config)
		config = new /datum/map_config  // Fall back to Box
	else if (delete_after)
		fdel(filename)
	return config

#define CHECK_EXISTS(X) if(!istext(json[X])) { log_world("[##X] missing from json!"); return; }
/datum/map_config/proc/LoadConfig(filename, error_if_missing)
	if(!fexists(filename))
		if(error_if_missing)
			log_world("map_config not found: [filename]")
		return

	var/json = file(filename)
	if(!json)
		log_world("Could not open map_config: [filename]")
		return

	json = rustg_file_read(json)
	if(!json)
		log_world("map_config is not text: [filename]")
		return

	json = json_decode(json)
	if(!json)
		log_world("map_config is not json: [filename]")
		return

	config_filename = filename

	CHECK_EXISTS("map_name")
	map_name = json["map_name"]
	CHECK_EXISTS("map_path")
	map_path = json["map_path"]

	map_file = json["map_file"]
	// "map_file": "BoxStation.dmm"
	if (istext(map_file))
		if (!fexists("_maps/[map_path]/[map_file]"))
			log_world("Map file ([map_path]/[map_file]) does not exist!")
			return
	// "map_file": ["Lower.dmm", "Upper.dmm"]
	else if (islist(map_file))
		for (var/file in map_file)
			if (!fexists("_maps/[map_path]/[file]"))
				log_world("Map file ([map_path]/[file]) does not exist!")
				return
	else
		log_world("map_file missing from json!")
		return

	if (islist(json["shuttles"]))
		var/list/L = json["shuttles"]
		for(var/key in L)
			var/value = L[key]
			shuttles[key] = value
	else if ("shuttles" in json)
		log_world("map_config shuttles is not a list!")
		return

	traits = json["traits"]
	// "traits": [{"Linkage": "Cross"}, {"Space Ruins": true}]
	if (islist(traits))
		// "Station" is set by default, but it's assumed if you're setting
		// traits you want to customize which level is cross-linked
		for (var/level in traits)
			if (!(ZTRAITS_STATION in level))
				level += ZTRAITS_STATION
	// "traits": null or absent -> default
	else if (!isnull(traits))
		log_world("map_config traits is not a list!")
		return

	var/temp = json["space_ruin_levels"]
	if (isnum_safe(temp))
		space_ruin_levels = temp
	else if (!isnull(temp))
		log_world("map_config space_ruin_levels is not a number!")
		return

	temp = json["space_empty_levels"]
	if (isnum_safe(temp))
		space_empty_levels = temp
	else if (!isnull(temp))
		log_world("map_config space_empty_levels is not a number!")
		return

	if("mine_disable" in json)
		mine_disable = json["mine_disable"]
	if(!mine_disable) //This ship needs a mining ship!
		mine_file = json["mine_file"]
		mine_path = json["mine_path"]
		if (istext(mine_file))
			if (!fexists("_maps/[mine_path]/[mine_file]"))
				log_world("Map file ([mine_path]/[mine_file]) does not exist!")
				return
		else if (islist(mine_file))
			for (var/file in mine_file)
				if (!fexists("_maps/[mine_path]/[file]"))
					log_world("Map file ([mine_path]/[file]) does not exist!")
					return
		else
			log_world("mine_file missing from json!")
			return

		CHECK_EXISTS("mining_ship_type")
		if("mining_ship_type" in json)
			mining_ship_type = text2path(json["mining_ship_type"])
		else
			log_world("mining_ship_type missing from json!")
			return

	//Nsv13 stuff. No CHECK_EXISTS because we don't want to yell at mappers if they don't override these two.
	if("omode_blacklist" in json) //Which modes we want disabled on this map
		omode_blacklist = json["omode_blacklist"]
	if("omode_whitelist" in json) //Which extra modes we want enabled on this map
		omode_whitelist = json["omode_whitelist"]
	if("starmap_path" in json)
		starmap_path = json["starmap_path"]
	if("return_system" in json)
		starmap_path = json["return_system"]
	if("map_description" in json)
		map_description = json["map_description"]
	if("manufacturer" in json)
		manufacturer = json["manufacturer"]
	if("mapper" in json)
		mapper = json["mapper"]
	if("commission_date" in json)
		commission_date = json["commission_date"]
	if("strengths" in json)
		strengths = json["strengths"]
	else
		strengths = list()
	if("weaknesses" in json)
		weaknesses = json["weaknesses"]
	else
		weaknesses = list()
	if("equipment" in json)
		equipment = json["equipment"]
	else
		equipment = list()

	CHECK_EXISTS("ship_type")
	if("ship_type" in json)
		ship_type = text2path(json["ship_type"])
	else
		log_world("ship_type missing from json!")
		return

	mine_traits = json["mine_traits"]
	// "traits": [{"Linkage": "Cross"}, {"Space Ruins": true}]
	if (islist(mine_traits))
		// "Station" is set by default, but it's assumed if you're setting
		// traits you want to customize which level is cross-linked
		for (var/level in mine_traits)
			if (!(ZTRAITS_BOARDABLE_SHIP in level))
				level += ZTRAITS_BOARDABLE_SHIP
	// "traits": null or absent -> default
	else if (!isnull(mine_traits))
		log_world("mine_traits is not a list!")
		return

	allow_custom_shuttles = json["allow_custom_shuttles"] != FALSE

	if("map_link" in json)						// NSV Changes begin
		map_link = json["map_link"]
	else
		log_world("map_link missing from json!")	// NSV Changes end

	allow_night_lighting = json["allow_night_lighting"] != FALSE

	if("has_gulag" in json)						// AQ EDIT
		has_gulag = json["has_gulag"]			//

	defaulted = FALSE
	return TRUE
#undef CHECK_EXISTS

/datum/map_config/proc/GetFullMapPaths()
	if (istext(map_file))
		return list("_maps/[map_path]/[map_file]")
	. = list()
	for (var/file in map_file)
		. += "_maps/[map_path]/[file]"

/datum/map_config/proc/is_votable()
	var/below_max = !(config_max_users) || GLOB.clients.len <= config_max_users
	var/above_min = !(config_min_users) || GLOB.clients.len >= config_min_users
	return votable && below_max && above_min

/datum/map_config/proc/MakeNextMap()
	return config_filename == "data/next_map.json" || fcopy(config_filename, "data/next_map.json")
