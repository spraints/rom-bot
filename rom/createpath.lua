include("database.lua");
include("addresses.lua");
include("classes/player.lua");
include("classes/camera.lua");
include("classes/waypoint.lua");
include("classes/waypointlist.lua");
include("classes/waypointlist_wander.lua");
include("classes/node.lua");
include("settings.lua");
include("functions.lua");
include("macros.lua");
include("classes/object.lua");
include("classes/memorytable.lua");

settings.load();
database.load();

-- ********************************************************************
-- Change the parameters below to your need                           *
-- ********************************************************************
-- if you want to create waypoint files with special waypoint types
-- like type=TRAVEL, than you can change the global variables
-- below to your need, see the following example
-- p_wp_gtype = " type=\"TRAVEL\"";	-- global type for whole file
-- p_wp_type = " type=\"TRAVEL\"";	-- type for normal waypoints
-- p_hp_type = " type=\"TRAVEL\"";	-- type for harvest waypoints
p_wp_gtype = "";	-- global type for whole file: e.g. TRAVEL
p_wp_type = "";		-- type for normal waypoints
p_hp_type = "";		-- type for harvest waypoints
p_harvest_command = "player:harvest();";
p_merchant_command = "player:merchant%s";
p_targetNPC_command = "player:target_NPC%s";
p_targetObj_command = "player:target_Object%s";
p_choiceOption_command = "sendMacro(\"ChoiceOption(%d);\");";
p_mouseClickL_command = "player:mouseclickL(%d, %d, %d, %d);";
-- ********************************************************************
-- End of Change parameter changes                                    *
-- ********************************************************************


setStartKey(settings.hotkeys.START_BOT.key);
setStopKey(settings.hotkeys.STOP_BOT.key);

wpKey = key.VK_NUMPAD1;			-- insert a movement point
harvKey = key.VK_NUMPAD2;		-- insert a harvest point
saveKey = key.VK_NUMPAD3;		-- save the waypoints
merchantKey = key.VK_NUMPAD4;	-- target merchant, repair and buy stuff
targetNPCKey = key.VK_NUMPAD5;	-- target NPC and open dialog waypoint
choiceOptionKey = key.VK_NUMPAD6; 	-- insert choiceOption
mouseClickKey = key.VK_NUMPAD7; -- Save MouseClick
restartKey = key.VK_NUMPAD9;	-- restart waypoints script
resetKey = key.VK_NUMPAD8;	-- restart waypoints script and discard changes
codeKey = key.VK_NUMPAD0;		-- add comment to last WP.
targetObjKey = key.VK_DECIMAL;	-- target an object and action it.


-- read arguments / forced profile perhaps
local forcedProfile = nil;
for i = 2,#args do

	local foundpos = string.find(args[i], ":", 1, true);
	if( foundpos ) then
		local var = string.sub(args[i], 1, foundpos-1);
		local val = string.sub(args[i], foundpos+1);

		if( var == "profile" ) then
			forcedProfile = val;
		else
			-- invalid option
			local msg = sprintf(language[61], args[i]);
			error(msg, 0 );
		end
	end

	-- check the options
	if(not foundpos  and  args[i] ~= "update" ) then
		local msg = sprintf(language[61], args[i]);
		error(msg, 0 );
	end;

end

local wpList = {};

local playerPtr = memoryReadUIntPtr(getProc(), addresses.staticbase_char, addresses.charPtr_offset);
player = CPlayer(playerPtr);
player:update();

-- convert player name to profile name and check if profile exist
local load_profile_name;	-- name of profile to load
if( forcedProfile ) then
	load_profile_name = convertProfileName(forcedProfile);
else
	load_profile_name = convertProfileName(player.Name);
end

attach(getWin());
settings.loadProfile(load_profile_name);


function saveWaypoints(list)
    while (not file) do
		keyboardBufferClear();
		io.stdin:flush();
		cprintf(cli.green, language[500]);	-- What do you want to name your path
		tempname = io.stdin:read()
		if tempname ~= "" and tempname ~= nil then
			filename = getExecutionPath() .. "/waypoints/" .. tempname  .. ".xml";
		else
			filename = getExecutionPath() .. "/waypoints/__unnamed.xml";
		end
		filechk, err = io.open(filename, "r");
		if (filechk) then
			cprintf(cli.yellow, language[525]); -- Filename already exists! Overwrite? [Y/N]
			overwrite = io.stdin:read()
			filechk:close();
		end
		if (not filechk) or string.lower(overwrite) == "y" then
			file, err = io.open(filename, "w");
			if( not file ) then
				cprintf(cli.green, language[524]); -- File save failed. Please verify the name and try again.
			end
		end
	end

	local openformat = "\t<!-- #%3d --><waypoint x=\"%d\" z=\"%d\" y=\"%d\"%s>%s";
	local closeformat = "</waypoint>\n";

	file:write("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
	local str = sprintf("<waypoints%s>\n", p_wp_gtype);	-- create first tag
	file:write(str);					-- write first tag

	local hf_line, tag_open, line_num = "", false, 1;
	for i,v in pairs(list) do
		if( v.wp_type == "HP" ) then -- Harvest point
			if( tag_open ) then hf_line = hf_line .. "\t" .. closeformat; end;
			hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_hp_type, p_harvest_command) .. closeformat;
			line_num = line_num + 1
			tag_open = false;
		elseif( v.wp_type == "WP" ) then -- Waypoint
			if( tag_open ) then hf_line = hf_line .. "\t" .. closeformat; end;
			hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type, "");
			line_num = line_num + 1
			tag_open = true;
		elseif( v.wp_type == "MER" ) then -- Merchant
			if( tag_open ) then
				hf_line = hf_line .. "\t\t" .. sprintf(p_merchant_command, string.gsub(v.npc_name, "\"", "\\\"")) .. "\n";
			else
				hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type,
				"\n\t\t" .. sprintf(p_merchant_command, v.npc_name) ) .. "\n";
				line_num = line_num + 1
				tag_open = true;
			end
		elseif( v.wp_type == "NPC" ) then -- Open NPC Dialog
			if( tag_open ) then
				hf_line = hf_line .. "\t\t" .. sprintf(p_targetNPC_command, string.gsub(v.npc_name, "\"", "\\\"")) .. "\n";
			else
				hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type,
				"\n\t\t" .. sprintf(p_targetNPC_command, v.npc_name) ) .. "\n";
				line_num = line_num + 1
				tag_open = true;
			end
		elseif( v.wp_type == "CO" ) then -- Choice Option
			if( tag_open ) then
				hf_line = hf_line .. "\t\t" .. sprintf(p_choiceOption_command, v.co_num) .. "\n";
			else
				hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type,
				"\n\t\t" .. sprintf(p_choiceOption_command, v.co_num) ) .. "\n";
				line_num = line_num + 1
				tag_open = true;
			end
		elseif( v.wp_type == "MC" ) then -- Mouse click (left)
			if( tag_open ) then
				hf_line = hf_line .. "\t\t" .. sprintf(p_mouseClickL_command, v.mx, v.my, v.wide, v.high) .. "\n";
			else
				hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type,
				"\n\t\t" .. sprintf(p_mouseClickL_command, v.mx, v.my, v.wide, v.high) ) .. "\n";
				line_num = line_num + 1
				tag_open = true;
			end
		elseif( v.wp_type == "COD" ) then -- Code
			if( tag_open ) then
				hf_line = hf_line .. "\t\t" .. v.com .. "\n";
			else
				hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type,
				"\n\t\t" .. v.com ) .. "\n";
				line_num = line_num + 1
				tag_open = true;
			end
		elseif( v.wp_type == "OBJ" ) then -- Target Object
			if( tag_open ) then
				hf_line = hf_line .. "\t\t" .. sprintf(p_targetObj_command, v.obj_name) .. "\n";
			else
				hf_line = hf_line .. sprintf(openformat, line_num, v.X, v.Z, v.Y, p_wp_type,
				"\n\t\t" .. sprintf(p_targetObj_command, v.obj_name) ) .. "\n";
				line_num = line_num + 1
				tag_open = true;
			end
		end
	end

	-- If we left a tag open, close it.
	if( tag_open ) then
		hf_line = hf_line .. "\t" .. closeformat;
	end

	if( bot.ClientLanguage == "RU" ) then
		hf_line = oem2utf8_russian(hf_line);		-- language conversations for Russian Client
	end

	file:write(hf_line);
	file:write("</waypoints>");

--[[
	if( tag_open ) then
		file:write("\n\t</waypoint>\n</waypoints>\n");
	else
		file:write("</waypoints>\n");
	end
]]

	file:close();

	wpList = {};	-- clear intenal table

end

function main()

	local playerAddress
	local playerId
	local playerHP
	local playerX = 0
	local playerZ = 0
	local playerY = 0
	local running = true;
	while(running) do

		local hf_x, hf_y, hf_wide, hf_high = windowRect( getWin());
		cprintf(cli.turquoise, language[42], hf_wide, hf_high, hf_x, hf_y );	-- RoM windows size
		cprintf(cli.green, language[501]);	-- RoM waypoint creator\n
		printf(language[502]			-- Insert new waypoint
			.. language[503]		-- Insert new harvest waypoint
			.. language[505]		-- Save waypoints and quit
			.. language[509]		-- Insert merchant command
			.. language[504]		-- Insert target/dialog NPC command
			.. language[517]		-- Insert choiceOption command
			.. language[510]		-- Insert Mouseclick Left command
			.. language[518]		-- Reset script
			.. language[506]		-- Save waypoints and restart
			.. language[519]		-- Insert comment command
			.. language[522],		-- Insert comment command
			getKeyName(wpKey), getKeyName(harvKey), getKeyName(saveKey),
			getKeyName(merchantKey), getKeyName(targetNPCKey),
			getKeyName(choiceOptionKey), getKeyName(mouseClickKey),
			getKeyName(resetKey), getKeyName(restartKey),
			getKeyName(codeKey), getKeyName(targetObjKey));

		attach(getWin())
		addMessage(language[501]);	-- -- RoM waypoint creator\n

		local hf_key_pressed, hf_key;
		while(true) do

			hf_key_pressed = false;

			if( keyPressedLocal(wpKey) ) then	-- normal waypoint key pressed
				hf_key_pressed = true;
				hf_key = "WP";
			end;
			if( keyPressedLocal(harvKey) ) then	-- harvest waypoint key pressed
				hf_key_pressed = true;
				hf_key = "HP";
			end;
			if( keyPressedLocal(saveKey) ) then	-- save key pressed
				hf_key_pressed = true;
				hf_key = "SAVE";
			end;
			if( keyPressedLocal(merchantKey ) ) then	-- merchant NPC key pressed
				hf_key_pressed = true;
				hf_key = "MER";
			end;
			if( keyPressedLocal(targetNPCKey) ) then	-- target NPC key pressed
				hf_key_pressed = true;
				hf_key = "NPC";
			end;
			if( keyPressedLocal(choiceOptionKey) ) then	-- choice option key pressed
				hf_key_pressed = true;
				hf_key = "CO";
			end;
			if( keyPressedLocal(codeKey) ) then	-- choice option key pressed
				hf_key_pressed = true;
				hf_key = "COD";
			end;
			if( keyPressedLocal(mouseClickKey) ) then	-- target MouseClick key pressed
				hf_key_pressed = true;
				hf_key = "MC";
			end;
			if( keyPressedLocal(restartKey) ) then	-- restart key pressed
				hf_key_pressed = true;
				hf_key = "RESTART";
			end;
			if( keyPressedLocal(resetKey) ) then	-- reset key pressed
				hf_key_pressed = true;
				hf_key = "RESET";
			end;
			if( keyPressedLocal(targetObjKey) ) then	-- reset key pressed
				hf_key_pressed = true;
				hf_key = "OBJ";
			end;

			if( hf_key_pressed == false and 	-- key released, do the work
				hf_key ) then					-- and key not empty

				-- SAVE Key: save waypoint file and exit
				if( hf_key == "SAVE" ) then
					saveWaypoints(wpList);
					hf_key = " ";	-- clear last pressed key
					running = false;
					break;
				end;

				if( hf_key == "RESET" ) then
					clearScreen();
					wpList = {}; -- DON'T save clear table
					hf_key = " ";	-- clear last pressed key
					running = true; -- restart
					break;
				end;

				player.Address = memoryReadRepeat("uintptr", getProc(), addresses.staticbase_char, addresses.charPtr_offset) or 0;
				player:updateXYZ();

				local tmp = {}, hf_type;
				tmp.X = player.X;
				tmp.Z = player.Z;
				tmp.Y = player.Y;
				hf_type = "";


				-- waypoint or harvest point key: create a waypoint/harvest waypoint
				if( hf_key == "HP" ) then			-- harvest waypoint
					tmp.wp_type = "HP";
					hf_type = "HP";
					addMessage(sprintf(language[512], #wpList+1) ); -- harvestpoint added
				elseif(	hf_key == "WP") then			-- normal waypoint
					tmp.wp_type = "WP";
					hf_type = "WP";
					addMessage(sprintf(language[511], #wpList+1) ); -- waypoint added
				elseif( hf_key == "MER" ) then -- merchant command
					tmp.wp_type = "MER";
					local target = player:getTarget();	-- get target name
					tmp.npc_name = "("..target.Id.."); -- "..target.Name;
					hf_type = "target/merchant NPC "..tmp.npc_name;
					addMessage(sprintf(language[513], #wpList+1, tmp.npc_name));
				elseif( hf_key == "NPC" ) then -- target npc
					tmp.wp_type = "NPC";
					local target = player:getTarget();	-- get target name
					tmp.npc_name = "("..target.Id.."); -- "..target.Name;
					hf_type = "target/dialog NPC "..tmp.npc_name;
					addMessage(sprintf(language[514], #wpList+1, tmp.npc_name));
				elseif(	hf_key == "CO") then			-- choose npc option
					tmp.wp_type = "CO";

					-- ask for option number
					keyboardBufferClear();
					io.stdin:flush();
					cprintf(cli.green, language[507]);	-- enter number of option
					tmp.co_num = io.stdin:read();
					hf_type = "choiceOpion "..tmp.co_num;
					addMessage(sprintf(language[516], tmp.co_num ) ); -- choice option
				elseif(	hf_key == "COD") then			-- enter code
					tmp.wp_type = "COD";

					-- ask for option number
					keyboardBufferClear();
					io.stdin:flush();
					cprintf(cli.green, language[520]);	-- add code
					tmp.com = io.stdin:read();
					hf_type = tmp.com;
					addMessage(sprintf(language[521], tmp.com ) ); -- code
				elseif( hf_key == "MC" ) then 	-- is's a mouseclick?
					tmp.wp_type = "MC";			-- it is a mouseclick
					local x, y = mouseGetPos();
					local wx, wy, hf_wide, hf_high = windowRect(getWin());
					tmp.wide = hf_wide;
					tmp.high = hf_high;
			        tmp.mx = x - wx;
					tmp.my = y - wy;
					hf_type = sprintf("mouseclick %d,%d (%dx%d)", tmp.mx, tmp.my, tmp.wide, tmp.high );
					addMessage(sprintf(language[515],
					tmp.mx, tmp.my, tmp.wide, tmp.high )); -- Mouseclick
				elseif( hf_key == "OBJ" ) then 	-- target object
					tmp.wp_type = "OBJ";
					local mouseObj = CObject(memoryReadUIntPtr(getProc(), addresses.staticbase_char, addresses.mousePtr_offset));
					tmp.obj_name = "("..mouseObj.Id.."); -- "..mouseObj.Name
					hf_type = sprintf("target object %s", tmp.obj_name );
					addMessage(sprintf(language[523],tmp.obj_name)); -- target object
				end


				if hf_type == "WP" or hf_type == "HP" then
					local coords = sprintf(", (%d, %d, %d)", tmp.X, tmp.Z, tmp.Y)
					printf(language[508],	-- (X, Z, Y), Press %s to save and quit
						#wpList+1, (hf_type..coords), getKeyName(saveKey));
				else
					printf(language[508],	-- Press %s to save and quit
						#wpList+1, hf_type, getKeyName(saveKey));
				end

				table.insert(wpList, tmp);

				if( hf_key == "RESTART" ) then
					saveWaypoints(wpList);
					hf_key = " ";	-- clear last pressed key
					running = true; -- restart
					break;
				end;


				hf_key = nil;	-- clear last pressed key
			end;

			playerAddress = memoryReadUIntPtr(getProc(), addresses.staticbase_char, addresses.charPtr_offset);
			playerId = memoryReadInt(getProc(), playerAddress + addresses.pawnId_offset) or 0
			playerHP = memoryReadInt(getProc(), playerAddress + addresses.pawnHP_offset) or 0
			if not isInGame() or playerId < PLAYERID_MIN or playerId > PLAYERID_MAX or playerHP < 1 then
				repeat
					yrest(1000)
					playerAddress = memoryReadUIntPtr(getProc(), addresses.staticbase_char, addresses.charPtr_offset);
					playerId = memoryReadInt(getProc(), playerAddress + addresses.pawnId_offset) or 0
					playerHP = memoryReadInt(getProc(), playerAddress + addresses.pawnHP_offset) or 0
				until isInGame() and playerId >= PLAYERID_MIN and playerId <= PLAYERID_MAX and playerHP > 1
			end
			playerX = memoryReadFloat(getProc(), playerAddress + addresses.pawnX_offset) or playerX
			playerY = memoryReadFloat(getProc(), playerAddress + addresses.pawnY_offset) or playerY
			playerZ = memoryReadFloat(getProc(), playerAddress + addresses.pawnZ_offset) or playerZ
			mousePawnAddress = memoryReadUIntPtr(getProc(), addresses.staticbase_char, addresses.mousePtr_offset) or 0
			if( mousePawnAddress ~= 0) then
				mousePawnId = memoryReadUInt(getProc(), mousePawnAddress + addresses.pawnId_offset) or 0
				mousePawnName = GetIdName(mousePawnId) or "<UNKNOWN>"
				mousePawnX = memoryReadFloat(getProc(), mousePawnAddress + addresses.pawnX_offset) or mousePawnX
				mousePawnY = memoryReadFloat(getProc(), mousePawnAddress + addresses.pawnY_offset) or mousePawnY
				mousePawnZ = memoryReadFloat(getProc(), mousePawnAddress + addresses.pawnZ_offset) or mousePawnZ
				setWindowName(getHwnd(), sprintf("\rObject found id %d %s distance %d\t\t\t", mousePawnId, mousePawnName, distance(playerX, playerZ, playerY, mousePawnX, mousePawnZ, mousePawnY)));
			else
				setWindowName(getHwnd(), sprintf("\rPlayer Position X:%d Z:%d Y:%d\t\t\t",playerX, playerZ, playerY));
			end

			yrest(10);
		end -- End of: while(true)
	end -- End of: while(running)
end

startMacro(main, true);
