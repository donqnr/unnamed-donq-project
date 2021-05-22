Class DKMiniGun:DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 4;
		Weapon.AmmoType1 "FiveFiveSix";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 100;
		Inventory.PickupMessage "A Minigun!(Slot 4)";
		Obituary "%o was reduced to a bloody mess with %k's Minigun.";
		DWeapon.MinSpreadX 1;
		DWeapon.MinSpreadY 1;
		DWeapon.MaxSpreadX 2;
		DWeapon.MaxSpreadY 2;
		DWeapon.SpreadIncreaseX 0.04;
		DWeapon.SpreadIncreaseY 0.04;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "MinigunShot";
		DWeapon.RecoilMultX 0.2;
		DWeapon.RecoilMultY 0.6;
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		MING A 1 
		{
		A_WeaponReady();
		A_DecreaseSpread(0.75,0.75);
		A_WeaponSway(30,10,1.25,1);
		}
		Loop;
	Deselect:
		"####" A 0
		{
		A_StopSound(2);
		A_ResetSpread();
		}
		"####" A 1 A_WeaponOffset(-4,8,WOF_ADD);
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
		MING A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		MING A 0 A_JumpIf(CountInv("FiveFiveSix") < 1,"DryFire");
		MING B 0 
		{
		A_PlaySound("MinigunWindUp",2);
		}
		MING AAABBBCCCDDDAABBCCDDAABBCCDDABCDAC 1
		{
		A_DecreaseSpread(0.5,0.5);
		A_WeaponSway(30,10,0.5,2);
		}
		MING C 1 A_Refire;
		Goto FireEnd;
	Hold:
		MING A 0 A_JumpIf(CountInv("FiveFiveSix") < 1,"Dryfire");
		MING E 0 A_PlaySound("MinigunFire",2,1,true);
		MING A 0 A_JumpIf(CountInv("FiveFiveSix") < 1,"FireEnd2");
		MING E 1
		{
		ThrustThingZ (0, 7.5*sin(pitch), 0, 1);
		A_Recoil (1.5*cos(pitch));
		A_FireBoolts(2, 0, 0, 2);
		A_WeaponOffset(0,33,WOF_INTERPOLATE);
		A_SpawnItemEx ("MinigunCasing",cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),frandom(-2,2),frandom(12,14),-sin(pitch)*frandom(10,14),0);
		A_SpawnItemEx ("MinigunCasing",cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),frandom(-2,2),frandom(12,14),-sin(pitch)*frandom(10,14),0);
		A_Overlay(2, "RecoilY");
		A_Overlay(3, "RecoilX");
		}
		MING C 1
		{
		A_FireBoolts(1, 0, 0, 1);
		A_WeaponOffset(0,35,WOF_INTERPOLATE);
		A_SpawnItemEx ("MinigunCasing",cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),frandom(-2,2),frandom(12,14),-sin(pitch)*frandom(10,14),0);
		A_Overlay(2, "RecoilY");
		A_Overlay(3, "RecoilX");
		}
		MING A 0 A_JumpIf(CountInv("FiveFiveSix") < 1,"FireEnd2");
		MING A 1 A_Refire;
	FireEnd:
		MING A 0 A_PlaySound("MinigunWindDown",2);
		MING A 1 
		{
		A_WeaponOffset(0,35,WOF_INTERPOLATE);
		A_Refire();
		}
		MING C 1 
		{
		A_WeaponOffset(0,33,WOF_INTERPOLATE);
		A_Refire();
		}
		MING A 1 
		{
		A_WeaponOffset(0,32,WOF_INTERPOLATE);
		A_Refire();
		}
		MING BCDAABBCCDD 1 A_Refire;
		MING A 0
		{
		A_ClearRefire();
		}
		Goto Ready;
	FireEnd2:
		MING A 0
		{
		A_PlaySound("MinigunWindDown",2);
		}
		MING A 1 A_WeaponOffset(0,35,WOF_INTERPOLATE);
		MING C 1 A_WeaponOffset(0,33,WOF_INTERPOLATE);
		MING A 1 A_WeaponOffset(0,32,WOF_INTERPOLATE);
		MING BCDAABBCCDD 1 A_ClearRefire; 
		Goto Ready;
	Reload:
		MING A 35 A_WeaponReady();
		Goto Ready;
	Spawn:
		MING P -1;
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
		TNT1 A 1 A_SetPitch(pitch - 1.5 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1.25 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.75 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.5 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.25 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.125 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.0625 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1.25 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625 * invoker.RecoilMultY, SPF_INTERPOLATE);
		Stop;
	RecoilX:
		TNT1 A 1 A_SetAngle(angle - 1.5 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.4 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.3 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.2 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.1 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.9 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.8 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.7 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.6 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.5 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.4 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.3 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.2 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.15 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.1 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.05 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.025 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.0125 * invoker.RecoilMultX, SPF_INTERPOLATE);
		Stop;
	}
}

Class MiniGunShot:Boolet{
	Default{
		Speed 140;
		DamageFunction (22);
	}
}

Class FiveFiveSix:Ammo
{
	Default{
		Inventory.Amount 150;
		Inventory.MaxAmount 800;
		Ammo.Backpackamount 150;
		Ammo.BackpackMaxAmount 1600;
		Inventory.Icon "556SA0";
		Inventory.PickupMessage "A box of 5.56 rounds";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		556S A -1;
		Stop;
	}
}

Class FiveFiveSixLarge:FiveFiveSix
{
	Default{
		Inventory.PickupMessage "A large box of 5.56 rounds";
		Inventory.Amount 300;
	}
	States
	{
	Spawn:
		556L A -1;
		Stop;
	}
}