//=====================================================================//
//=====================================================================//
//                     Enttiy Think Utilities v1                       //
//                                                                     //
//      Author:  Neddslayer                                            //
//      License: GNU GPL v3.0                                          //
//      GitHub:  https://github.com/Neddslayer/entity-think-utils      //
//---------------------------------------------------------------------//
//=====================================================================//
//=====================================================================//


::EntityThinkScripts <- {};

::CBaseEntity.StartThinking <-  function() {
	if (this.ValidateScriptScope()) {
		local entityScriptScope = this.GetScriptScope();

		entityScriptScope["modular_think"] <-  function() {
			if (!(self in EntityThinkScripts)) return;
			if (EntityThinkScripts[self].len() <= 0) return; // if the length is less than 0... uh

			foreach(scriptname, scriptfunction in EntityThinkScripts[self]) {
				if (typeof scriptfunction == "function") {
					scriptfunction();
				}
			}

			return -1;
		}

		AddThinkToEnt(this, "modular_think");

		EntityThinkScripts[this] <- {};
	}
};

::CBaseEntity.AddEntityThink <-  function(name, script) {
	if (this.ValidateScriptScope()) {
		EntityThinkScripts[this][name] <- script;
	} else {
		printl("WARNING: script scope validation failed!");
	}
};

::CBaseEntity.RemoveEntityThink <-  function(name) {
	if ((name in EntityThinkScripts[this])) {
		delete EntityThinkScripts[this][name];
	} else {
		printl("WARNING: attempted to delete non-existent script!");
	}
}