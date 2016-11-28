    // This file is part of FlyMaker Scripts Library
    // This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
    // See Legal.txt

    /*
    File: fn_removeFirstWeaponMagazines.sqf

    Remove all first weapon magazines from unit in (1).
	
    Usage : Call
    Params: 1: <object> unit that have first weapon magazines removed
            
    Return: True
    */

    private ["_unit", "_currentWeapon", "_compatibleMags", "_mags"];

    _unit = _this param [0, objNull, [objNull]];

    _currentWeapon = primaryWeapon _unit;
	
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
    {
    if ( _x in _compatibleMags ) then {
        _unit removeMagazine _x;
    }
    } forEach magazines _unit;
	
	true;