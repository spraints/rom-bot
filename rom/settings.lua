settings_default = {
	hotkeys = {
		MOVE_FORWARD = {key = _G.key.VK_W, modifier = nil},
		MOVE_BACKWARD = {key = _G.key.VK_S, modifier = nil},
		ROTATE_LEFT = {key = _G.key.VK_Q, modifier = nil},
		ROTATE_RIGHT = {key = _G.key.VK_E, modifier = nil},
		STRAFF_LEFT = {key = _G.key.VK_A, modifier = nil},
		STRAFF_RIGHT = {key = _G.key.VK_D, modifier = nil},
		JUMP = {key = _G.key.VK_SPACE, modifier = nil},
		TARGET = {key = _G.key.VK_TAB, modifier = nil},
		TARGET_FRIEND = {key = _G.key.J, modifier = nil},
		ESCAPE = {key = _G.key.VK_ESCAPE, modifier = nil},
		START_BOT = {key = _G.key.VK_DELETE, modifier = nil},
		STOP_BOT = {key = _G.key.VK_END, modifier = nil}
	},
	options = {
		ENABLE_FIGHT_SLOW_TURN = false,
		MELEE_DISTANCE = 50,
		LANGUAGE = "english",
		USE_CLIENT_LANGUAGE = true,		-- automatic use client language after loading the bot
		DEBUGGING = false,
		DEBUGGING_MACRO = false,
		ROMDATA_PATH = nil,
	},
	profile = {
		options = {
			-- common options
			HP_LOW = 85,
			MP_LOW_POTION = 50,
			HP_LOW_POTION = 40,
			COMBAT_TYPE = "melee",
			COMBAT_RANGED_PULL = "true",	-- only for melee classes , use ranged skill to pull
			COMBAT_DISTANCE = 200,
			ANTI_KS = true,
			WAYPOINTS = "demo.xml",
			RETURNPATH = nil,
			PATH_TYPE = "waypoints",
			WANDER_RADIUS = 500,
			WAYPOINT_DEVIATION = 0,
			LOOT = true,
			LOOT_ALL = false,
			LOOT_IGNORE_LIST_SIZE = 10,
			LOOT_TIME = 2000,
			LOOT_AGAIN = 2000,				-- second loot try if rooted after x ms
			LOOT_IN_COMBAT = true,
			LOOT_DISTANCE = nil,
			LOOT_PAUSE_AFTER = 10,			-- probability in % for short pause after loot to look more human
			HARVEST_DISTANCE = 120,
			HARVEST_WOOD = true,
			HARVEST_HERB = true,
			HARVEST_ORE = true,
			MAX_FIGHT_TIME = 12,
			DOT_PERCENT = 90,
			LOGOUT_TIME = 0,
			LOGOUT_SHUTDOWN = false,
			LOGOUT_WHEN_STUCK = true,
			MAX_UNSTICK_TRIALS = 10,
			TARGET_LEVELDIF_BELOW = 99,
			TARGET_LEVELDIF_ABOVE = 99,
			QUICK_TURN = false,
			MP_REST = 15,
			HP_REST = 15,
			RES_AUTOMATIC_AFTER_DEATH = false,	-- automatic resurrect after death true|false,
			HEALING_POTION = 0,				-- shopping options, how many to buy/have in inventory
			MANA_POTION = 0,				-- shopping options, how many to buy/have in inventory
			ARROW_QUIVER = 0,				-- shopping options, how many to buy/have in inventory
			THROWN_BAG = 0,					-- shopping options, how many to buy/have in inventory
			POISON = 0,						-- shopping options, how many to buy/have in inventory
			EGGPET_HOE = 0,					-- shopping options, how many to buy/have in inventory
			EGGPET_SPADE = 0,				-- shopping options, how many to buy/have in inventory
			EGGPET_HATCHET = 0,				-- shopping options, how many to buy/have in inventory
			RELOAD_AMMUNITION = false,		-- false|arrow|thrown
			EGGPET_ENABLE_CRAFT = false,
			EGGPET_CRAFT_SLOT = nil,
			EGGPET_ENABLE_ASSIST = false,
			EGGPET_ASSIST_SLOT = nil,
			EGGPET_CRAFT_RATIO = "1:1:1",	-- mining:woodworking:herbalism ratio to use when crafting. '0' means do not craft that type.
			EGGPET_CRAFT_INDEXES = ",,",	-- Index level override for mine:wood:herb eg. ",,1" will only create index level 1 herb items


			-- expert options
			MAX_SKILLUSE_NODMG = 3,				-- maximum casts without damaging the target before break it
			MAX_TARGET_DIST = 250,			-- maximum distance to select a target (helpfull to limit at small places)
			AUTO_ELITE_FACTOR = 5,			-- mobs with x * your HP value counts as 'Elite' and we will not target it
			AUTO_TARGET = true,				-- bot will target mobs automaticly (set it to false if you want to use the bot only as fight support)
			SKILL_GLOBALCOOLDOWN = 1200,	-- Global Skill Use Cooldown (1000ms) we use a little more
			SKILL_USE_PRIOR = "auto",			-- cast x ms before cooldown is finished
			PK_COUNTS_AS_DEATH = true,		-- count playerkill's as death
			POTION_COOLDOWN = 15,			-- always 15
			POTION_COOLDOWN_HP = 0,			-- will only be used if not 0, if 0 POTION_COOLDOWN will be used
			POTION_COOLDOWN_MANA = 0,		-- will only be used if not 0, if 0 POTION_COOLDOWN will be used
			SIT_WHILE_RESTING = false,		-- sit while using the rest function
			USE_MANA_POTION = "best",		-- which mana potion type to use: best | minstack
			USE_HP_POTION = "best",			-- which HP potion type to use: best | minstack
			WAYPOINTS_REVERSE = false,		-- use the waypoint file in reverse order
			WAYPOINT_PASS = 100,			-- skip a waypoint if we pass in distance x while fighting a mob (go to as melee)
			WAYPOINT_PASS_DEGR = 90,		-- skip a waypoint if we touched one and the next is at least x degrees in front
			MAX_DEATHS = 10,				-- maximal death if automatic resurrect befor logout
			WAIT_TIME_AFTER_RES = 8000,		-- time to wait after resurrection, needs more on slow PCs
			RETURNPATH_SUFFIX = "_return",	-- suffix for default naming of returnpath
			HARVEST_SCAN_WIDTH = 5,			-- steps horizontal
			HARVEST_SCAN_HEIGHT = 5,		-- steps vertical
			HARVEST_SCAN_STEPSIZE = 60,		-- wide of every step
			HARVEST_SCAN_TOPDOWN = false,	-- true = top->down  false = botton->up
			HARVEST_SCAN_XMULTIPLIER = 1.0,	-- multiplier for scan width
			HARVEST_SCAN_YMULTIPLIER = 1.1,	-- multiplier for scan line height
			HARVEST_SCAN_YREST = 10,		-- scanspeed
			HARVEST_SCAN_YMOVE = 1.1,		-- move scan area top/down ( 1=middle of screen )
			HARVEST_TIME = 45,				-- how long we maximum harvest a node
			USE_SLEEP_AFTER_RESUME = false, -- enter sleep mode after pressing pause/resume key
			IGNORE_MACRO_ERROR = false, 	-- ignore missing MACRO hotkey error (only temporary option while beta)
			DEBUG_INV = false,	 			-- to help to find the item use error (only temporary option while beta)
			DEBUG_LOOT = false,	 			-- debug loot issues
			DEBUG_TARGET = false, 			-- debug targeting issues
			DEBUG_HARVEST = false, 			-- debug harvesting issues
			DEBUG_WAYPOINT = false, 		-- debug waypoint issues
			DEBUG_AUTOSELL = false, 		-- debug autosell issues

			-- debug skill use issues
			DEBUG_SKILLUSE = {
				ENABLE 		= false,
				TIMEGAP		= true,		-- show the time gap between cast starts
				ONCOOLDOWN	= true,		-- show the time in ms that we are before the cooldown
				NOCOOLDOWN	= true,		-- show the time in ms that we are over the cooldown
				HPLOW		= true
				},

			-- expert inventar
			INV_MAX_SLOTS = 60,	 			-- maximal slots to update in the inventory:update()
			INV_UPDATE_INTERVAL = 300,	 	-- full inventory update every x seconds (only used indirect atm)
			INV_AUTOSELL_ENABLE = false,	-- autosell items at merchant true|false
			INV_AUTOSELL_FROMSLOT = 0,		-- autosell from slot #
			INV_AUTOSELL_TOSLOT = 0,		-- autosell to slot #
			INV_AUTOSELL_QUALITY = "white",	-- itemcolors to sell
			INV_AUTOSELL_IGNORE = nil,		-- itemnames never so sell
			INV_AUTOSELL_NOSELL_DURA = 0,	-- durability > x will not sell, 0=sell all
			INV_AUTOSELL_STATS_NOSELL = nil,	-- stats (text search at right tooltip side) that will not be selled
			INV_AUTOSELL_STATS_SELL = nil,		-- stats (text search at right tooltip side) that will be selled, even if in nosell


		},
		hotkeys = {  },
		skills = {},
		skillsData = {},
		friends = {},
		mobs = {},
		events = {
			onDeath = nil,
			onLoad = nil,
			onLeaveCombat = nil,
			onPreSkillCast = nil,
			onSkillCast = nil,
			onLevelup = nil,
			onHarvest = nil,
			onUnstickFailure = nil,
		}
	},
};

bot =	{ 		-- global bot values
		ClientLanguage,		-- ingame language of the game [ DE|RU|FR|ENUS|ENEU
		GetTimeFrequency,	-- calculated CPU frequency for calculating with the getTime() function
		LastSkillKeypressTime = getTime(),	-- remember last time we cast (press key)
		IgfAddon = false,	-- check if igf addon is active
		};


if( table.copy == nil ) then
	table.copy = function (_other)
		local t = {};
		for i,v in pairs(_other) do
			if type(v) == "table" then
				t[i] = table.copy(v)
			else
				t[i] = v;
			end
		end
		return t;
	end
end

settings = table.copy(settings_default);

check_keys = { name = { } };
function checkKeySettings( _name, _key, _modifier)
-- args are the VK in stringform like "VK_CONTROL", "VK_J", ..

	local hf_check_where;
	if( bindings ) then	-- keys are from bindings.txt
		hf_check_where = language[141];		-- Datei settings.xml
	else
		hf_check_where = language[140];		-- Ingame -> System -> Tastenbelegung
	end

	local msg = nil;
	-- no empty keys pls
	if( _key == nil) then
		msg = sprintf(language[115], _name);	-- key for \'%s\' is empty!
		msg = msg .. hf_check_where;
	end

	-- check if all keys are valid virtual keys (VK)
	if( _key ) then
		if( key[_key]  == nil  and
			string.upper(_key) ~= "MACRO" ) then	-- hotekey MACRO is a special case / it's not a virtual key
			msg = sprintf(language[116], _key, _name);	-- The hotkey ... is not a valid key
			msg = msg .. hf_check_where;
		end
	end;

	-- no modifiers allowed at the moment
	if( _modifier ) then
		if( key[_modifier]  == nil ) then
			msg = sprintf(language[117], _modifier, _name);	-- The modifier ... is not a valid key
			msg = msg .. hf_check_where;
		end
	end;

	-- now we check for double key settings
	-- we translate the strings "VK..." to the VK numbers
	if( string.upper(_key) ~= "MACRO" ) then
		_key = key[_key];
	end
	_modifier = key[_modifier];

	-- check the using of modifiers
	-- they are not usable at the moment

	-- error output
	if( msg ~= nil) then
		-- only a warning for TARGET_FRIEND / else an error
		if(_name == "TARGET_FRIEND") then
			cprintf(cli.yellow, msg .. language[119]);	-- can't use the player:target_NPC() function
		else
			error(msg, 0);
		end
	end

	-- check for double key settings
	for i,v in pairs(check_keys) do
		if( v.name ~= _nil and	-- empty entries from deleted settings.xml entries
		    v.key == _key  and
		    string.upper(_key) ~= "MACRO" and	-- hotkey MACRO is allowed to set more then once
		    v.modifier == _modifier ) then
			local modname;

			if( v.modifier ) then
				modname = getKeyName(v.modifier).."+";
			else
				modname = "";
			end;

			local errstr = sprintf(language[121],	-- assigned the key \'%s%s\' double
				modname,
				getKeyName(v.key),
				v.name, _name) ..
				hf_check_where;
			error(errstr, 0);
		end
	end;

	check_keys[_name] = {};
	check_keys[_name].name = _name;
	check_keys[_name].key = _key;
	check_keys[_name].modifier = _modifier;
end


function settingsPrintKeys()
-- That function prints the loaded key settings to the MM window and to the log

	local msg;
	msg ="QUICK_TURN = "..tostring(settings.profile.options.QUICK_TURN);	-- we wander around
	logMessage(msg);		-- log keyboard settings

	if( bindings ) then		-- we read from bindings.txt
		msg = sprintf(language[167], "bindings.txt");	-- Keyboard settings are from
	else				-- we read settings.xml
		msg = sprintf(language[167], "settings.xml");	-- Keyboard settings are from
	end

--	cprintf(cli.green, msg.."\n");	-- Keyboard settings are from
	logMessage(msg);		-- log keyboard settings

	for i,v in pairs(check_keys) do

		if(v.name) then

			msg = string.sub(v.name.."                               ", 1, 30);	-- function name

			local modname;
			if( v.modifier ) then
				modname = getKeyName(v.modifier).."+";	-- modifier name
			else
				modname = "";
			end;

			local keyname;
			if( string.upper(v.key) == "MACRO" ) then
				keyname = "MACRO";
			else
				keyname = getKeyName(v.key);
			end

			msg = msg..modname..keyname;	-- add key name
--			printf(msg.."\n");			-- print line
			logMessage(msg);			-- log keyboard settings

		end;
	end;

end


function settings.load()
	local filename = getExecutionPath() .. "/settings.xml";
	local root = xml.open(filename);
	local elements = root:getElements();

	check_keys = { };	-- clear table, because of restart from createpath.lua

	-- Specific to loading the hotkeys section of the file
	local loadHotkeys = function (node)
		local elements = node:getElements();
		for i,v in pairs(elements) do
			-- If the hotkey doesn't exist, create it.
			settings.hotkeys[ v:getAttribute("description") ] = { };
			settings.hotkeys[ v:getAttribute("description") ].key = key[v:getAttribute("key")];
			settings.hotkeys[ v:getAttribute("description") ].modifier = key[v:getAttribute("modifier")];

			if( key[v:getAttribute("key")] == nil ) then
				local err = sprintf(language[122],	-- does not have a valid hotkey!
				  v:getAttribute("description"));
				error(err, 0);
			end

			checkKeySettings( v:getAttribute("description"),
			  v:getAttribute("key"),
			  v:getAttribute("modifier") );
		end
	end

	local loadOptions = function (node)
		local elements = node:getElements();
		for i,v in pairs(elements) do
			settings.options[ v:getAttribute("name") ] = v:getAttribute("value");
		end
	end

	-- Load RoM keyboard bindings.txt file
	local function load_RoM_bindings_txt()
		local filename, file;

		local userprofilePath = os.getenv("USERPROFILE");
		local documentPaths = {
			userprofilePath .. "\\My Documents\\" .. "Runes of Magic", -- English
			userprofilePath .. "\\Eigene Dateien\\" .. "Runes of Magic", -- German
			userprofilePath .. "\\Mes Documents\\" .. "Runes of Magic", -- French
			userprofilePath .. "\\Omat tiedostot\\" .. "Runes of Magic", -- Finish
			userprofilePath .. "\\Belgelerim\\" .. "Runes of Magic", -- Turkish
			userprofilePath .. "\\Mina Dokument\\" .. "Runes of Magic", -- Swedish
			userprofilePath .. "\\Dokumenter\\" .. "Runes of Magic", -- Danish
			userprofilePath .. "\\Documenti\\" .. "Runes of Magic", -- Italian
			userprofilePath .. "\\Mijn documenten\\" .. "Runes of Magic", -- Dutch
			userprofilePath .. "\\Moje dokumenty\\" .. "Runes of Magic", -- Polish
			userprofilePath .. "\\Mis documentos\\" .. "Runes of Magic", -- Spanish
			userprofilePath .. "\\Os Meus Documentos\\" .. "Runes of Magic", -- Portuguese
		};

		-- Use a user-specified path from settings.xml
		if( settings.options.ROMDATA_PATH ) then
			table.insert(documentPaths, settings.options.ROMDATA_PATH);
		end

		-- Select the first path that exists
		for i,v in pairs(documentPaths) do
			if( string.sub(v, -1 ) ~= "\\" and string.sub(v, -1 ) ~= "/" ) then
				v = v .. "\\"; -- Append the trailing backslash if necessary.
			end

			local filename = v .. "bindings.txt";
			if( fileExists(filename) ) then
				file = io.open(filename, "r");
				local tmp = filename;
				cprintf(cli.green, language[123], filename);	-- read the hotkey settings from your bindings.txt
			end
		end

		-- If we wern't able to locate a document path, return.
		if( file == nil ) then
			return;
		end

		-- delete hotkeys from settings.xml in check table to avoid double entries / wrong checks
		check_keys["MOVE_FORWARD"] = nil;
		check_keys["MOVE_BACKWARD"] = nil;
		check_keys["ROTATE_LEFT"] = nil;
		check_keys["ROTATE_RIGHT"] = nil;
		check_keys["STRAFF_LEFT"] = nil;
		check_keys["STRAFF_RIGHT"] = nil;
		check_keys["JUMP"] = nil;
		check_keys["TARGET"] = nil;
		check_keys["TARGET_FRIEND"] = nil;
		check_keys["ESCAPE"] = nil;

		-- Load bindings.txt into own table structure
		bindings = { name = { } };
		-- read the lines in table 'lines'
		for line in file:lines() do
			for name, key1, key2 in string.gfind(line, "(%w*)%s([%w+]*)%s*([%w+]*)") do
				bindings[name] = {};
				bindings[name].key1 = key1;
				bindings[name].key2 = key2;

				--settings.hotkeys[name].key =
			end
		end

		local function bindHotkey(bindingName)
			local links = { -- Links forward binding names to hotkey names
				MOVEFORWARD = "MOVE_FORWARD",
				MOVEBACKWARD = "MOVE_BACKWARD",
				TURNLEFT = "ROTATE_LEFT",
				TURNRIGHT = "ROTATE_RIGHT",
				STRAFELEFT = "STRAFF_LEFT",
				STRAFERIGHT = "STRAFF_RIGHT",
				JUMP = "JUMP",
				TARGETNEARESTENEMY = "TARGET",
				TARGETNEARESTFRIEND = "TARGET_FRIEND",
				TOGGLEGAMEMENU = "ESCAPE",
			};

			local hotkeyName = bindingName;
			if(links[bindingName] ~= nil) then
				hotkeyName = links[bindingName];
			end;


			if( bindings[bindingName] ~= nil ) then
				if( bindings[bindingName].key1 ~= nil ) then
					-- Fix key names
					bindings[bindingName].key1 = string.gsub(bindings[bindingName].key1, "CTRL", "CONTROL");

					if( string.find(bindings[bindingName].key1, '+') ) then
						local parts = explode(bindings[bindingName].key1, '+');
						-- parts[1] = modifier
						-- parts[2] = key

						settings.hotkeys[hotkeyName].key = key["VK_" .. parts[2]];
						settings.hotkeys[hotkeyName].modifier = key["VK_" .. parts[1]];
						checkKeySettings(hotkeyName, "VK_" .. parts[2], "VK_" .. parts[1] );
					else
						settings.hotkeys[hotkeyName].key = key["VK_" .. bindings[bindingName].key1];
						checkKeySettings(hotkeyName, "VK_" .. bindings[bindingName].key1 );
					end

				else
					local err = sprintf(language[124], bindingName);	-- no ingame hotkey for
					error(err, 0);
				end
			end
		end

		bindHotkey("MOVEFORWARD");
		bindHotkey("MOVEBACKWARD");
		bindHotkey("TURNLEFT");
		bindHotkey("TURNRIGHT");
		bindHotkey("STRAFELEFT");
		bindHotkey("STRAFERIGHT");
		bindHotkey("JUMP");
		bindHotkey("TARGETNEARESTENEMY");
		bindHotkey("TARGETNEARESTFRIEND");
		bindHotkey("TOGGLEGAMEMENU");
	end

	-- check ingame settings
	-- only if we can find the bindings.txt file
	local function check_ingame_settings( _name, _ingame_key)
	-- no more needed, because we take the keys from the file if we found the file

		if( not bindings ) then		-- no bindings.txt file loaded
			return
		end;

		if( settings.hotkeys[_name].key ~= key["VK_"..bindings[_ingame_key].key1] and
		settings.hotkeys[_name].key ~= key["VK_"..bindings[_ingame_key].key2] ) then
			local msg = sprintf(language[125], _name);	-- settings.xml don't match your RoM ingame
			error(msg, 0);
		end
	end


	function checkHotkeys(_name, _ingame_key)
		if( not settings.hotkeys[_name] ) then
			error(language[126] .. _name, 0);	-- Global hotkey not set
		end

		-- check if settings.lua hotkeys match the RoM ingame settings
		-- check_ingame_settings( _name, _ingame_key);
	end


	for i,v in pairs(elements) do
		local name = v:getName();

		if( string.lower(name) == "hotkeys" ) then
			loadHotkeys(v);
		elseif( string.lower(name) == "options" ) then
			loadOptions(v);
		end
	end


-- TODO: don't work at the moment, becaus MACRO hotkey not available at this time
-- will first be available after reading profile file
	-- read language from client if not set in settings.xml
--	if( not settings.options.LANGUAGE ) then
--		local hf_language = RoMScript("GetLanguage();");	-- read clients language
--		if( hf_language == "DE" ) then
--			settings.options.LANGUAGE = "deutsch";
--		elseif(hf_language == "ENEU" ) then
--			settings.options.LANGUAGE = "english";
--		elseif(hf_language == "FR" ) then
--			settings.options.LANGUAGE = "french";
--		else
--			settings.options.LANGUAGE = "english";
--		end
--	end

	-- Load language files
	-- Load "english" first, to fill in any gaps in the users' set language.
	local function setLanguage(name)
		include("/language/" .. name .. ".lua");
	end

	local lang_base = {};
	setLanguage("english");
	for i,v in pairs(language) do lang_base[i] = v; end;
	setLanguage(settings.options.LANGUAGE);
	for i,v in pairs(lang_base) do
		if( language[i] == nil ) then
			language[i] = v;
		end
	end;
	lang_base = nil; -- Not needed anymore, destroy it.
	logMessage("Language: " .. settings.options.LANGUAGE);


	load_RoM_bindings_txt();	-- read bindings.txt from RoM user folder

	-- Check to make sure everything important is set
	--           bot hotkey name    RoM ingame key name
	checkHotkeys("MOVE_FORWARD",   "MOVEFORWARD");
	checkHotkeys("MOVE_BACKWARD",  "MOVEBACKWARD");
	checkHotkeys("ROTATE_LEFT",    "TURNLEFT");
	checkHotkeys("ROTATE_RIGHT",   "TURNRIGHT");
	checkHotkeys("STRAFF_LEFT",    "STRAFELEFT");
	checkHotkeys("STRAFF_RIGHT",   "STRAFERIGHT");
	checkHotkeys("JUMP",           "JUMP");
	checkHotkeys("TARGET",         "TARGETNEARESTENEMY");
	checkHotkeys("TARGET_FRIEND",  "TARGETNEARESTFRIEND");
	checkHotkeys("ESCAPE",         "TOGGLEGAMEMENU");

end


function settings.loadProfile(_name)
	printf(language[186], _name)

	-- Delete old profile settings (if they even exist), restore defaults
	settings.profile = table.copy(settings_default.profile);

	local filename = getExecutionPath() .. "/profiles/" .. _name .. ".xml";
	local root = xml.open(filename);
	local elements = root:getElements();

	local loadOptions = function(node)
		local elements = node:getElements();

		for i,v in pairs(elements) do
			settings.profile.options[v:getAttribute("name")] = v:getAttribute("value");
		end
	end

	local loadHotkeys = function(node)
		local elements = node:getElements();

		for i,v in pairs(elements) do
			settings.profile.hotkeys[v:getAttribute("name")] = {};
			settings.profile.hotkeys[v:getAttribute("name")].name = v:getAttribute("name");
			settings.profile.hotkeys[v:getAttribute("name")].key = key[v:getAttribute("key")];
			settings.profile.hotkeys[v:getAttribute("name")].modifier = key[v:getAttribute("modifier")];

			if( key[v:getAttribute("key")] == nil ) then
				local err = sprintf(language[127], tostring(v:getAttribute("name")), _name );	-- Please set a valid key
				error(err, 0);
			end

			checkKeySettings(v:getAttribute("name"),
			  v:getAttribute("key"),
			  v:getAttribute("modifier") );

		end
	end

	local loadOnLoadEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onLoad = loadstring(luaCode);
			assert(settings.profile.events.onLoad, sprintf(language[151], "onLoad"));

			if( type(settings.profile.events.onLoad) ~= "function" ) then
				settings.profile.events.onLoad = nil;
			end;
		end
	end

	local loadOnDeathEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onDeath = loadstring(luaCode);

			assert(settings.profile.events.onDeath, sprintf(language[151], "onDeath"));

			if( type(settings.profile.events.onDeath) ~= "function" ) then
				settings.profile.events.onDeath = nil;
			end;
		end
	end

	local loadOnLeaveCombatEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onLeaveCombat = loadstring(luaCode);
			assert(settings.profile.events.onLeaveCombat, sprintf(language[151], "onLeaveCombat"));

			if( type(settings.profile.events.onLeaveCombat) ~= "function" ) then
				settings.profile.events.onLeaveCombat = nil;
			end;
		end
	end

	local loadOnLevelupEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onLevelup = loadstring(luaCode);
			assert(settings.profile.events.onLevelup, sprintf(language[151], "onLevelup"));

			if( type(settings.profile.events.onLevelup) ~= "function" ) then
				settings.profile.events.onLevelup = nil;
			end;
		end
	end

	local loadOnPreSkillCastEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onPreSkillCast = loadstring(luaCode);
			assert(settings.profile.events.onPreSkillCast, sprintf(language[151], "onPreSkillCast"));

			if( type(settings.profile.events.onPreSkillCast) ~= "function" ) then
				settings.profile.events.onPreSkillCast = nil;
			end;
		end
	end

	local loadOnHarvestEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onHarvest = loadstring(luaCode);
			assert(settings.profile.events.onHarvest, sprintf(language[151], "onHarvest"));

			if( type(settings.profile.events.onHarvest) ~= "function" ) then
				settings.profile.events.onHarvest = nil;
			end;
		end
	end

	local loadOnSkillCastEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onSkillCast= loadstring(luaCode);
			assert(settings.profile.events.onSkillCast, sprintf(language[151], "onSkillCast"));

			if( type(settings.profile.events.onSkillCast) ~= "function" ) then
				settings.profile.events.onSkillCast = nil;
			end;
		end
	end

	local loadonUnstickFailureEvent = function(node)
		local luaCode = node:getValue();
		if( luaCode == nil ) then return; end;

		if( string.len(luaCode) > 0 and string.find(luaCode, "%w") ) then
			settings.profile.events.onUnstickFailure = loadstring(luaCode);
			assert(settings.profile.events.onUnstickFailure, sprintf(language[151], "onUnstickFailure"));

			if( type(settings.profile.events.onUnstickFailure) ~= "function" ) then
				settings.profile.events.onUnstickFailure = nil;
			end;
		end
	end

	local skillSort = function(tab1, tab2)
		if( tab2.priority < tab1.priority ) then
			return true;
		end;

		return false;
	end

	local loadSkills = function(node)
		local className = string.upper(node:getName())
		local classNum = 0
		if className ~= "SKILLS" then
			className = string.gsub(className,"SKILLS","CLASS")
			classNum = _G[className]
		end
		settings.profile.skillsData[classNum] = {}

		local elements = node:getElements();

		for i,v in pairs(elements) do
			local name, hotkey, modifier
			name = v:getAttribute("name");
--			hotkey = key[v:getAttribute("hotkey")];
			modifier = key[v:getAttribute("modifier")];

			-- using the MACRO key as hotkey is also a valid key
			if( string.upper( tostring(v:getAttribute("hotkey")) ) == "MACRO" ) then
				hotkey = "MACRO";						-- set MACRO as hotkey
			else
				hotkey = key[v:getAttribute("hotkey")];	-- read the virtual key numer
			end

			-- Over-ride attributes
			local priority, maxhpper, maxmanaper, cooldown, inbattle, pullonly, maxuse, autouse, rebuffcut;
			local reqbuffname, reqbuffcount, reqbufftarget, nobuffname, nobuffcount, nobufftarget
			priority = v:getAttribute("priority");
			maxhpper = tonumber((string.gsub(v:getAttribute("hpper") or "","!","-")));
			targetmaxhpper = tonumber((string.gsub(v:getAttribute("targethpper") or "","!","-")));
			targetmaxhp = tonumber((string.gsub(v:getAttribute("targethp") or "","!","-")));
			maxmanaper = tonumber((string.gsub(v:getAttribute("manaper") or "","!","-")));
			cooldown = tonumber(v:getAttribute("cooldown"));
			inbattle = v:getAttribute("inbattle");
			pullonly = v:getAttribute("pullonly");
			maxuse = tonumber(v:getAttribute("maxuse"));
			rebuffcut = tonumber(v:getAttribute("rebuffcut"));
			reqbuffcount = tonumber(v:getAttribute("reqbuffcount"));
			reqbufftarget = v:getAttribute("reqbufftarget");
			reqbuffname = v:getAttribute("reqbuffname");
			nobuffcount = tonumber(v:getAttribute("nobuffcount"));
			nobufftarget = v:getAttribute("nobufftarget");
			nobuffname = v:getAttribute("nobuffname");
			autouse = v:getAttribute("autouse");
		-- Ensure that autouse is a proper type.
			if( not (autouse == true or autouse == false) ) then
				autouse = true;
			end;

			-- check if 'wrong' options are set
			if( v:getAttribute("mana")      or
			    v:getAttribute("manainc")   or
			    v:getAttribute("rage")      or
			    v:getAttribute("energy")    or
			    v:getAttribute("concentration")      or
			    v:getAttribute("range")     or
			    v:getAttribute("minrange")  or
			    v:getAttribute("type")      or
			    v:getAttribute("target")    or
			    v:getAttribute("casttime") ) then
					local msg = sprintf(language[128], name, _name);	-- are no valid options for your skill
					error(msg, 0);
			end;

			if( name == nil) then
				local msg = sprintf(language[130], _name);	-- empty\' skill name
				error(msg, 0);
			end;

			if( inbattle ~= nil ) then
				if( inbattle == "true" or
					inbattle == true ) then
					inbattle = true;
				elseif( inbattle == "false"  or
					inbattle == false ) then
					inbattle = false;
				else
					local msg = sprintf(language[131], inbattle, name, _name);	-- wrong option inbattle

					error(msg, 0);
				end;
			end

			if( pullonly ~= nil ) then
				if( pullonly == "true" or
					pullonly == true ) then
					pullonly = true;
				else
					local msg = sprintf(language[132], pullonly, name, _name);	-- wrong option pullonly

					error(msg, 0);
				end;
			end

			if( level == nil or level < 1 ) then
				level = 1;
			end

			local baseskill = database.skills[name];
			if( not baseskill ) then
				local err = sprintf("ERROR: \'%s\' is not defined in the database!", name);
				error(err, 0);
			end

			local tmp = CSkill(database.skills[name]);
			tmp.hotkey = hotkey;
			tmp.modifier = modifier;

			if (tmp.hotkey == "MACRO" or tmp.hotkey == "" or tmp.hotkey == nil ) and tmp.Id == 0 then
				local msg = sprintf(language[158],tmp.Name);    -- Can't use "MACRO" without skill id.
				error(msg,0);
			end

			if (reqbuffname and not reqbufftarget) or (not reqbuffname and reqbufftarget) then
				local msg = sprintf(language[154], name, _name);	-- need to define both
				error(msg, 0);
			end

			if (nobuffname and not nobufftarget) or (not nobuffname and nobufftarget) then
				local msg = sprintf(language[155], name, _name);	-- need to define both
				error(msg, 0);
			end

			if reqbufftarget ~= nil and reqbufftarget ~= "target" and reqbufftarget ~="player" then
				local msg = sprintf(language[156], reqbufftarget, name, _name);	-- needs to be 'target' or 'player'
				error(msg, 0);
			end

			if nobufftarget ~= nil and nobufftarget ~= "target" and nobufftarget ~="player" then
				local msg = sprintf(language[157], nobufftarget, name, _name);	-- needs to be 'target' or 'player'
				error(msg, 0);
			end

			if( toggleable ) then tmp.Toggleable = toggleable; end;
			if( priority ) then tmp.priority = priority; end
			if( targetmaxhpper ) then tmp.TargetMaxHpPer = targetmaxhpper; end;
			if( targetmaxhp ) then tmp.TargetMaxHp = targetmaxhp; end;
			if( maxhpper ) then tmp.MaxHpPer = maxhpper; end;
			if( maxmanaper ) then tmp.MaxManaPer = maxmanaper; end;
			if( cooldown ) then tmp.Cooldown = cooldown; end;
			if( inbattle ~= nil ) then tmp.InBattle = inbattle; end;
			if( pullonly == true ) then tmp.pullonly = pullonly; end;
			if( maxuse ) then tmp.maxuse = maxuse; end;
			if( rebuffcut ) then tmp.rebuffcut = rebuffcut; end;
			if( reqbuffcount ) then tmp.ReqBuffCount = reqbuffcount; end;
			if( reqbufftarget ) then tmp.ReqBuffTarget = reqbufftarget; end;
			if( reqbuffname ) then tmp.ReqBuffName = reqbuffname; end;
			if( nobuffcount ) then tmp.NoBuffCount = nobuffcount; end;
			if( nobufftarget ) then tmp.NoBuffTarget = nobufftarget; end;
			if( nobuffname ) then tmp.NoBuffName = nobuffname; end;
			if( autouse == false ) then tmp.AutoUse = false; end;

			table.insert(settings.profile.skillsData[classNum], tmp);

		end

		table.sort(settings.profile.skills, skillSort);
	end

	local loadFriends = function(node)
		local elements = node:getElements();

		for i,v in pairs(elements) do

			local name = v:getAttribute("name");

			if( name ) then name = trim(name); end;

			if( name ) then

				-- fix, because getAttribute seems not to recognize the escape characters
				-- for special ASCII characters
				name = string.gsub (name, "\\132", string.char(132));	-- �
				name = string.gsub (name, "\\142", string.char(142));	-- �
				name = string.gsub (name, "\\148", string.char(148));	-- �
				name = string.gsub (name, "\\153", string.char(153));	-- �
				name = string.gsub (name, "\\129", string.char(129));	-- �
				name = string.gsub (name, "\\154", string.char(154));	-- �
				name = string.gsub (name, "\\225", string.char(225));	-- �

				table.insert(settings.profile.friends, name);
			end
		end
	end

	local loadMobs = function(node)
		local elements = node:getElements();

		for i,v in pairs(elements) do

			local name = v:getAttribute("name");

			if( name ) then name = trim(name); end;

			if( name ) then

				-- fix, because getAttribute seems not to recognize the escape characters
				-- for special ASCII characters
				name = string.gsub (name, "\\132", string.char(132));	-- �
				name = string.gsub (name, "\\142", string.char(142));	-- �
				name = string.gsub (name, "\\148", string.char(148));	-- �
				name = string.gsub (name, "\\153", string.char(153));	-- �
				name = string.gsub (name, "\\129", string.char(129));	-- �
				name = string.gsub (name, "\\154", string.char(154));	-- �
				name = string.gsub (name, "\\225", string.char(225));	-- �

				table.insert(settings.profile.mobs, name);
			end
		end
	end

	local hf_temp = _name;	-- remember profile name shortly

	for i,v in pairs(elements) do
		local name = v:getName();
		if( string.lower(name) == "options" ) then
			loadOptions(v);
		elseif( string.lower(name) == "hotkeys" ) then
			loadHotkeys(v);
		elseif( string.lower(name) == "skills" ) then
			loadSkills(v);
		elseif( string.lower(name) == "friends" ) then
			loadFriends(v);
		elseif( string.lower(name) == "mobs" ) then
			loadMobs(v);
		elseif( string.lower(name) == "onload" ) then
			loadOnLoadEvent(v);
		elseif( string.lower(name) == "ondeath" ) then
			loadOnDeathEvent(v);
		elseif( string.lower(name) == "onleavecombat" ) then
			loadOnLeaveCombatEvent(v);
		elseif( string.lower(name) == "onlevelup" ) then
			loadOnLevelupEvent(v);
		elseif( string.lower(name) == "onskillcast" ) then
			loadOnSkillCastEvent(v);
		elseif( string.lower(name) == "onharvest" ) then
			loadOnHarvestEvent(v);
		elseif( string.lower(name) == "onunstickfailure" ) then
			loadonUnstickFailureEvent(v);
		elseif( string.lower(name) == "onpreskillcast" ) then
			loadOnPreSkillCastEvent(v);
		elseif( string.lower(name) == "skills_warrior"  or
			string.lower(name) == "skills_scout"  or
			string.lower(name) == "skills_rogue"  or
			string.lower(name) == "skills_mage"  or
			string.lower(name) == "skills_priest"  or
			string.lower(name) == "skills_knight"  or
			string.lower(name) == "skills_warden"  or
			string.lower(name) == "skills_druid" ) then
				loadSkills(v);
		else		-- warning for other stuff and misspellings
			if ( string.lower(name) ~= "skills_warrior"     and
			     string.lower(name) ~= "skills_scout"       and
		 	     string.lower(name) ~= "skills_rogue"       and
	 		     string.lower(name) ~= "skills_mage"        and
			     string.lower(name) ~= "skills_priest"      and
			     string.lower(name) ~= "skills_knight"      and
			     string.lower(name) ~= "skills_warden"  and
			     string.lower(name) ~= "skills_druid" )     then
				cprintf(cli.yellow, tostring(language[60]), string.lower(tostring(name)),
					tostring(hf_temp));
			end;
		end
	end

	-- checks for MACRO hotkey
	-- print error if new macro option isn't defined
	if( not settings.profile.hotkeys.MACRO ) then
		cprintf(cli.yellow, language[900]);
		cprintf(cli.yellow, language[901]);
		cprintf(cli.yellow, language[902]);
		cprintf(cli.yellow, language[903]);
		cprintf(cli.yellow, language[904], "VK_0"); -- TODO: Change VK_0 to the actual hotkey we should use
		local msg = sprintf(language[905], _name);
		error(msg, 0);
	end

	-- Setup the macros and action key.
	setupMacros()

	-- check if new macro option is working / ingame macro defined and assigned
	-- check it with a function with defined return values
	settings.options.DEBUGGING_MACRO = true;
	local hf_return = RoMScript("1234;ChatFrame1:AddMessage(\"MACRO test: send value 1234 to macro place 2\");");
	if( hf_return ~= 1234 ) then	-- return values not found
--		RoMScript("ChatFrame1:AddMessage(\"MACRO test: test failed !!! No return values found!\");");	-- overwrite return values
		cprintf(cli.yellow, language[906] );	-- Define ingame an empty macro

		if ( settings.profile.hotkeys.MACRO.key) then
			hf_temp = getKeyName(settings.profile.hotkeys.MACRO.key);
		else
			local hf_temp ="<UNKNOWN>";	-- if ignore, key must not be set, so give value
		end

		local msg = sprintf(language[904], hf_temp );

		error(msg, 0);
	else								-- return values found, clear it and send message
		cprintf(cli.green, "MACRO Test: ok\n" );
		RoMScript("xxxx; ChatFrame1:AddMessage(\"MACRO test: successful\");");	-- overwrite values
	end
	settings.options.DEBUGGING_MACRO = false;


	-- MACRO is working, we can automaticly reset the langugae
	-- remember game client language
	local hf_langu = RoMScript("GetLanguage();");
	if( not hf_langu ) then
		local msg = sprintf(language[62]);	-- Error while reading the language settings
--		error(msg, 0);
		cprintf(cli.yellow, msg);
		hf_langu = "ENEU";
	end
	bot.ClientLanguage = hf_langu;	-- remember clients language

	-- reset bot language to clients language
	if( settings.options.USE_CLIENT_LANGUAGE ) then
		local hf_language;
		if( bot.ClientLanguage == "DE" ) then
			hf_language = "deutsch";
		elseif(bot.ClientLanguage  == "FR" ) then
			hf_language = "french";
		elseif(bot.ClientLanguage  == "RU" ) then
			hf_language = "russian";
		elseif(bot.ClientLanguage == "PL" ) then
			hf_language = "polish";
		elseif(bot.ClientLanguage == "ES" ) then
			hf_language = "spanish";
		else
			hf_language = "english";
		end

		if( settings.options.LANGUAGE ~= hf_language ) then		-- load new language?

			local function setLanguage(_name)
				include("/language/" .. _name .. ".lua");
			end

			local lang_base = {};

			for i,v in pairs(language) do lang_base[i] = v; end;	-- remember current language value to fill gaps with that

			setLanguage(hf_language);
			for i,v in pairs(lang_base) do
				if( language[i] == nil ) then
					language[i] = v;
				end
			end;
			lang_base = nil; -- Not needed anymore, destroy it.
			logMessage("Load Language according to client language: " .. hf_language);

		end

	end


	-- now we can do all other setting checks

	-- warning if not all inventory slots are updated
	if( settings.profile.options.INV_AUTOSELL_TOSLOT > settings.profile.options.INV_MAX_SLOTS ) then
		cprintf(cli.yellow, language[1003], settings.profile.options.INV_MAX_SLOTS, settings.profile.options.INV_AUTOSELL_TOSLOT);
	end


	-- check if igf addon is active
	if ( RoMScript("IGF_INSTALLED") == true ) then
		bot.IgfAddon = true;
	else
		bot.IgfAddon = false;
	end

	-- check if igf event addon is active
	if ( RoMScript("IGFEVENTS_INSTALLED") == true ) then
		bot.IgfEventAddon = true;
	else
		bot.IgfEventAddon = false;
	end

	-- error if igf (ingamefunctions) addon isn't installed and options are set
	if( bot.IgfAddon == false	and
		( settings.profile.options.INV_AUTOSELL_NOSELL_DURA > 0	or
		  settings.profile.options.INV_AUTOSELL_STATS_NOSELL ~= nil ) ) then
		error(language[1004], 0)	-- Ingamefunctions addon (igf) is not installed
	end

	-- check if automatic targeting is active
	if( settings.profile.options.AUTO_TARGET == false ) then
		cprintf(cli.yellow, "Caution: Automatic targeting is deactivated with option AUTO_TARGET=\"false\"\n");
	end


end

function settings.loadSkillSet(class)
	-- return if player not initialized yet.
	if not player then return end

	local skillSort = function(tab1, tab2)
		if( tab2.priority < tab1.priority ) then
			return true;
		end;

		return false;
	end

	settings.profile.skills = {}
	if type(settings.profile.skillsData[0]) == "table" then
		for k,v in pairs(settings.profile.skillsData[0]) do -- general skills
			table.insert(settings.profile.skills, v)
		end
	end
	if type(settings.profile.skillsData[class]) == "table" then
		for k,v in pairs(settings.profile.skillsData[class]) do -- class skills
			table.insert(settings.profile.skills, v)
		end
	end

	table.sort(settings.profile.skills, skillSort);

	-- Setup the macros and action key.
	if settings.profile.hotkeys.MACRO ~= nil then
		setupMacros()
	end

	-- Updates skill availability and some values(Id,Level,aslevel,TPToLevel)
	settings.updateSkillsAvailability()

	-- Check if the player has any ranged damage skills
	local rangedSkills = false;
	for i,v in pairs(settings.profile.skills) do
		if( v.Range > 100  and
			( v.Type == STYPE_DAMAGE or
			  v.Type == STYPE_DOT ) and
			  v.Available) then
			rangedSkills = true;
			printf(language[176], v.Name);		-- Ranged skill found
			break;
		end
	end

	if( rangedSkills == false and settings.profile.options.COMBAT_RANGED_PULL ) then
		cprintf(cli.yellow, language[200]);
		settings.profile.options.COMBAT_RANGED_PULL = false;
	end

	-- default combat type if not in profile defined
	if( settings.profile.options.COMBAT_TYPE ~= "ranged" and
	    settings.profile.options.COMBAT_TYPE ~= "melee" ) then
		if( player.Class1 == CLASS_WARRIOR or
		    player.Class1 == CLASS_ROGUE   or
		    player.Class1 == CLASS_WARDEN  or
		    player.Class1 == CLASS_KNIGHT  ) then
			settings.profile.options.COMBAT_TYPE  = "melee";
		elseif(
		    player.Class1 == CLASS_PRIEST  or
		    player.Class1 == CLASS_SCOUT   or
		    player.Class1 == CLASS_DRUID   or
		    player.Class1 == CLASS_MAGE    ) then
			settings.profile.options.COMBAT_TYPE  = "ranged";
		else
			error("undefined player.Class1 in settings.lua", 0);
		end;
	end


	-- check if range attack range and combat distance fit together
	local best_range = 0;
	for i,v in pairs(settings.profile.skills) do
		if( v.Range > best_range and
			( v.Type == STYPE_DAMAGE or
			  v.Type == STYPE_DOT ) and
			  v.Available) then
			best_range = v.Range;
		end
	end

	-- check is combat distance is greater then maximum ranged attack
	if( best_range < settings.profile.options.COMBAT_DISTANCE  and
		(settings.profile.options.COMBAT_TYPE == "ranged" or
		settings.profile.options.COMBAT_RANGED_PULL == true) ) then
		cprintf(cli.yellow, language[179], settings.profile.options.COMBAT_DISTANCE, best_range);	-- Maximum range of range attack skills is lesser
		settings.profile.options.COMBAT_DISTANCE = best_range
	end
end

function settings.updateSkillsAvailability()
	-- Adds or updates skills values;
	--   Id
	--   TPToLevel
	--   Level
	--   aslevel
	--   Available

	local proc = getProc()
	local skillsTableTabSize = 0x10
	local skillSize = 0x4c

	local function GetSkillInfo (address)
		local tmp = {}
		tmp.Id = tonumber(memoryReadRepeat("int", proc, address))
		tmp.Name = GetIdName(tmp.Id)
		tmp.TPToLevel = memoryReadRepeat("int", proc, address + addresses.skillTPToLevel_offset)
		tmp.Level = memoryReadRepeat("int", proc, address + addresses.skillLevel_offset)
		tmp.AsLevel = memoryReadRepeat("int", proc, address + addresses.skillAsLevel_offset)

		return tmp
	end

	-- First collect tab skill info
	local tabData = {}
	for tab = 2,4 do -- tabs of interest 2,3 and 4
		local tabBaseAddress = memoryReadRepeat("int", proc, addresses.skillsTableBase + skillsTableTabSize*(tab-1) + addresses.skillsTableTabStartAddress_offset)
		local tabEndAddress = memoryReadRepeat("int", proc, addresses.skillsTableBase + skillsTableTabSize*(tab-1) + addresses.skillsTableTabEndAddress_offset)

		if tabBaseAddress ~= 0 and tabEndAddress ~= 0 then
			for skilladdress = tabBaseAddress, tabEndAddress-1, skillSize do
				tmpData = GetSkillInfo(skilladdress)
				if tmpData.Name ~= nil and tmpData.Name ~= "" then
					tabData[tmpData.Name] = {
						Id = tmpData.Id,
					    TPToLevel = tmpData.TPToLevel,
						Level = tmpData.Level,
						AsLevel = tmpData.AsLevel,
					}
				end
			end
		end
	end

	-- Next go through the profile skills and see which are available
	for _, skill in pairs(settings.profile.skills) do
		-- Check Id
		if skill.Id == 0 or skill.Id == nil then
			if skill.hotkey == "MACRO" or skill.hotkey == "" or skill.hotkey == nil then
				-- Skill unusable without id or hotkey
				skill.Available = false
			else
				-- Might be user custom macro. Alow it.
				skill.Available = true
				-- No other values to set
			end
		else
			local realName = GetIdName(skill.Id)
			-- Do we currently have this skill?
			if tabData[realName] ~= nil then
				-- update profile values
				skill.Id = tabData[realName].Id
				skill.TPToLevel = tabData[realName].TPToLevel
				skill.Level = tabData[realName].Level
				skill.aslevel = tabData[realName].AsLevel
				-- update database values(some functions access the database values)
				database.skills[skill.Name].Id = tabData[realName].Id
				database.skills[skill.Name].Level = tabData[realName].Level
				database.skills[skill.Name].aslevel = tabData[realName].AsLevel

				-- Check if available
				if skill.aslevel > player.Level then
					skill.Available = false
				else
					skill.Available = true
				end
			else
				skill.Available = false
			end
		end
	end
end
