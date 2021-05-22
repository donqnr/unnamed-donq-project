class PlasmaCannon:DWeapon{
	Default{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 4;
		Weapon.AmmoType "PlasmaCartridge";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 20;
		Inventory.PickupMessage "Rapid Plasma Cannon. (Slot 4)";
		Obituary "%o was melted with %k's Plasma Cannon.";
		DWeapon.MinSpreadX 1;
		DWeapon.MinSpreadY 0.8;
		DWeapon.MaxSpreadX 1.5;
		DWeapon.MaxSpreadY 1.2;
		DWeapon.SpreadIncreaseX 0.3;
		DWeapon.SpreadIncreaseY 0.2;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "PlasmaShot";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		DPRF BBB 1 
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		DPRF B 0 A_DecreaseSpread(0.15,0.15);
		DPRF CCC 1
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		DPRF B 0 A_DecreaseSpread(0.15,0.15);
		DPRF DDD 1 
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		DPRF B 0 A_DecreaseSpread(0.15,0.15);
		DPRF EEE 1 
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		DPRF B 0 A_DecreaseSpread(0.15,0.15);
		DPRF FFF 1 
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		DPRF B 0 A_DecreaseSpread(0.15,0.15);
		Loop;
	Deselect:
		"####" B 0 A_DecreaseSpread(2.85,2.85);
		"####" B 1 A_WeaponOffset(-4,8,WOF_ADD);
		"####" B 1 A_WeaponOffset(-6,12,WOF_ADD);
		"####" B 1 A_WeaponOffset(-8,16,WOF_ADD);
		"####" B 1 A_WeaponOffset(-10,20,WOF_ADD);
		"####" B 1 A_WeaponOffset(-8,16,WOF_ADD);
		"####" B 1 A_WeaponOffset(-6,12,WOF_ADD);
		"####" B 1 A_WeaponOffset(-4,8,WOF_ADD);
		TNT1 B 5;
		"####" B 0 A_Lower();
		Wait;
	Select:
		TNT1 B 0 A_ResetSway();
		DPRF B 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" B 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" B 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" B 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" B 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" B 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" B 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		DPRF B 0 A_JumpIf(CountInv("PlasmaCartridge") < 1, "DryFire");
		DPRF J 1
		{
		//	A_WeaponOffset(0,33,WOF_INTERPOLATE);
			A_FireBoolts(1, 0, 0, 1);
			A_PlaySound("PlasmaFire",1);
			A_ResetSway();
		}
		DPRF K 1 A_WeaponOffset(0,33,WOF_INTERPOLATE);
		DPRF K 1 A_WeaponOffset(0,35,WOF_INTERPOLATE);
		DPRF L 1 A_WeaponOffset(0,38,WOF_INTERPOLATE);
		DPRF L 1 A_WeaponOffset(0,35,WOF_INTERPOLATE);
		DPRF B 1 A_WeaponOffset(0,33,WOF_INTERPOLATE);
		Goto Ready;
	Spawn:
		DPRF A -1;
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
		"####" # 1 A_WeaponOffset(0,1,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,-1,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,-2,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" # 1 A_WeaponOffset(0,-1,WOF_ADD);
		"####" # 0 A_WeaponSway();
		"####" ######### 1 
		{
		A_WeaponReady(WRF_NOFIRE|WRF_ALLOWRELOAD|WRF_NOBOB);
		A_WeaponSway();
		}
		Goto Ready;
	}
}

Class PlasmaShot : Actor
{
	Default
	{
		Radius 7;
		Height 5;
		Scale 0.3;
		DamageFunction (60);
		Projectile;
		Speed 80;
		RenderStyle "Add";
//		MissileType "PShotTrail";
		Decal "PlasmaScorchLower1";
		DeathSound "PlasmaImpact";
		Obituary "%o was melted with %k's Rapid Plasma Cannon.";
	}
	States
	{
	Spawn:
		APLS AB 3 Bright;
		Loop;
	Death:
		APBX A 0 Bright A_Explode((100), 50);
		APBX A 1 Bright A_SetScale(1);
		APBX ABCDE 2 Bright;
		Stop;
	}
}

Class PlasmaCartridge : Ammo
{
	Default
	{
		radius 8;
		Inventory.Amount 20;
		Inventory.MaxAmount 200;
		Ammo.Backpackamount 20;
		Ammo.BackpackMaxAmount 400;
		Inventory.Icon "PMAGA0";
		Inventory.PickupMessage "Plasma Cartridges";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		PMAG A -1;
		Stop;
	}
}

Class PlasmaBox : Ninemm
{
	Default
	{
		Inventory.Amount 60;
		Inventory.Icon "PMAGA0";
		Inventory.PickupMessage "A box of plasma cartridges";
	}
	States
	{
	Spawn:
		PBOX A -1;
		Stop;
	}
}