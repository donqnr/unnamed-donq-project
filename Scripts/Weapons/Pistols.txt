class dkpistol:DWeapon{


	Default{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 2;
		Weapon.AmmoType "Ninemm";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 24;
		Inventory.PickupMessage "A Pistol. (Slot 2)";
		Obituary "%o somehow managed to die to %k's Pistol.";
		DWeapon.MinSpreadX 1;
		DWeapon.MinSpreadY 1;
		DWeapon.MaxSpreadX 3;
		DWeapon.MaxSpreadY 1.5;
		DWeapon.SpreadIncreaseX 0.5;
		DWeapon.SpreadIncreaseY 0.3;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "PistolShot";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
		+Weapon.NOAUTOFIRE;
	}
	States
	{
	Ready:
		GLOK A 1
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
		GLOK A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		GLOK A 0 A_JumpIf(CountInv("Ninemm") < 1, "DryFire");
		GLOK B 1
		{
			A_Overlay(2, "Recoil");
			A_ResetSway();
			A_WeaponOffset(0,33,WOF_INTERPOLATE);
			A_FireBoolts(1, 0, 0, 1);
//			A_SpawnItemEx("PistolCasing",-2,-4,24,0,frandom(-8,-12),0,frandom(-170,-190));
//			A_SpawnItemEx("PistolCasing",0,0,32,0,12,0,0);
			A_SpawnItemEx ("PistolCasing",cos(pitch)*33 - sin(pitch)*10,0,32-(sin(pitch)*28),0,frandom(6,10),-sin(pitch)*frandom(10,14),0);
		}
		GLOK B 1 A_WeaponOffset(0,2,WOF_ADD);
		GLOK B 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		GLOK C 1 A_WeaponOffset(0,3,WOF_ADD);
		GLOK B 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		GLOK C 1 A_WeaponOffset(0,2,WOF_ADD);
		GLOK B 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		GLOK C 1 A_WeaponOffset(0,-2,WOF_ADD);
		GLOK B 0 A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		GLOK A 1 A_WeaponOffset(0,-3,WOF_ADD);
		GLOK B 0 
		{
		A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		A_DecreaseSpread(0.25,0.15);
		}
		GLOK A 1 A_WeaponOffset(0,33,WOF_INTERPOLATE);
		GLOK B 0 
		{
		A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
		A_DecreaseSpread(0.5,0.3);
		}
		GLOK A 1 A_Refire();
		Goto Ready;
	Spawn:
		GLOI A -1;
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
		TNT1 A 1 A_SetPitch(pitch - 0.2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.4, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.15, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.15, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1, SPF_INTERPOLATE);
		Stop;
	}
}

Class PistolShot : Boolet
{
	Default
	{
		Radius 3;
		Height 3;
		Scale 0.3;
		DamageFunction (24);
		SeeSound "PistolFire";
//		MissileType "PShotTrail";
		Obituary "%o was shot with %k's gun.";
		}
}
Class PShotTrail:BooletTrail
{
	Default{
		Scale 0.275;
	}
}

Class Ninemm : Ammo
{
	Default
	{
		radius 8;
		Inventory.Amount 12;
		Inventory.MaxAmount 300;
		Ammo.Backpackamount 36;
		Ammo.BackpackMaxAmount 600;
		Inventory.Icon "PMAGA0";
		Inventory.PickupMessage "9mm rounds";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		PMAG A -1;
		Stop;
	}
}

Class NinemmBox : Ninemm
{
	Default
	{
		Inventory.Amount 60;
		Inventory.Icon "PMAGA0";
		Inventory.PickupMessage "A box of 9mm rounds";
	}
	States
	{
	Spawn:
		PBOX A -1;
		Stop;
	}
}

class machinepistol:DWeapon{
	Default{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 2;
		Weapon.AmmoType "Ninemm";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 40;
		Inventory.PickupMessage "A Machine Pistol. (Slot 2)";
		Obituary "%o something something %k's Machine Pistol.";
		DWeapon.MinSpreadX 0.3;
		DWeapon.MinSpreadY 0.1;
		DWeapon.MaxSpreadX 3.5;
		DWeapon.MaxSpreadY 1.5;
		DWeapon.SpreadIncreaseX 0.5;
		DWeapon.SpreadIncreaseY 0.3;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "PistolShot";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		MUZI A 1
		{
		A_WeaponReady();
		A_DecreaseSpread(0.2,0.2);
		A_WeaponSway();
		}
		Loop;
	Deselect:
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
		MUZI A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		MUZI A 0 A_JumpIf(CountInv("Ninemm") < 1, "DryFire");
		MUZI B 1
		{
			A_Overlay(2, "Recoil");
			A_WeaponOffset(0,34,WOF_INTERPOLATE);
			A_FireBoolts(1, 0, 0, 1);
			A_WeaponReady(WRF_NOBOB|WRF_DISABLESWITCH);
			float a = 10;
			float spawnheight = 34;
			if (pitch < 0) { a = 8; spawnheight = 37; }
			float b = (-pitch * 0.2) + spawnheight;
			A_SpawnItemEx ("PistolCasing",cos(pitch)*34 - sin(pitch)*10,0,34-(sin(pitch)*28),0,frandom(6,10),-sin(pitch)*frandom(10,14),0);
		}
		MUZI A 1 A_WeaponOffset(0,39,WOF_INTERPOLATE);
		MUZI A 1 A_WeaponOffset(0,34,WOF_INTERPOLATE);
		Goto Ready;
	Spawn:
		MUZP A -1;
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
		TNT1 A 1 A_SetPitch(pitch - 0.4, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.6, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.4, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.3, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.05, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.025, SPF_INTERPOLATE);
		Stop;
	}
}