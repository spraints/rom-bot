include("addresses.lua");
include("functions.lua");


-- This function will attempt to automatically find the true addresses
-- from RoM, even if they have moved.
-- Only works on MicroMacro v1.0 or newer.
function findOffsets()
	local staticbase, staticcastbar;

	local found = findPatternInProcess(getProc(), getUpdatePattern(), getUpdatePatternMask(), 0x550000, 0x000A0000);

	if( found == 0 ) then
		error("Unable to find static base pointer in module.", 0);
	end

	patternstart_address = found;
	staticbase = memoryReadInt(getProc(), found + 8);

	if( staticbase == nil ) then
		error("Found pattern, but unable to read memory.\n");
	end

	printf("staticbase: 0x%X\n", staticbase);

	staticcharbase_address = staticbase;
end

function rewriteAddresses()
	local filename = getExecutionPath() .. "/addresses.lua";
	getProc(); -- Just to make sure we open the process first

	printf("Scanning for updated addresses...\n");
	findOffsets();
	printf("Finished.\n");

	local file = io.open(filename, "w");

	file:write(
		sprintf("-- Auto-generated by update.lua\n") ..
		sprintf("patternstart_address = 0x%X;\n\n", patternstart_address) ..

		sprintf("staticcharbase_address = 0x%X;\n", staticcharbase_address) ..
		sprintf("charPtr_offset = 0x%X;\n", charPtr_offset) ..
		sprintf("mousePtr_offset = 0x%X;\n", mousePtr_offset) ..
		sprintf("pawnId_offset = 0x%X;\n", pawnId_offset) ..
		sprintf("pawnType_offset = 0x%X;\n", pawnType_offset) ..
		sprintf("charX_offset = 0x%X;\n", charX_offset) ..
		sprintf("charY_offset = 0x%X;\n", charY_offset) ..
		sprintf("charZ_offset = 0x%X;\n", charZ_offset) ..
		sprintf("camUVec1_offset = 0x%X;\n", camUVec1_offset) ..
		sprintf("camUVec2_offset = 0x%X;\n", camUVec2_offset) ..
		sprintf("charAlive_offset = 0x%X;\n", charAlive_offset) ..
		sprintf("castbar_offset = 0x%X;\n", castbar_offset) ..
		sprintf("charTargetPtr_offset = 0x%X;\n", charTargetPtr_offset) ..
		sprintf("charName_offset = 0x%X;\n", charName_offset) ..
		sprintf("charHP_offset = 0x%X;\n", charHP_offset) ..
		sprintf("charMaxHP_offset = 0x%X;\n", charMaxHP_offset) ..
		sprintf("charMP_offset = 0x%X;\n", charMP_offset) ..
		sprintf("charMaxMP_offset = 0x%X;\n", charMaxMP_offset) ..
		sprintf("charMP2_offset = 0x%X;\n", charMP2_offset) ..
		sprintf("charMaxMP2_offset = 0x%X;\n", charMaxMP2_offset) ..
		sprintf("charClass1_offset = 0x%X;\n", charClass1_offset) ..
		sprintf("charLevel_offset = 0x%X;\n", charLevel_offset) ..
		sprintf("charClass2_offset = 0x%X;\n", charClass2_offset) ..
		sprintf("charLevel2_offset = 0x%X;\n", charLevel2_offset) ..
		sprintf("pawnAttackable_offset = 0x%X;\n", pawnAttackable_offset) ..
		sprintf("inBattle_offset = 0x%X;\n", inBattle_offset)
	);

	file:close();

end
rewriteAddresses();