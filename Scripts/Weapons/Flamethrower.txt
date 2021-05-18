Class DKFlamethrower:DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 7;
		Weapon.AmmoType "FlamerFuel";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 20;
		Inventory.PickupMessage "A flamethrower. (Slot 7)";
		Obituary "little %o fucking dies to %k's flamethrower";
		DWeapon.MinSpreadX 2.5;
		DWeapon.MinSpreadY 2.5;
		DWeapon.MaxSpreadX 2.5;
		DWeapon.MaxSpreadY 2.5;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "FlameProj";
		DWeapon.RecoilMultY 1;
		DWeapon.RecoilMultX .4;
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		FLMG A 0 A_PlaySound("FlamerIdle", 1, 0.7, true);
	Ready2:
		FLMG BBBCCCDDD 1
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 1
		{
		A_WeaponOffset(-4,8,WOF_ADD);
		A_StopSound(1);
		}
		"####" A 1 A_WeaponOffset(-6,12,WOF_ADD);
		"####" A 1 A_WeaponOffset(-8,16,WOF_ADD);
		"####" A 1 A_WeaponOffset(-10,20,WOF_ADD);
		"####" A 1 A_WeaponOffset(-8,16,WOF_ADD);
		"####" A 1 A_WeaponOffset(-6,12,WOF_ADD);
		"####" A 1 A_WeaponOffset(-4,8,WOF_ADD);
		TNT1 A 5;
		"####" A 0 A_Lower();
		Wait;
	Select:
		TNT1 A 0 A_ResetSway();
		FLMG A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		FLMG A 0 A_JumpIf(CountInv("FlamerFuel") < 1, "DryFire");
		FLMG E 1
		{		
		A_ResetSway();
		A_PlaySound("FlamerLoop", 1, 0.5, true);
		A_OverlayOffset(1,0,33,WOF_INTERPOLATE);
		A_FireBoolts(1, 0, 0, 1);
		A_Overlay(2,"RecoilY");
		A_Overlay(3,"RecoilX");
		}
		FLMG F 1 A_OverlayOffset(1,0,35,WOF_INTERPOLATE);
		FLMG G 1 
		{
		A_OverlayOffset(1,0,34,WOF_INTERPOLATE);
		A_Refire();
		}
		FLMG G 0 A_StopSound(1);
		Goto Ready;
	Spawn:
		WFLM A -1;
		Stop;
	RecoilAnim:
		TNT1 B 0 A_OverlayFlags(2,PSPF_ADDWEAPON,true);
		FLMG B 1 A_OverlayOffset(1,0,32,WOF_INTERPOLATE);
		Stop;
	DryFire:
		"####" # 1
		{
		A_PlaySound("WeaponClick", 2);
		A_WeaponOffset(0,1,WOF_ADD);
		A_WeaponSway();
		}
		"####" # 1 A_WeaponOffset(0,2,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,3,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,2,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,1,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,0.5,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" ######### 1 
		{
		A_WeaponReady(WRF_NOFIRE|WRF_ALLOWRELOAD|WRF_NOBOB);
		A_WeaponSway();
		}
		Goto Ready;
	RecoilY:
		TNT1 A 1 A_SetPitch(pitch - 1 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - .75 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.50 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.125 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.50 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.75 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.75 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.50 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.03125 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		Stop;
	RecoilX:
		TNT1 A 1 A_SetAngle(Angle - 1 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 1 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.9 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.8 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.7 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.6 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.5 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.4 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.3 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.2 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.1 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.05 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.025 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.0125 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.00625 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(Angle - 0.003125 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		Stop;
	}
}

Class FlameProj:Actor
{
	Default{
		Radius 7;
		Height 5;
		DamageFunction (10);
		DamageType "Ignite";
		Projectile;
		Speed 45;
		RenderStyle "Add";
		Gravity 0.9;
		Alpha 0.6;
		-NOGRAVITY;
		+SPAWNSOUNDSOURCE;
		Obituary "%o was shot with %k's gun.";
	}
	States
	{
	Spawn:
		FRFX A 1 Bright Light("flameprojlight") A_SpawnItemEx("FlameProjTrail");
		Loop;
	Death:
		FRFX B 1 bright A_NoGravity();
		FRFX C 1 bright;
		TNT1 A 0 A_SpawnProjectile("Flame",0,0,0,CMF_TRACKOWNER);
		FRFX D 1 bright;
		FRFX E 1 bright;
		FRFX F 1 bright;
		FRFX G 1 bright;
		FRFX H 1 bright;
		FRFX I 1 bright;
		FRFX J 1 bright;
		FRFX K 1 bright;
		FRFX L 1 bright;
		FRFX M 1 bright;
		FRFX N 1 bright;
		FRFX O 1 bright;
		FRFX P 1 bright;
		Stop;
		}
	}

Class FlameProjTrail:DBShotTrail
{
	Default{
		Scale 1.5;
	}
}
	
Class Flame : Actor
{
	Default{
		Radius 7;
		Height 5;
		Damage (0);
		Projectile;
		Speed 0;
		RenderStyle "Add";
		Alpha 0.6;
		DamageType "Fire";
		-NOGRAVITY;
		+LowGravity;
		+NoExplodeFloor;
		+NoDamageThrust;
		Obituary "%o fucking dies";
	}
	States
	{
	Spawn:
		FLME A 0 NoDelay A_PlaySound("FlameSound", 7, 0.5, TRUE);
		FLME A 1 Bright Light("flamelight")
		{
		A_SetScale(0.2);
		A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		}
		FLME A 1 Bright Light("flamelight")
		{
		A_SetScale(0.4);
		A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		}
		FLME B 1 Bright Light("flamelight")
		{
		A_SetScale(0.6);
		A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		}
		FLME B 1 Bright Light("flamelight")
		{
		A_SetScale(0.8);
		A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		}
		FLME C 1 Bright Light("flamelight")
		{
		A_SetScale(1);
		A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		}
		FLME C 1 Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME DEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),64,1,false,0,0,0,"BulletPuff",'Ignite');
		Goto Death;
	Death:
		FLME A 1 A_StopSound(7);
		FLME A 1 A_SetScale(0.8);
		FLME A 1 A_SetScale(0.6);
		FLME B 1 A_SetScale(0.4);
		FLME B 1 A_SetScale(0.2);
		Stop;
		}
	}

Class FlamerFuel:Ammo
{
	Default{
		Inventory.Amount 20;
		Inventory.MaxAmount 200;
		Ammo.Backpackamount 20;
		Ammo.BackpackMaxAmount 400;
		Inventory.Icon "AGASA0";
		Inventory.PickupMessage "A Canister of Flamer Fuel";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		AGAS A -1;
		Stop;
	}
}

Class FlamerFuelLarge:FlamerFuel
{
	Default{
		Inventory.Amount 60;
		Inventory.PickupMessage "A Large Canister of Flamer Fuel";
	}
	States
	{
	Spawn:
		AGAS B -1;
		Stop;
	}
}