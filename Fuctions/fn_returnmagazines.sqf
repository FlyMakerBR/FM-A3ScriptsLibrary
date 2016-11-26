fm_FirstWeaponMagazines = {
 // This file is part of FlyMaker Scripts Library
    // This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
    // See Legal.txt

    /*
    File: fm_fn_FirstWeaponMagazines.sqf

    Return the curent magazines from unit first weapon.
	
    Usage : Call
    Params: 1: <object> Target unit

    Return: Array with Magazines
    */

    private ["_unit", "_currentWeapon", "_magazinesReturn", "_magazinesArray", "_compatibleMags", "_mags"];

    _unit = _this param [0, objNull, [objNull]];
	_currentWeapon = primaryWeapon _unit;
    _magazinesArray = magazines _unit;	

	_compatibleMags = [];
    {
    _mags = [];
    if ( _x != "this" ) then {
        _mags = getArray( configFile >> "CfgWeapons" >> _currentWeapon >> _x >> "magazines" );
    }else{
        _mags = getArray( configFile >> "CfgWeapons" >> _currentWeapon >> "magazines" );
    };	
	_compatibleMags = _compatibleMags + _mags;
    }forEach getArray( configFile >> "CfgWeapons" >> _currentWeapon >> "muzzles" );
	
	_magazinesReturn = _magazinesArray - _compatibleMags;
	_magazinesArray = _magazinesArray - _magazinesReturn;

    _magazinesArray = _magazinesArray call BIS_fnc_consolidateArray;
	
	_magazinesArray;
};