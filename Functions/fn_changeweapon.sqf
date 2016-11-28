    // This file is part of FlyMaker Scripts Library
    // This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
    // See Legal.txt

    /*
    File: fn_changeweapon.sqf

    Change the weapon of the unit in (1) that use weapon in (2) with the new weapon in (3). Mantain compatible attachments!
	
    Usage : Call
    Params: 1: <object> unit that have is equipment changed
            2: <string> unit current weapon classname
            3: <string> unit new weapon classname
			
    Return: True
    */

    private ["_unit", "_currentWeapon", "_newWeapon", "_getItems", "_magazinesArray"];

    _unit = _this param [0, objNull, [objNull]];
    _currentWeapon = _this param [1, "", [""]];
    _newWeapon = _this param [2, "", [""]];

    // Get Unit Current Weapon and remove
    _getItems = primaryWeaponItems _unit;
    _unit removeWeapon _currentWeapon;
	
	_currentWeapon = [_currentWeapon] call BIS_fnc_baseWeapon;	
	_newWeapon = [_newWeapon] call BIS_fnc_baseWeapon;

	// Add new weapon and compatible attachments back.
    _unit addweapon _newWeapon;
    {_unit addPrimaryWeaponItem _x} forEach _getItems;
    _unit selectWeapon ( primaryWeapon _unit );
	
	true;