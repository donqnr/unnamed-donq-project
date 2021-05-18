Class DKMachineGun:DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 4;
		Weapon.AmmoType1 "SevenSixTwo";
		Weapon.AmmoType2 "SevenSixTwoRipper";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 40;
		Inventory.PickupMessage "A Machinegun. (Slot 4)";
		Obituary "%o was riddled with bullets by %k's Machine Gun.";
		DWeapon.MinSpreadX 0.3;
		DWeapon.MinSpreadY 0.3;
		DWeapon.MaxSpreadX 1.75;
		DWeapon.MaxSpreadY 1.75;
		DWeapon.SpreadIncreaseX 0.1;
		DWeapon.SpreadIncreaseY 0.1;
		DWeapon.HasSuperAmmo true;
		DWeapon.SuperAmmo "SevenSixTwoRipper";
		DWeapon.NormalProj "MGShot";
		DWeapon.SuperProj "MGRipperShot";
		DWeapon.RecoilMultY 0.4;
		DWeapon.RecoilMultX -0.1;
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		MCGN A 1 {
		A_WeaponReady(WRF_ALLOWRELOAD);
		A_DecreaseSpread(0.05,0.05);
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 0 A_DecreaseSpread(1,1);
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
		MCGN A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		MCGN A 0 A_JumpIf(invoker.UsingSuperAmmo && CountInv("SevenSixTwoRipper") < 1, "DryFire");
		MCGN A 0 A_JumpIf(!invoker.UsingSuperAmmo && CountInv("SevenSixTwo") < 1, "DryFire");
		MCGN B 1
		{	
			A_FireBoolts(1,0,0,1);
			A_SpawnItemEx ("MachineGunCasing",cos(pitch)*8 - sin(pitch)*10,0,30-(sin(pitch)*8),frandom(-4,4),frandom(6,10),-sin(pitch)*frandom(10,14),0);
			A_ResetSway();
			A_Overlay(2, "Recoil");
			A_Overlay(3, "RecoilX");
		}
		MCGN B 1 A_WeaponOffset(frandom(1,-1),2,WOF_ADD);
		MCGN C 1 A_WeaponOffset(frandom(0.5, -0.5),1,WOF_ADD);
		Goto Ready;
	Reload:
		TNT1 A 0
		{
			A_ChangeAmmoType();
			if (invoker.UsingSuperAmmo)
			{
				A_SetInventory("UsingRip", 1);
			} else {
				A_SetInventory("UsingRip", 0);
			}
		}
		MCGN A 15 A_WeaponReady();
		Goto Ready;
	Spawn:
		MCGN W -1;
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
		TNT1 A 1 A_SetPitch(pitch - 1 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.8 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.6 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.4 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.2 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.1 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.2 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.4 * invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.6 * invoker.RecoilMultY, SPF_INTERPOLATE);
		Stop;
	RecoilX:
		TNT1 A 1 A_SetAngle(angle - 1 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.9 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.8 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.7 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.6 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.5 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.4 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.3 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.2 * invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.1 * invoker.RecoilMultX, SPF_INTERPOLATE);
		Stop;
	}
}

Class MGShot:Boolet{
	Default{
		Speed 120;
		DamageFunction (30);
		SeeSound "MGFire";
	}
}


Class MGRipperShot:RedBoolet {

/*		static const color colours[] = {
		"ff 00 00",
		"ff 19 19",
		"ff 32 32",
		"ff 4c 4c",
		"ff 66 66",
		"ff 66 66"
		};
*/		
	Default{ 
		Speed 120;
		+RIPPER; 
		DamageFunction (8);
		SeeSound "MGFire";
	}
}

Class MGRipShotTrail:BooletTrail {
	Default{
		StencilColor "red";
	}
}

Class SevenSixTwo:Ammo
{
	Default{
		radius 12;
		Inventory.Amount 20;
		Inventory.MaxAmount 300;
		Ammo.Backpackamount 40;
		Ammo.BackpackMaxAmount 600;
		Inventory.Icon "762SA0";
		Inventory.PickupMessage "A box of 7.62 FMJ rounds";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		762S A -1;
		Stop;
	}
}

Class SevenSixTwoLarge:SevenSixTwo
{
	Default{
		radius 14;
		Inventory.PickupMessage "A large box of 7.62 FMJ rounds";
		Inventory.Amount 60;
	}
	States
	{
	Spawn:
		762L A -1;
		Stop;
	}
}

Class SevenSixTwoRipper:Ammo
{
	Default{
		radius 12;
		Inventory.Amount 20;
		Inventory.MaxAmount 150;
		Ammo.Backpackamount 40;
		Ammo.BackpackMaxAmount 300;
		Inventory.Icon "76RSA0";
		Inventory.PickupMessage "7.62 Ripper rounds";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		76RS A -1;
		Stop;
	}
}

Class SevenSixTwoRipperLarge:SevenSixTwoRipper
{
	Default{
		radius 14;
		Inventory.PickupMessage "A large box of 7.62 Ripper rounds";
		Inventory.Amount 60;
	}
	States
	{
	Spawn:
		76RL A -1;
		Stop;
	}
}

Class UsingRip:Inventory { Default { Inventory.MaxAmount 1; +INVENTORY.IGNORESKILL; } }