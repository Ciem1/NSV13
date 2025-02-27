/**
  * Run when a client is put in this mob or reconnets to byond and their client was on this mob
  *
  * Things it does:
  * * Adds player to player_list
  * * sets lastKnownIP
  * * sets computer_id
  * * logs the login
  * * tells the world to update it's status (for player count)
  * * create mob huds for the mob if needed
  * * reset next_move to 1
  * * parent call
  * * if the client exists set the perspective to the mob loc
  * * call on_log on the loc (sigh)
  * * reload the huds for the mob
  * * reload all full screen huds attached to this mob
  * * load any global alternate apperances
  * * sync the mind datum via sync_mind()
  * * call any client login callbacks that exist
  * * grant any actions the mob has to the client
  * * calls [auto_deadmin_on_login](mob.html#proc/auto_deadmin_on_login)
  * * send signal COMSIG_MOB_CLIENT_LOGIN
  * * attaches the ash listener element so clients can hear weather
  */
/mob/Login()
	add_to_player_list()
	lastKnownIP	= client.address
	computer_id	= client.computer_id
	log_access("Mob Login: [key_name(src)] was assigned to a [type]")
	world.update_status()
	client.screen = list()				//remove hud items just in case
	client.images = list()

	if(!hud_used)
		create_mob_hud()
	if(hud_used)
		hud_used.show_hud(hud_used.hud_version)
		hud_used.update_ui_style(ui_style2icon(client.prefs.UI_style))

	next_move = 1

	//SSdemo.write_event_line("setmob [client.ckey] \ref[src]") // AQ EDIT - Replays

	..()

	//We do this here to prevent hanging refs from ghostize or whatever, since if we were in another mob before this'll take care of it
	clear_client_in_contents()

	if (client && key != client.key)
		key = client.key
	reset_perspective(loc)

	if(loc)
		loc.on_log(TRUE)

	SEND_SIGNAL(src, COMSIG_MOB_LOGIN)

	//readd this mob's HUDs (antag, med, etc)
	reload_huds()

	reload_fullscreen() // Reload any fullscreen overlays this mob has.

	add_click_catcher()

	sync_mind()

	//Reload alternate appearances
	for(var/v in GLOB.active_alternate_appearances)
		if(!v)
			continue
		var/datum/atom_hud/alternate_appearance/AA = v
		AA.onNewMob(src)

	update_client_colour()
	update_mouse_pointer()
	if(client)
		if(client.view_size)
			client.view_size.default = (client.prefs.toggles2 & PREFTOGGLE_2_WIDESCREEN) ? CONFIG_GET(string/default_view) : "15x15" //Nsv13: This view size wrapper is extremely inconsistent and we need to finagle it a bit.
			//client.view_size.resetToDefault(getScreenSize(src))	// Sets the defaul view_size because it can be different to what it was on the lobby.
		else
			client.change_view(getScreenSize(src)) // Resets the client.view in case it was changed.

		//Reset verb information, give verbs accessible to the mob.
		if(client.tgui_panel)
			client.tgui_panel.set_verb_infomation(client)

		if(client.player_details.player_actions.len)
			for(var/datum/action/A in client.player_details.player_actions)
				A.Grant(src)

		for(var/foo in client.player_details.post_login_callbacks)
			var/datum/callback/CB = foo
			CB.Invoke()
		log_played_names(client.ckey,name,real_name)
		auto_deadmin_on_login()

	//Sort verbs
	add_verb(verbs.Copy(), TRUE)	//verbs.Copy() because otherwise you can't see the list

	log_message("Client [key_name(src)] has taken ownership of mob [src]([src.type])", LOG_OWNERSHIP)
	SEND_SIGNAL(src, COMSIG_MOB_CLIENT_LOGIN, client)
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_MOB_LOGGED_IN, src)

	AddElement(/datum/element/weather_listener, /datum/weather/ash_storm, ZTRAIT_ASHSTORM, GLOB.ash_storm_sounds)


/**
  * Checks if the attached client is an admin and may deadmin them
  *
  * Configs:
  * * flag/auto_deadmin_players
  * * client.prefs?.toggles & DEADMIN_ALWAYS
  * * User is antag and flag/auto_deadmin_antagonists or client.prefs?.toggles & DEADMIN_ANTAGONIST
  * * or if their job demands a deadminning SSjob.handle_auto_deadmin_roles()
  *
  * Called from [login](mob.html#proc/Login)
  */
/mob/proc/auto_deadmin_on_login() //return true if they're not an admin at the end.
	if(!client?.holder)
		return TRUE
	if(CONFIG_GET(flag/auto_deadmin_players) || (client.prefs?.toggles & PREFTOGGLE_DEADMIN_ALWAYS))
		return client.holder.auto_deadmin()
	if(mind.has_antag_datum(/datum/antagonist) && (CONFIG_GET(flag/auto_deadmin_antagonists) || client.prefs?.toggles & PREFTOGGLE_DEADMIN_ANTAGONIST))
		return client.holder.auto_deadmin()
	if(job)
		return SSjob.handle_auto_deadmin_roles(client, job)

