//Sprites from Strife
//Firing sound from Serious Sam 3:BFE


Class DKMissileLauncher:DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 5;
		Weapon.AmmoType1 "MMissiles";
		Weapon.AmmoType2 "HomingMMissiles";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 10;
		Inventory.PickupMessage "A Mini Missile Launcher. (Slot 5)";
		Obituary "%o was blown by %k's mini-missile launcher.";
		DWeapon.MinSpreadX 0;
		DWeapon.MinSpreadY 0;
		DWeapon.MaxSpreadX 2.5;
		DWeapon.MaxSpreadY 1.2;
		DWeapon.SpreadIncreaseX 0.4;
		DWeapon.SpreadIncreaseY 0.4;
		DWeapon.HasSuperAmmo true;
		DWeapon.SuperAmmo "HomingMMissiles";
		DWeapon.NormalProj "MMissile";
		DWeapon.SuperProj "HomingMMissile";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		MMIS A 1
		{
		A_WeaponReady(WRF_ALLOWRELOAD);
		A_DecreaseSpread(0.05,0.05);
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 0 A_DecreaseSpread(0.95,0.95);
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
		MMIS A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		MMIS A 0 A_JumpIf(CountInv("MMissiles") < 1 && CountInv("UsingHoming") < 1, "Dryfire");
		MMIS A 0 A_JumpIf(CountInv("HomingMMissiles") < 1 && CountInv("UsingHoming") == 1, "Dryfire");
		MMIS B 1
		{
			A_OverlayOffset(1,0,32.5,WOF_INTERPOLATE);
			A_FireBoolts(1,0,0,1);
		}
		MMIS B 1 A_OverlayOffset(1,0,33,WOF_INTERPOLATE);
		MMIS C 1 A_OverlayOffset(1,0,35,WOF_INTERPOLATE);
		MMIS C 1 A_OverlayOffset(1,0,36,WOF_INTERPOLATE);
		MMIS C 1 A_OverlayOffset(1,0,36.5,WOF_INTERPOLATE);
		MMIS E 1 A_OverlayOffset(1,0,36,WOF_INTERPOLATE);
		MMIS E 1 A_OverlayOffset(1,0,35,WOF_INTERPOLATE);
		MMIS F 1 A_OverlayOffset(1,0,33,WOF_INTERPOLATE);
		MMIS F 1 A_OverlayOffset(1,0,32.5,WOF_INTERPOLATE);
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
	Spawn:
		MMSL A -1;
		Stop;
	Reload:
		TNT1 A 0
		{
			A_ChangeAmmotype();
			if (invoker.UsingSuperAmmo)
			{
				A_SetInventory("UsingHoming", 1);
			} else {
				A_SetInventory("UsingHoming", 0);
			}
		}
		MMIS A 15 A_WeaponReady();
		Goto Ready;
	RecoilAnim:
		TNT1 B 0 A_OverlayFlags(2,PSPF_ADDWEAPON,true);
		MMIS B 1 A_OverlayOffset(1,0,32,WOF_INTERPOLATE);
		Stop;
	}
}

Class MMissile:Actor
{
	Default{
		Radius 7;
		Height 5;
		Speed 14;
		DamageFunction (50);
		Projectile;
		Alpha 0.75;
		scale 0.35;
		SeeSound "MisslFire";
		DeathSound "weapons/rocklx";
		Obituary "%o got blown by %k";
	}
	States
	{
	Spawn:
		MISL AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 1 bright A_ScaleVelocity(1.1);
		MISL A 350 bright;
		loop;
	Death:
		MISL B 6 bright A_Explode((200), 70);
		MISL C 4 bright;
		MISL D 2 bright;
		Stop;
	}
}
Class HomingMMissile:MMissile
{
	Default{
		+SEEKERMISSILE;
		+SCREENSEEKER;
	}
	States
	{
	Spawn:
		MISL AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 1
		{
			A_ScaleVelocity(1.1);
			A_SeekerMissile(0,10,SMF_LOOK|SMF_CURSPEED|SMF_PRECISE,256,10);
		}
	Aaa:
		MISL A 1 A_SeekerMissile(0,10,SMF_LOOK|SMF_CURSPEED|SMF_PRECISE,256,10);
		Loop;
	Death:
		MISL B 6 bright A_Explode((200), 70);
		MISL C 4 bright;
		MISL D 2 bright;
		Stop;
	}
}
		
Class MMissiles:Ammo
{
	Default{
		Inventory.Amount 5;
		Inventory.MaxAmount 60;
		Ammo.Backpackamount 10;
		Ammo.BackpackMaxAmount 120;
		Inventory.Icon "MSSLA0";
		Inventory.PickupMessage "Some Mini missiles";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		MSSL A -1;
		Stop;
	}
}

Class MMissilesLarge:MMissiles
{
	Default{
		Inventory.Amount 15;
		Inventory.Icon "MSSLA0";
		Inventory.PickupMessage "Several Mini missiles";
	}
	States
	{
	Spawn:
		MSSL B -1;
		Stop;
	}
}

Class HomingMMissiles:Ammo
{
	Default{
		Inventory.Amount 5;
		Inventory.MaxAmount 40;
		Ammo.Backpackamount 5;
		Ammo.BackpackMaxAmount 80;
		Inventory.Icon "HMSLA0";
		Inventory.PickupMessage "Some Homing Mini missiles";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		HMSL A -1;
		Stop;
	}
}

Class HomingMMissilesLarge:HomingMMissiles
{
	Default{
		Inventory.Amount 15;
		Inventory.Icon "HMSLB0";
		Inventory.PickupMessage "Several Homing Mini missiles";
	}
	States
	{
	Spawn:
		HMSL B -1;
		Stop;
	}
}
Class UsingHoming:Inventory { Default { Inventory.MaxAmount 1; +INVENTORY.IGNORESKILL; } }