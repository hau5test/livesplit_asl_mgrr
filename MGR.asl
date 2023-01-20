/************************************************************************/
/* Metal Gear Rising Revennge PC Autosplitter v2                        */
/*                                                                      */
/* Game Compatibility:                                                  */
/*  * Metal Gear Rising Revengeance                                     */
/*                                                                      */
/* Created by JMaynard24                                                */
/* Original file: https://github.com/JMaynard24/ASL/blob/master/MGR.asl */
/* Updated by Hau5test                                                  */
/*                                                                      */
/* Thanks to Valeria_Chan for their input and advice                    */
/************************************************************************/

state("METAL GEAR RISING REVENGEANCE")
{
	bool    control   : 0x148DD2C; // player control
	bool    load      : 0x14B9200; // is loading
	bool    ray1      : 0x1B21820; // Ray 1 split
	int     ray2      : 0x1E5A508, 0x4, 0x3ac, 0x4; // Ray 2 split
	string9 gStr      : 0x14B9181; // game location string
	string9 gStr2	  : 0x14B91AD; // game location string 2
	string4 gStr3     : 0x14B9231; // game location string 3
	string4 gStr4     : 0x14B91A8; // game location string 4
	int     rAnim     : 0x019C14C4, 0x788, 0x618; // Raiden's current animation
	int     samStrong : 0x19D9754; // Armstrong split for Sam DLC
}
startup
{
	settings.Add("Main Game", true);
	settings.Add("Boss Rush", false);
	settings.Add("Sam DLC", false);
	settings.Add("Bladewolf DLC", false);
	vars.splitSettings = new List<string> {
		"Ray 1",
		"Ray 2",
		"Sam 1",
		"R00",
		"Blade Wolf",
		"Hammerhead",
		"Gate",
		"Hotel",
		"Mistral",
		"Sewers",
		"GRAD",
		"R02",
		"Doktor Elevator",
		"Railroad Skip",
		"Monsoon",
		"Offices",
		"Wallrun",
		"Freight Elevator",
		"Clone Fight",
		"Sundowner",
		"R05",
		"Sam 2",
		"Excelsus",
		"Armstrong",
	};
	settings.CurrentDefaultParent = "Main Game";
	foreach (string splits in vars.splitSettings) {
		settings.Add(splits, true);
	}
	vars.splitSettings2 = new List<string> {
		"Mistral Start",
		"Mistral QTE",
		"Monsoon Start",
		"Monsoon QTE",
		"Sundowner Start",
		"Sundowner QTE",
		"Sam Start",
		"Sam QTE",
		"Excelsus Start",
		"Excelsus QTE",
		"Armstrong Start",
		"Armstrong QTE",
		"Armstrong (Sam DLC) Start",
		"Armstrong (Sam DLC) QTE",
		"Kahmsin (Bladewolf DLC) Start"
	};
	settings.CurrentDefaultParent = "Boss Rush";
	foreach (string splits in vars.splitSettings2) {
		settings.Add(splits, true);
	}

	settings.CurrentDefaultParent = "Bladewolf DLC";
	settings.Add("Bladewolf DLC Chapter 01", true, "End of Chapter 1");
	settings.Add("Bladewolf DLC Chapter 02", true, "End of Chapter 2");
	settings.Add("Bladewolf DLC Chapter 03", true, "End of Chapter 3");
	settings.Add("Bladewolf DLC Chapter 04", true, "End of Chapter 4");
	settings.Add("Bladewolf DLC Chapter 05", true, "End of Chapter 5");
	settings.Add("Bladewolf DLC Chapter 06", true, "End of Chapter 6");
	
	settings.CurrentDefaultParent = "Bladewolf DLC Chapter 03";
	settings.Add("BDLC Chapter 3 Mission 1", true, "Splits the End of Mission 1 in Chapter 3");
	settings.Add("BDLC Chapter 3 Mission 2", true, "Splits the End of Mission 2 in Chapter 3");
	settings.Add("BDLC Chapter 3 Mission 3 Start", true, "Splits between the End of Mission 2 and Start of Mission 3 in Chapter 3");

	settings.CurrentDefaultParent = "Bladewolf DLC Chapter 04";
	settings.Add("BDLC Chapter 4 City", true, "Splits the Start of Heli Battle");
	settings.Add("BDLC Chapter 4 Heli", true, "Splits the Start of Bridge Battle");

	settings.CurrentDefaultParent = "Bladewolf DLC Chapter 05";
	settings.Add("BDLC Chapter 5 Battle", true, "Splits the End of First Battle");
	settings.Add("BDLC Chapter 5 Enter Mansion", true, "Splits the End leaving the Streets");

	settings.CurrentDefaultParent = "Sam DLC";
	settings.Add("Samwolf", true, "Wolf");
	settings.Add("Samray", true, "Ray");
	settings.Add("Samvator", true, "Elevator");
	settings.Add("Samstrong", true, "Armstrong");
}
start
{
	// Start of R-00
	if (current.gStr2 == "1_start" && old.gStr2 == "START") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	//three guys reset
	else if (current.gStr == "1" && current.load) {
		timer.Run.Offset = new TimeSpan(45600000);
	    return true;
	}
	// Start of R-01
	else if (current.gStr4 == "P118" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	//beach reset
	else if (current.gStr4 == "P118" && current.load) {
		timer.Run.Offset = new TimeSpan(30000000);
	    return true;
	}
	// Start of R-02
	else if (current.gStr4 == "P210" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of R-03
	else if (current.gStr4 == "P310" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of R-04
	else if (current.gStr4 == "P410" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of R-05
	else if (current.gStr4 == "P510" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of R-06
	else if (current.gStr4 == "P610" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of R-07
	else if (current.gStr4 == "EV60" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Mistral Boss Fight
	else if (current.gStr4 == "P170" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Monsoon Boss Fight
	else if (current.gStr4 == "P380" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Sundowner Boss Fight
	else if (current.gStr4 == "P470" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Jetstream Sam Boss
	else if (current.gStr4 == "P610" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Metal Gear Excelsus Boss
	else if (current.gStr4 == "P720" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Senator Armstrong Boss
	else if (current.gStr4 == "P730" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Senator Armstrong Boss (Sam DLC)
	else if (current.gStr4 == "PC60" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Kahmsin (Bladewolf DLC)
	else if (current.gStr4 == "PD60" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
	// Start of Bladewolf DLC
	else if (current.gStr4 == "PD10" && old.gStr4 == "PF01") {
		timer.Run.Offset = new TimeSpan(4600000);
		return true;
	}
}
split
{
    return settings["Ray 1"] && current.gStr == "ay01" && current.ray1 && !old.ray1 ||
           settings["Ray 2"] && current.gStr == "ay02_3" && current.ray2 == 5 && old.ray2 == 3 ||
           settings["Sam 1"] && current.gStr == "" && old.gStr == "am_3" ||
           settings["R00"] && current.gStr2 == "BEACH" && old.gStr2 == "" && current.gStr == "" ||
           settings["Blade Wolf"] && current.gStr == "WOLF"  && current.rAnim == 35 && old.rAnim == 33 && current.gStr3 != "STRE" ||
           settings["Hammerhead"] && (current.gStr == "SET" || current.gStr == "START") && old.gStr == "HELI01_EN" ||
           settings["Gate"] && current.gStr == "DOOR_CHEC" && old.gStr == "IN" ||
           settings["Hotel"] && (current.gStr == "HOTEL_IN" || current.gStr == "START") && old.gStr == "HOTEL_BTL" ||
           settings["Mistral"] && current.gStr == "MIST_RESU" && old.gStr == "MISTRAL03" ||
           settings["Mistral Start"] && current.gStr4 == "P170" && old.gStr4 == "PF01" ||
           settings["Mistral QTE"] && current.rAnim == 70 && (old.rAnim == 5 || old.rAnim == 261) && current.gStr2 == "MISTRAL03" ||
           settings["Sewers"] && current.gStr == "FIND_GATE" && current.rAnim != old.rAnim && current.rAnim == 43 ||
           settings["GRAD"] && current.gStr == "BOSS_END" && old.gStr == "ROBO_STAR" ||
           settings["R02"] && current.gStr == "EVENT2" && current.rAnim != old.rAnim && current.rAnim == 43 ||
           settings["Doktor Elevator"] && current.gStr == "ELV_IN" && (old.gStr == "OFFICE" || old.gStr == "ELV" || old.gStr == "ELV_END") ||
           settings["Railroad Skip"] && current.gStr == "START"  && old.gStr == "SUBWAY" ||
           settings["Monsoon"] && current.gStr == "MON_RESUL" && old.gStr == "FINISH_QT" ||
           settings["Monsoon Start"] && current.gStr4 == "P380" && old.gStr4 == "PF01" ||
           settings["Monsoon QTE"] && current.gStr == "FINISH_QT" && current.rAnim == 70 && old.rAnim == 290 ||
           settings["Offices"] && current.gStr == "GATE_END" && old.gStr == "GATE_OPEN" ||
           settings["Wallrun"] && current.gStr == "END" && old.gStr == "OUTER_WAL" ||
           settings["Freight Elevator"] && current.gStr3 == "END" && old.gStr3 == "RIDE"  ||
           settings["Clone Fight"] && current.gStr == "BTL_END" && old.gStr == "MON" ||
           settings["Sundowner Start"] && current.gStr4 == "P470" && old.gStr4 == "PF01" ||
           settings["Sundowner QTE"] && current.gStr == "QTE" && current.rAnim == 70 && old.rAnim == 319 ||
           settings["Sundowner"] && current.gStr == "SUN_RESUL" && old.gStr == "QTE" ||
           settings["R05"] && current.gStr == "" && old.gStr == "STREET" ||
           settings["Sam 2"] && current.gStr == "BOSS_END" && old.gStr == "BOSS" ||
           settings["Monsoon Start"] && current.gStr4 == "P730" && old.gStr4 == "PF01" ||
           settings["Sam QTE"] && current.gStr == "BOSS" && current.rAnim == 246 && old.rAnim == 70 ||
           settings["Excelsus"] && current.gStr == "QTE" && (old.rAnim == 70 || old.rAnim == 266) && current.rAnim == 264 ||
           settings["Excelsus Start"] && current.gStr4 == "P720" && old.gStr4 == "PF01" ||
           settings["Excelsus QTE"] && current.gStr == "QTE" && current.rAnim == 70 && old.rAnim == 266 ||
           settings["Armstrong Start"] && current.gStr4 == "P730" && old.gStr4 == "PF01" ||
           (settings["Armstrong"] || settings["Armstrong QTE"]) && current.rAnim == 297 && old.rAnim == 70 ||
           settings["Samwolf"] && current.gStr == "WOLF_END" && old.gStr != current.gStr ||
           settings["Samray"] && current.gStr == "RAY_END" && old.gStr == "RAY_RESUL" ||
           settings["Samvator"] && current.gStr == "START" && old.gStr == "ELV_END" ||
           settings["Armstrong (Sam DLC) Start"] && current.gStr4 == "PC60" && old.gStr4 == "PF01" ||
           (settings["Samstrong"] || settings["Armstrong (Sam DLC) QTE"]) && current.gStr == "QTE" && current.samStrong == 2 && old.samStrong == 1 ||
           settings["Kahmsin (Bladewolf DLC) Start"] && current.gStr4 == "PD60" && old.gStr4 == "PF01" ||
           settings["Bladewolf DLC Chapter 01"] && current.gStr4 == "PD20" && old.gStr4 == "PD10" ||
           settings["Bladewolf DLC Chapter 02"] && current.gStr4 == "PD30" && old.gStr == "MOVIE" && current.gStr == "MISSION1" ||
           settings["Bladewolf DLC Chapter 03"] && current.gStr4 == "PD40" && old.gStr4 == "PD30" ||
           settings["BDLC Chapter 3 Mission 1"] && current.gStr4 == "PD30" && old.gStr == "M1_RESULT" && current.gStr == "MISSION2" ||
           settings["BDLC Chapter 3 Mission 2"] && current.gStr4 == "PD30" && old.gStr == "M2_RESULT" && current.gStr == "M2_CLEAR" ||
           settings["BDLC Chapter 3 Mission 3 Start"] && current.gStr4 == "PD30" && old.gStr == "M2_CLEAR2" && current.gStr == "MISSION3" ||
           settings["Bladewolf DLC Chapter 04"] && current.gStr4 == "PD50" && old.gStr4 == "PD40" ||
           settings["BDLC Chapter 4 City"] && current.gStr4 == "PD40" && old.gStr == "HELI" && current.gStr == "HELI_BTL" ||
           settings["BDLC Chapter 4 Heli"] && current.gStr4 == "PD40" && old.gStr == "HELI_BTL" && current.gStr == "HELI_LOAD" ||
           settings["Bladewolf DLC Chapter 05"] && current.gStr4 == "PD60" && old.gStr4 == "PD50" ||
           settings["BDLC Chapter 5 Battle"] && current.gStr4 == "PD50" && old.gStr == "SET_LOAD2" && current.gStr == "SET_CODEC" ||
           settings["BDLC Chapter 5 Enter Mansion"] && current.gStr4 == "PD50" && old.gStr == "GATE" && current.gStr == "GATE_IN" ||
           settings["Bladewolf DLC Chapter 06"] && current.gStr4 == "PD60" && (old.gStr == "KHAMSIN" && current.gStr == "RESULT");
}

isLoading
{
    return current.load && !current.control;
}
init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}