class MagnumRevolver:DWeapon{


	Default{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 2;
		Weapon.AmmoType "MagnumRounds";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 18;
		Inventory.PickupMessage "A Magnum Revolver. (Slot 2)";
		Obituary "%o made %k's day.";
		DWeapon.MinSpreadX 0.5;
		DWeapon.MinSpreadY 0.5;
		DWeapon.MaxSpreadX 4.5;
		DWeapon.MaxSpreadY 3;
		DWeapon.SpreadIncreaseX 1.5;
		DWeapon.SpreadIncreaseY 1;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "MagnumShot";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
		+Weapon.NOAUTOFIRE;
	}
	States
	{
	Ready:
		MGNM A 1
		{
		A_WeaponReady();
		A_DecreaseSpread(0.5,0.5);
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 0 A_DecreaseSpread(1.3,0.5);
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
		MGNM A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		MGNM A 0 A_JumpIf(CountInv("MagnumRounds") < 1, "DryFire");
		MGNM B 1
		{
			A_ResetSway();
			A_WeaponOffset(0,2,WOF_ADD);
			A_FireBoolts(1, 0, 0, 1);
			A_Overlay(2, "Recoil");
		}
		MGNM B 1 A_WeaponOffset(0,4,WOF_ADD);
		MGNM B 1 A_WeaponOffset(0,6,WOF_ADD);
		MGNM A 1 A_WeaponOffset(0,4,WOF_ADD);
		MGNM A 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM C 1 A_WeaponOffset(0,2,WOF_ADD);
		MGNM C 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM C 1 A_WeaponOffset(0,-1,WOF_ADD);
		MGNM C 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM D 1 A_WeaponOffset(0,-2,WOF_ADD);
		MGNM D 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM D 1 A_WeaponOffset(0,-3,WOF_ADD);
		MGNM D 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM D 1 A_WeaponOffset(0,-4,WOF_ADD);
		MGNM D 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM C 1 A_WeaponOffset(0,-3,WOF_ADD);
		MGNM C 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM C 1 A_WeaponOffset(0,-2,WOF_ADD);
		MGNM C 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM C 1 A_WeaponOffset(0,-1,WOF_ADD);
		MGNM A 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		MGNM A 1 A_WeaponOffset(0,-1,WOF_ADD);
		MGNM A 0
		{
		A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		A_DecreaseSpread(1,1);
		}
		MGNM A 1 A_WeaponOffset(0,-1,WOF_ADD);
		MGNM A 0 
		{
		A_DecreaseSpread(1,1);
		A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		}
		MGNM A 1 A_Refire();
		Goto Ready;
	Spawn:
		MGNM P -1;
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
	Recoil:
		TNT1 A 1 A_SetPitch(pitch - 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.75, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.50, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625, SPF_INTERPOLATE);
		Stop;
	}
}

Class MagnumShot : Boolet
{
	Default
	{
		Radius 3;
		Height 3;
		Scale 2;
		Speed 140;
		DamageFunction (75);
		SeeSound "MagnumFire";
		Obituary "%o made %k's day.";
		}
}

Class MagnumRounds : Ammo
{
	Default
	{
		radius 8;
		Inventory.Amount 6;
		Inventory.MaxAmount 120;
		Ammo.Backpackamount 12;
		Ammo.BackpackMaxAmount 240;
		Scale 0.7;
		Inventory.Icon "PMAGA0";
		Inventory.PickupMessage "357. Magnum Rounds";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		357A A -1;
		Stop;
	}
}

Class MagnumBox : MagnumRounds
{
	Default
	{
		Inventory.Amount 30;
		Inventory.Icon "PMAGA0";
		Inventory.PickupMessage "A box of 357. rounds";
	}
	States
	{
	Spawn:
		PBOX A -1;
		Stop;
	}
}