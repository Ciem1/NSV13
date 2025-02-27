
#define ENGSEC			(1<<0)

#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)
#define BRIG_PHYS		(1<<11)
#define DEPUTY  		(1<<12)


#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define EXPLORATION_CREW (1<<2)
#define CHEMIST			(1<<3)
#define CMO_JF			(1<<4)
#define DOCTOR			(1<<5)
#define GENETICIST		(1<<6)
#define VIROLOGIST		(1<<7)
#define PARAMEDIC		(1<<8)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
#define COOK			(1<<3)
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
#define MINER			(1<<8)
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)
//NSV START

#define BRIDGE_OFFICER		(1<<14) //NSV13
#define MUNITIONS_TECHNICIAN	(1<<15) //NSV13
#define DECK_TECHNICIAN			(1<<16) //NSV13
#define PILOT					(1<<17) //NSV13
#define AIR_TRAFFIC_CONTROLLER	(1<<18) //NSV13
#define MASTER_AT_ARMS			(1<<19) //NSV13

//NSV END
#define GIMMICK 		(1<<20)
#define BARBER		    (1<<21)
#define MAGICIAN        (1<<22)
//Bitshifts beyond this point are nonfunctional. if Gimmick gets above here we're going to have a problem.
#define PSYCHIATRIST    (1<<23)
#define CELEBRITY       (1<<24)

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_SLOTFULL 5

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_BRIDGE_OFFICER 4 //NSV13 - everything from here out is incremented by one
#define JOB_DISPLAY_ORDER_QUARTERMASTER 5
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 6
#define JOB_DISPLAY_ORDER_SHAFT_MINER 7
#define JOB_DISPLAY_ORDER_BARTENDER 8
#define JOB_DISPLAY_ORDER_COOK 9
#define JOB_DISPLAY_ORDER_BOTANIST 10
#define JOB_DISPLAY_ORDER_JANITOR 11
#define JOB_DISPLAY_ORDER_CLOWN 12
#define JOB_DISPLAY_ORDER_MIME 13
#define JOB_DISPLAY_ORDER_CURATOR 14
#define JOB_DISPLAY_ORDER_LAWYER 15
#define JOB_DISPLAY_ORDER_CHAPLAIN 16
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 17
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 18
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 19
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 20
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 21
#define JOB_DISPLAY_ORDER_CHEMIST 22
#define JOB_DISPLAY_ORDER_GENETICIST 23
#define JOB_DISPLAY_ORDER_VIROLOGIST 24
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 25
#define JOB_DISPLAY_ORDER_SCIENTIST 26
#define JOB_DISPLAY_ORDER_EXPLORATION 27
#define JOB_DISPLAY_ORDER_ROBOTICIST 28
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 29
#define JOB_DISPLAY_ORDER_WARDEN 30
#define JOB_DISPLAY_ORDER_DETECTIVE 31
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 32
#define JOB_DISPLAY_ORDER_BRIG_PHYS 33
#define JOB_DISPLAY_ORDER_DEPUTY 34
#define JOB_DISPLAY_ORDER_AI 35
#define JOB_DISPLAY_ORDER_CYBORG 36
#define JOB_DISPLAY_ORDER_MASTER_AT_ARMS 37 // NSV13
#define JOB_DISPLAY_ORDER_MUNITIONS_TECHNICIAN 38 //NSV13
#define JOB_DISPLAY_ORDER_DECK_TECHNICIAN 39 //NSV13
#define JOB_DISPLAY_ORDER_AIR_TRAFFIC_CONTROLLER 40 //NSV13
#define JOB_DISPLAY_ORDER_PILOT 41 //NSV13

#define DEPARTMENT_BITFLAG_COMMAND (1<<0)
#define DEPARTMENT_BITFLAG_SERVICE (1<<1)
#define DEPARTMENT_BITFLAG_CARGO   (1<<2)
#define DEPARTMENT_BITFLAG_ENGINEERING (1<<3)
#define DEPARTMENT_BITFLAG_MEDICAL  (1<<4)
#define DEPARTMENT_BITFLAG_SCIENCE  (1<<5)
#define DEPARTMENT_BITFLAG_SECURITY (1<<6)
#define DEPARTMENT_BITFLAG_SILICON  (1<<7)
#define DEPARTMENT_BITFLAG_MUNITIONS (1<<8) //NSV13 munitions

//-------------------------------------------------------------------------------------------
//------------------------------------- Job names -------------------------------------------
//-------------------------------------------------------------------------------------------
// Command
#define JOB_NAME_CAPTAIN "Kapitan"

// Service
#define JOB_NAME_HEADOFPERSONNEL "Starszy Oficer" //NSV13 - XO
#define JOB_NAME_ASSISTANT  "Majtek" //NSV13 - Midshipmen
#define JOB_NAME_BARTENDER  "Barman"
#define JOB_NAME_BOTANIST   "Botanik"
#define JOB_NAME_COOK     "Kucharz"
#define JOB_NAME_JANITOR  "Woźny"
#define JOB_NAME_CURATOR  "Bibliotekarz"
#define JOB_NAME_LAWYER   "Prawnik"
#define JOB_NAME_CHAPLAIN "Kapłan"
#define JOB_NAME_MIME   "Mim"
#define JOB_NAME_CLOWN  "Klaun"
#define JOB_NAME_STAGEMAGICIAN "Magik" // gimmick
#define JOB_NAME_BARBER "Fryzjer" // gimmick
#define JOB_NAME_VIP    "VIP" // gimmick

// Cargo
#define JOB_NAME_QUARTERMASTER   "Kwatermistrz"
#define JOB_NAME_CARGOTECHNICIAN "Magazynier"
#define JOB_NAME_SHAFTMINER      "Górnik"

// Engineering
#define JOB_NAME_CHIEFENGINEER   "Główny Inżynier"
#define JOB_NAME_STATIONENGINEER "Inżynier"
#define JOB_NAME_ATMOSPHERICTECHNICIAN "Technik Atmosferyki"

// Medical
#define JOB_NAME_CHIEFMEDICALOFFICER "Ordynator"
#define JOB_NAME_MEDICALDOCTOR "Lekarz"
#define JOB_NAME_PARAMEDIC  "Sanitariusz"
#define JOB_NAME_CHEMIST    "Chemik"
#define JOB_NAME_VIROLOGIST "Wirolog"
#define JOB_NAME_GENETICIST "Genetyk"
#define JOB_NAME_BRIGPHYSICIAN "Lekarz Więzienny"
#define JOB_NAME_PSYCHIATRIST  "Psychiatra" // gimmick

// R&D
#define JOB_NAME_RESEARCHDIRECTOR "Dyrektor Naukowy"
#define JOB_NAME_SCIENTIST  "Naukowiec"
#define JOB_NAME_ROBOTICIST "Robotyk"
#define JOB_NAME_EXPLORATIONCREW "Odkrywca"

// Security
#define JOB_NAME_HEADOFSECURITY "Komendant"
#define JOB_NAME_WARDEN "Naczelnik"
#define JOB_NAME_SECURITYOFFICER "Żandarm" //NSV13 - MPs
#define JOB_NAME_DETECTIVE "Detektyw"
#define JOB_NAME_DEPUTY  "Aspirant"

// NSV13 - Munitions etc
#define JOB_NAME_MASTERATARMS "Mistrz Broni"
#define JOB_NAME_BRIDGESTAFF "Oficer Pokładowy"
#define JOB_NAME_MUNITIONSTECHNICIAN "Technik Amunicyjny"
#define JOB_NAME_PILOT "Pilot"
#define JOB_NAME_AIRTRAFFICCONTROLLER "Kontroler Lotów"
#define JOB_NAME_DECKTECHNICIAN "Technik Pokładowy"

// Silicon
#define JOB_NAME_AI     "SI Statku"
#define JOB_NAME_CYBORG "Cyborg"
#define JOB_NAME_PAI    "Osobista SI"

// ERTs
#define JOB_ERT_DEATHSQUAD      "Komandos Śmierci"
#define JOB_ERT_COMMANDER       "Dowódca Zespołu Reagowania Kryzysowego"
#define JOB_ERT_OFFICER         "Operator Kryzysowego Reagowania"
#define JOB_ERT_ENGINEER        "Inżynier Kryzysowego Reagowania"
#define JOB_ERT_MEDICAL_DOCTOR  "SAnitariusz Kryzysowego Reagowania"
#define JOB_ERT_CHAPLAIN        "Kapelan Kryzysowego Reagowania"
#define JOB_ERT_JANITOR         "Woźny Kryzysowego Reagowania"

// CentCom
#define JOB_CENTCOM_CENTRAL_COMMAND "Central Command"
#define JOB_CENTCOM_OFFICIAL  "Przedstawiciel Centralnego Dowództwa"
#define JOB_CENTCOM_ADMIRAL   "Admiral"
#define JOB_CENTCOM_COMMANDER "CentCom Commander"
#define JOB_CENTCOM_VIP       "VIP Guest"
#define JOB_CENTCOM_BARTENDER "CentCom Bartender"
#define JOB_CENTCOM_CUSTODIAN "Custodian"
#define JOB_CENTCOM_THUNDERDOME_OVERSEER "Thunderdome Overseer"
#define JOB_CENTCOM_MEDICAL_DOCTOR   "Medical Officer"
#define JOB_CENTCOM_RESEARCH_OFFICER "Research Officer"

// Misc & Off-Station
#define JOB_NAME_GIMMICK "Cywilne" // gimmick
#define JOB_NAME_KING    "King"
#define JOB_NAME_PRISONER "Prisoner"
#define JOB_SPACE_POLICE "Space Police"



//-------------------------------------------------------------------------------------------
//---------------------------------------- HUD ----------------------------------------------
//-------------------------------------------------------------------------------------------
////////// Job names based on hud icon names
// Command
#define JOB_HUD_RAWCOMMAND "rawcommand"
#define JOB_HUD_CAPTAIN  "captain"
#define JOB_HUD_ACTINGCAPTAIN  "actingcaptain"

// Service
#define JOB_HUD_RAWSERVICE "rawservice"
#define JOB_HUD_HEADOFPERSONNEL "headofpersonnel"
#define JOB_HUD_ASSISTANT "assistant"
#define JOB_HUD_BARTENDER "bartender"
#define JOB_HUD_COOK     "cook"
#define JOB_HUD_BOTANIST "botanist"
#define JOB_HUD_CHAPLAIN "chaplain"
#define JOB_HUD_CURATOR  "curator"
#define JOB_HUD_JANITOR  "janitor"
#define JOB_HUD_LAWYER   "lawyer"
#define JOB_HUD_MIME  "mime"
#define JOB_HUD_CLOWN "clown"
#define JOB_HUD_STAGEMAGICIAN "stagemagician"
#define JOB_HUD_BARBER "barber"

// Cargo
#define JOB_HUD_RAWCARGO "rawcargo"
#define JOB_HUD_QUARTERMASTER "quartermaster"
#define JOB_HUD_CARGOTECHNICIAN "cargotechnician"
#define JOB_HUD_SHAFTMINER "shaftminer"

// Engineering
#define JOB_HUD_RAWENGINEERING "rawengineering"
#define JOB_HUD_CHIEFENGINEER "chiefengineer"
#define JOB_HUD_STATIONENGINEER "stationengineer"
#define JOB_HUD_ATMOSPHERICTECHNICIAN "atmospherictechnician"

// Medical
#define JOB_HUD_RAWMEDICAL "rawmedical"
#define JOB_HUD_CHEIFMEDICALOFFICIER "chiefmedicalofficer"
#define JOB_HUD_MEDICALDOCTOR "medicaldoctor"
#define JOB_HUD_PARAMEDIC "paramedic"
#define JOB_HUD_VIROLOGIST "virologist"
#define JOB_HUD_CHEMIST "chemist"
#define JOB_HUD_GENETICIST "geneticist"
#define JOB_HUD_PSYCHIATRIST "psychiatrist"

// R&D
#define JOB_HUD_RAWSCIENCE "rawscience"
#define JOB_HUD_RESEARCHDIRECTOR "researchdirector"
#define JOB_HUD_SCIENTIST "scientist"
#define JOB_HUD_ROBOTICIST "roboticist"
#define JOB_HUD_EXPLORATIONCREW "explorationcrew"

// Security
#define JOB_HUD_RAWSECURITY "rawsecurity"
#define JOB_HUD_HEADOFSECURITY "headofsecurity"
#define JOB_HUD_SECURITYOFFICER "securityofficer"
#define JOB_HUD_WARDEN "warden"
#define JOB_HUD_DETECTIVE "detective"
#define JOB_HUD_BRIGPHYSICIAN "brigphysician"
#define JOB_HUD_DEPUTY "deputy"

//NSV13 - Munitions
#define JOB_HUD_RAWMUNITIONS "rawmunitions"
#define JOB_HUD_MASTERATARMS "masteratarms"
#define JOB_HUD_BRIDGESTAFF "bridgestaff"
#define JOB_HUD_MUNITIONSTECHNICIAN "munitionstechnician"
#define JOB_HUD_PILOT "pilot"
#define JOB_HUD_AIRTRAFFICCONTROLLER "airtrafficcontroller"
#define JOB_HUD_DECKTECHNICIAN "Deck Technician"

// CentCom
#define JOB_HUD_RAWCENTCOM "rawcentcom"
#define JOB_HUD_CENTCOM "centcom"
#define JOB_HUD_NOTCENTCOM "notcentcom" // used for police or something like

// MISC
#define JOB_HUD_VIP "vip"
#define JOB_HUD_KING "king"
#define JOB_HUD_SYNDICATE "syndicate"
#define JOB_HUD_PRISONER "prisoner"
#define JOB_HUD_UNKNOWN "unknown"


//////////// Color defines
// Command
#define JOB_CHATCOLOR_RAWCOMMAND    "#AFB4D3" // custom command color
#define JOB_CHATCOLOR_CAPTAIN       "#FFDC9B"
#define JOB_CHATCOLOR_ACTINGCAPTAIN "#FFDC9B"

// Service
#define JOB_CHATCOLOR_RAWSERVICE      "#BFE4B0" // custom service color
#define JOB_CHATCOLOR_HEADOFPERSONNEL "#7979D3"
#define JOB_CHATCOLOR_ASSISTANT "#BDBDBD"
#define JOB_CHATCOLOR_BARTENDER "#B2CEB3"
#define JOB_CHATCOLOR_COOK      "#A2FBB9"
#define JOB_CHATCOLOR_BOTANIST  "#95DE85"
#define JOB_CHATCOLOR_CURATOR   "#88C999"
#define JOB_CHATCOLOR_CHAPLAIN  "#8AB48C"
#define JOB_CHATCOLOR_JANITOR   "#97FBEA"
#define JOB_CHATCOLOR_LAWYER    "#C07D7D"
#define JOB_CHATCOLOR_MIME      "#BAD3BB"
#define JOB_CHATCOLOR_CLOWN     "#FF83D7"
#define JOB_CHATCOLOR_STAGEMAGICIAN  "#B898B3"
#define JOB_CHATCOLOR_BARBER    "#BD9E86"

// Cargo
#define JOB_CHATCOLOR_RAWCARGO        "#ECCE9A" // custom cargo color
#define JOB_CHATCOLOR_QUARTERMASTER   "#C79C52"
#define JOB_CHATCOLOR_CARGOTECHNICIAN "#D3A372"
#define JOB_CHATCOLOR_SHAFTMINER      "#CE957E"

// Engineering
#define JOB_CHATCOLOR_RAWENGINEERING        "#E9D1A8" // custom engineering color
#define JOB_CHATCOLOR_CHIEFENGINEER         "#CFBB72"
#define JOB_CHATCOLOR_STATIONENGINEER       "#D9BC89"
#define JOB_CHATCOLOR_ATMOSPHERICTECHNICIAN "#D4A07D"

// Medical
#define JOB_CHATCOLOR_RAWMEDICAL           "#B1E5EC" // custom medical color
#define JOB_CHATCOLOR_CHEIFMEDICALOFFICIER "#7A97DA"
#define JOB_CHATCOLOR_MEDICALDOCTOR "#6CB1C5"
#define JOB_CHATCOLOR_PARAMEDIC     "#8FBEB4"
#define JOB_CHATCOLOR_VIROLOGIST    "#75AEA3"
#define JOB_CHATCOLOR_CHEMIST       "#82BDCE"
#define JOB_CHATCOLOR_GENETICIST    "#83BBBF"
#define JOB_CHATCOLOR_PSYCHIATRIST  "#A2DFDC"

// R&D
#define JOB_CHATCOLOR_RAWSCIENCE       "#F3BFF3" // custom R&D color
#define JOB_CHATCOLOR_RESEARCHDIRECTOR "#974EA9"
#define JOB_CHATCOLOR_SCIENTIST        "#C772C7"
#define JOB_CHATCOLOR_ROBOTICIST       "#AC71BA"
#define JOB_CHATCOLOR_EXPLORATIONCREW  "#85D8B8"

// Security
#define JOB_CHATCOLOR_RAWSECURITY     "#F3BDC0" // custom security color, has some color than deputy
#define JOB_CHATCOLOR_HEADOFSECURITY  "#D33049"
#define JOB_CHATCOLOR_WARDEN          "#EA545E"
#define JOB_CHATCOLOR_SECURITYOFFICER "#E6A3A3"
#define JOB_CHATCOLOR_DETECTIVE       "#C78B8B"
#define JOB_CHATCOLOR_BRIGPHYSICIAN   "#B16789"
#define JOB_CHATCOLOR_DEPUTY          "#FFEEEE"

//NSV13 - Munitions
#define JOB_CHATCOLOR_RAWMUNITIONS "#FF7F00"
#define JOB_CHATCOLOR_MASTERATARMS "#FF7F00"
#define JOB_CHATCOLOR_BRIDGESTAFF "#2681a5"
#define JOB_CHATCOLOR_MUNITIONSTECHNICIAN "#ff9020"
#define JOB_CHATCOLOR_PILOT "#4088a5"
#define JOB_CHATCOLOR_AIRTRAFFICCONTROLLER "#5588a5"
#define JOB_CHATCOLOR_DECKTECHNICIAN "#ffaa56"

// CentCom
#define JOB_CHATCOLOR_RAWCENTCOM "#A7F08F" // custom CC Color
#define JOB_CHATCOLOR_CENTCOM    "#90FD6D"

// ETC
#define JOB_CHATCOLOR_VIP        "#EBC96B"
#define JOB_CHATCOLOR_KING       "#DCEC49" // somehow golden?
#define JOB_CHATCOLOR_SYNDICATE  "#997272" // I really didn't care the color
#define JOB_CHATCOLOR_NOTCENTCOM "#6D6AEC" // i.e. space police
#define JOB_CHATCOLOR_PRISONER   "#D38A5C"
#define JOB_CHATCOLOR_UNKNOWN    "#DDA583" // grey hud icon gets this
