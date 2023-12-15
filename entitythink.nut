//=====================================================================//
//=====================================================================//
//                     Player Think Utilities v1.1                     //
//                                                                     //
//      Author:  Neddslayer                                            //
//      License: GNU GPL v3.0                                          //
//      GitHub:  https://github.com/Neddslayer/player-think-utils      //
//---------------------------------------------------------------------//
//=====================================================================//
//=====================================================================//


::PlayerThinkScripts <- {};

::CTFPlayer.StartThinking <-  function() {
	if (this.ValidateScriptScope()) {
		local entityScriptScope = this.GetScriptScope();

		entityScriptScope["modular_think"] <-  function() {
			if (!(self in PlayerThinkScripts)) return;
			if (PlayerThinkScripts[self].len() <= 0) return; // if the length is less than 0... uh

			foreach(scriptname, scriptfunction in PlayerThinkScripts[self]) {
				if (typeof scriptfunction == "function") {
					scriptfunction();
				}
			}

			return -1;
		}

		AddThinkToEnt(this, "modular_think");

		PlayerThinkScripts[this] <- {};
	}
};

::CTFPlayer.AddPlayerThink <-  function(name, script, overwrite) {
	if (this.ValidateScriptScope()) {
		if ((overwrite && name in PlayerThinkScripts[this]) || !(name in PlayerThinkScripts[this])) PlayerThinkScripts[this][name] <- script;
	} else {
		printl("WARNING: script scope validation failed!");
	}
};

::CTFPlayer.RemovePlayerThink <-  function(name) {
	if ((name in PlayerThinkScripts[this])) {
		delete PlayerThinkScripts[this][name];
	} else {
		printl("WARNING: attempted to delete non-existent script!");
	}
}
