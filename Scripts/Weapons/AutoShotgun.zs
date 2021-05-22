Class AutoShotgun : DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 3;
		Weapon.AmmoType "Buckshot";
		Weapon.AmmoType2 "DragonsBreath";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 8;
		Inventory.PickupMessage "An Automatic Shotgun! (Slot 3)";
		Obituary "%o was sdafcX>zgshbbrethsdyfgrhtdygfthdgsfdthgfrdthsgfxberdsgfwaerfsdasfdezc<sdfazvxcfdghxcbvhfgdyjcnvgyjuhfnghfvhfgd with %k's AutoShotgun.";
		DWeapon.MinSpreadX 2.8;
		DWeapon.MinSpreadY 1.5;
		DWeapon.MaxSpreadX 9;
		DWeapon.MaxSpreadY 6;
		DWeapon.SpreadIncreaseX 2;
		DWeapon.SpreadIncreaseY 1;
		DWeapon.SuperAmmo "DragonsBreath";
		DWeapon.HasSuperAmmo true;
		DWeapon.NormalProj "ShotgunShot";
		DWeapon.SuperProj "DBShot";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		ATSG A 1
		{
		A_WeaponReady(WRF_ALLOWRELOAD);
		A_DecreaseSpread(0.1,0.1);
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 0 A_DecreaseSpread(4.5,3);
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
		ATSG A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		ATSG A 0 A_JumpIf(CountInv("Buckshot") < 1 && !invoker.UsingSuperAmmo, "Dryfire");
		ATSG A 0 A_JumpIf(CountInv("DragonsBreath") < 1 && invoker.UsingSuperAmmo, "Dryfire");
		ATSG B 1
		{
			A_ResetSway();
			A_PlaySound("AutoSGFire", 2);
			A_FireBoolts(1,0,0,7);
			A_WeaponOffset(0,10,WOF_ADD);
					Class<Actor> casing = "ShotgunCasing";
			if (invoker.UsingSuperAmmo)
			{
				casing = "DBCasing";
			}
			A_Overlay(2,"Recoil");
			A_SpawnItemEx (casing,cos(pitch)*24 - sin(pitch)*10,-5,27-(sin(pitch)*16),frandom(-3,3),frandom(6,10),-sin(pitch)*frandom(10,14),0);
		}
		ATSG B 1 A_WeaponOffset(0,6,WOF_ADD);
		ATSG B 1 A_WeaponOffset(0,-2,WOF_ADD);
		ATSG A 1 A_WeaponOffset(0,-4,WOF_ADD);
		ATSG A 1 A_WeaponOffset(0,-4,WOF_ADD);
		ATSG A 1 A_WeaponOffset(0,-5,WOF_ADD);
		Goto Ready;
	Spawn:
		ATSG P -1;
		Stop;
	Reload:
		TNT1 A 0
		{
			A_ChangeAmmoType();
			if (invoker.UsingSuperAmmo)
			{
				A_SetInventory("UsingATDB", 1);
			} else {
				A_SetInventory("UsingATDB", 0);
			}
		}
		ATSG A 15 A_WeaponReady();
		Goto Ready;
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
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 3, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.05, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0125, SPF_INTERPOLATE);
		Stop;
	}
}

Class UsingATDB:Inventory
{
	Default{
		Inventory.MaxAmount 1;
		+INVENTORY.IGNORESKILL;
	}
}