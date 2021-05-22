Class DKShotgun : DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 3;
		Weapon.AmmoType "Buckshot";
		Weapon.AmmoType2 "DragonsBreath";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 8;
		Inventory.PickupMessage "A Shotgun. (Slot 3)";
		Obituary "%o was shot with %k's Shotgun.";
		DWeapon.MinSpreadX 2.8;
		DWeapon.MinSpreadY 1.6;
		DWeapon.MaxSpreadX 2.8;
		DWeapon.MaxSpreadY 1.6;
		DWeapon.SpreadIncreaseX 0;
		DWeapon.SpreadIncreaseY 0;
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
		DNSG A 1 
		{
		A_WeaponReady(WRF_ALLOWRELOAD);
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 0 A_ResetSpread();
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
		DNSG A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		DNSG A 0 A_JumpIf(CountInv("Buckshot") < 1 && !invoker.UsingSuperAmmo, "Dryfire");
		DNSG A 0 A_JumpIf(CountInv("DragonsBreath") < 1 && invoker.UsingSuperAmmo, "Dryfire");
		DNSG B 1
		{
			A_PlaySound("ShotGunFire", 2);
			A_FireBoolts(1,0,0,7);
			A_ResetSway();
			A_Overlay(3,"Recoil");
		}
		TNT1 A 0 A_Overlay(2,"PumpAnim");
		TNT1 A 1 bright;
		TNT1 C 1 bright;
		TNT1 C 1 bright;
		TNT1 C 1 bright;
		TNT1 A 25;
		Goto Ready;
	Spawn:
		DNSP A -1;
		Stop;
	Reload:
		TNT1 A 0
		{
			A_ChangeAmmoType();
			if (invoker.UsingSuperAmmo)
			{
				A_SetInventory("UsingDB", 1);
			} else {
				A_SetInventory("UsingDB", 0);
			}
		}
		DNSG A 15 A_WeaponReady();
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
	PumpAnim:
		TNT1 B 0 A_OverlayFlags(2,PSPF_ADDWEAPON,true);
		DNSG B 1 A_OverlayOffset(1,0,36,WOF_INTERPOLATE);
		DNSG B 1 A_OverlayOffset(1,0,41,WOF_INTERPOLATE);
		DNSG C 1 A_OverlayOffset(1,0,41,WOF_INTERPOLATE);
		DNSG C 1 A_OverlayOffset(1,0,36,WOF_INTERPOLATE);
		DNSG A 1 A_OverlayOffset(1,0,32,WOF_INTERPOLATE);
		DNSG D 1 A_OverlayOffset(1,-5,33,WOF_INTERPOLATE);
		DNSG D 1 A_OverlayOffset(1,-11,35,WOF_INTERPOLATE);
		DNSG D 1 A_OverlayOffset(1,-18,38,WOF_INTERPOLATE);
		DNSG D 1 A_OverlayOffset(1,-24,40,WOF_INTERPOLATE);
		DNSG D 1 A_OverlayOffset(1,-29,41);
		DNSG E 1 A_OverlayOffset(1,0,34);
		TNT1 A 0
		{
		A_PlaySound("ShotgunPump",5);
		Class<Actor> casing = "ShotgunCasing";
		if (invoker.UsingSuperAmmo)
		{
			casing = "DBCasing";
		}
		A_SpawnItemEx (casing,cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),0,frandom(6,10),-sin(pitch)*frandom(10,14),0);
		}
		DNSG E 1 A_OverlayOffset(1,0,37,WOF_INTERPOLATE);
		DNSG E 1 A_OverlayOffset(1,0,41,WOF_INTERPOLATE);
		DNSG F 1 A_OverlayOffset(1,0,44,WOF_INTERPOLATE);
		DNSG F 1 A_OverlayOffset(1,0,46,WOF_INTERPOLATE);
		DNSG F 1 A_OverlayOffset(1,0,46,WOF_INTERPOLATE);
		DNSG F 1 A_OverlayOffset(1,0,46,WOF_INTERPOLATE);
		DNSG F 1 A_OverlayOffset(1,0,44,WOF_INTERPOLATE);
		DNSG E 1 A_OverlayOffset(1,0,41,WOF_INTERPOLATE);
		DNSG E 1 A_OverlayOffset(1,0,37,WOF_INTERPOLATE);
		DNSG E 1 A_OverlayOffset(1,0,34);
		DNSG D 1 A_OverlayOffset(1,-29,41);
		DNSG D 1 A_OverlayOffset(1,-24,40,WOF_INTERPOLATE);
		DNSG D 1 A_OverlayOffset(1,-18,38,WOF_INTERPOLATE);
		DNSG A 1 A_OverlayOffset(1,-11,35,WOF_INTERPOLATE);
		DNSG A 1 A_OverlayOffset(1,-5,33,WOF_INTERPOLATE);
		DNSG A 3 A_OverlayOffset(1,0,32,WOF_INTERPOLATE);
		Stop;
	Recoil:
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 3, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.0625, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625, SPF_INTERPOLATE);
		Stop;
	}
}

Class Buckshot:Ammo
{
	Default{
		radius 12;
		Inventory.Amount 4;
		Inventory.MaxAmount 60;
		Ammo.Backpackamount 6;
		Ammo.BackpackMaxAmount 120;
		Inventory.Icon "SHELA0";
		Inventory.PickupMessage "Shotgun Shells";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		SHEL A -1;
		Stop;
	}
}

Class BuckshotLarge:Buckshot
{
	Default{
		radius 16;
		Inventory.Amount 20;
		Inventory.Icon "SBOXA0";
		Inventory.PickupMessage "A Box of Shotgun Shells";
	}
	States
	{
	Spawn:
		SBOX A -1;
		Stop;
	}
}

Class DragonsBreath:Ammo
{
	Default{
		radius 12;
		Inventory.Amount 4;
		Inventory.MaxAmount 30;
		Ammo.Backpackamount 6;
		Ammo.BackpackMaxAmount 60;
		Inventory.Icon "SHEBA0";
		Inventory.PickupMessage "Dragon's Breath Shells";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		SHEB A -1;
		Stop;
	}
}

Class DragonsBreathLarge:DragonsBreath
{
	Default{
		radius 16;
		Inventory.Amount 20;
		Inventory.Icon "SBOXA0";
		Inventory.PickupMessage "A Box of Dragon's Breath Shells";
	}
	States
	{
	Spawn:
		SBOX A -1;
		Stop;
	}
}

Class ShotgunShot : Boolet
{
	Default{
	DamageFunction (30);
	Projectile;
	Obituary "%o was shot with %k's gun.";
		}
}

Class DBShot:FastProjectile
{
	Default{
		MissileType "DBShotTrail";
		RenderStyle "Add";
		Projectile;
		Radius 3;
		Height 5;
		Scale 0.5;
		missileheight 8;
		Speed 120;
		DamageFunction (10);
		DeathSound "DBImpact";
	}
	States
	{
	Spawn:
		PUFF A 1 Bright;
		Loop;
	Death:
	XDeath:
		DBEX A 0 A_Explode((10),48,0,false,0,0,0,"BulletPuff",'Ignite');
		DBEX ABCDEFGHIJ 3 bright;
		Stop;
	}
}

Class DBShotTrail:BooletTrail
{
	Default{
	Scale 0.2;
	RenderStyle "Add";
	}
	States
	{
		Spawn:
		DBTR ABC 1 bright;
		Stop;
	}
}

Class DBPuff:BulletPuff
{
	Default{
		speed 0;
		+PUFFONACTORS;
		+ALWAYSPUFF;
		RenderStyle "Normal";
		StencilColor "None";
	}
		States
	{
	Spawn:
		MISL B 0;
	Melee:
		MISL B 0 A_PlaySound("weapons/rocklx",0,0.15);
		MISL B 8 bright A_Explode(80,64);
		MISL C 6 bright;
		MISL D 4 bright;
		Stop;
	}
}

Class UsingDB:Inventory
{
	Default{
		Inventory.MaxAmount 1;
		+INVENTORY.IGNORESKILL;
	}
}

//Double-Barreled Shotgun, great damage up close, slow rate of fire, takes 2 shells per shot

Class SupaShotgun : DWeapon
{
	Default{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 3;
		Weapon.AmmoType "Buckshot";
		Weapon.AmmoType2 "DragonsBreath";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 8;
		Inventory.PickupMessage "A Double-Barreled shotgun (Slot 3)";
		Obituary "%o was blown away with %k's Double-Barreled Shotgun.";
		Weapon.BobStyle "InverseSmooth";
		Weapon.BobRangeX 0.8;
		Weapon.BobRangeY 0.8;
		Weapon.BobSpeed 1.2;
		DWeapon.MinSpreadX 6;
		DWeapon.MinSpreadY 3;
		DWeapon.MaxSpreadX 6;
		DWeapon.MaxSpreadY 3;
		DWeapon.SpreadIncreaseX 0;
		DWeapon.SpreadIncreaseY 0;
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
		KSSG A 1 
		{
		A_WeaponReady(WRF_ALLOWRELOAD);
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
		KSSG A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		KSSG A 0 A_JumpIf(CountInv("Buckshot") < 2 && !invoker.UsingSuperAmmo, "Dryfire");
		KSSG A 0 A_JumpIf(CountInv("DragonsBreath") < 2 && invoker.UsingSuperAmmo == 1, "Dryfire");
		KSSG I 1
		{
			if ((z - floorz) > 0)
			{
				ThrustThingZ (0, 40*sin(pitch), 0, 1);
				A_Recoil (10*cos(pitch));
			}
	//		A_Overlay(4,"RecoilX");
			A_FireBoolts(2,0,0,14);
			A_Overlay(3,"RecoilY");
			A_PlaySound("SSGFire",1);
			A_ResetSway();
		}
//		TNT1 A 0 A_SetPitch(pitch - 1,SPF_INTERPOLATE)
		KSSG I 1 A_WeaponOffset(0,36,WOF_INTERPOLATE);
		KSSG I 1 A_WeaponOffset(0,41,WOF_INTERPOLATE);
		KSSG J 1 A_WeaponOffset(0,45,WOF_INTERPOLATE);
		KSSG J 1 A_WeaponOffset(0,41,WOF_INTERPOLATE);
		KSSG J 1 A_WeaponOffset(0,36,WOF_INTERPOLATE);
		KSSG B 1 A_WeaponOffset(0,32,WOF_INTERPOLATE);
		KSSG B 1 A_WeaponOffset(-1,33,WOF_INTERPOLATE);
		KSSG B 0 A_PlaySound("SSGReload1", 2);
		KSSG B 1 A_WeaponOffset(-3,35,WOF_INTERPOLATE); 
		KSSG B 1 A_WeaponOffset(-6,38,WOF_INTERPOLATE);
		KSSG B 1 A_WeaponOffset(-10,42,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-15,47,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-19,51,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-22,54,WOF_INTERPOLATE);
		KSSG C 0 A_PlaySound("SSGReload2", 2);
		KSSG D 1 A_WeaponOffset(-24,56,WOF_INTERPOLATE);
		KSSG D 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG D 1
		{
		A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		Class<Actor> casing = "ShotgunCasing";
		if (invoker.UsingSuperAmmo)
		{
			casing = "DBCasing";
		}
		//A_SpawnItemEx(casing,-2,-4,24,0,frandom(-8,-12),0,frandom(-200,-220));
		//A_SpawnItemEx(casing,-2,-4,24,0,frandom(-8,-12),0,frandom(-200,-220));
		A_SpawnItemEx (casing,cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),frandom(-4,-8),frandom(8,12),-sin(pitch)*frandom(14,18),0);
		A_SpawnItemEx (casing,cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),frandom(-4,-8),frandom(8,12),-sin(pitch)*frandom(14,18),0);
		}
		KSSG E 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG E 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG E 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG K 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG K 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG K 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG K 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG C 0 A_PlaySound("SSGReload3", 2);
		KSSG F 1 A_WeaponOffset(-26,58,WOF_INTERPOLATE);
		KSSG F 1 A_WeaponOffset(-28,60,WOF_INTERPOLATE);
		KSSG F 1 A_WeaponOffset(-29,61,WOF_INTERPOLATE);
		KSSG G 1 A_WeaponOffset(-28,60,WOF_INTERPOLATE);
		KSSG G 1 A_WeaponOffset(-26,58,WOF_INTERPOLATE);
		KSSG G 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG H 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG H 1 A_WeaponOffset(-25,57,WOF_INTERPOLATE);
		KSSG H 1 A_WeaponOffset(-24,56,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-22,54,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-19,51,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-15,47,WOF_INTERPOLATE);
		KSSG C 1 A_WeaponOffset(-10,42,WOF_INTERPOLATE);
		KSSG C 0 A_PlaySound("SSGReload4", 2);
		KSSG B 1 A_WeaponOffset(-6,38,WOF_INTERPOLATE);
		KSSG B 1 A_WeaponOffset(-3,35,WOF_INTERPOLATE);
		KSSG B 1 A_WeaponOffset(-1,33,WOF_INTERPOLATE);
		KSSG B 1 A_WeaponOffset(-0,32,WOF_INTERPOLATE);
		KSSG A 1 A_WeaponOffset(-0,32,WOF_INTERPOLATE);
		KSSG A 2 A_WeaponOffset(-0,32,WOF_INTERPOLATE);
		Goto Ready;
	Spawn:
		KSSG L -1;
		Stop;
	Reload:
		TNT1 A 0
		{
			A_ChangeAmmoType();
			if (invoker.UsingSuperAmmo)
			{
				A_SetInventory("UsingSupaDB", 1);
			} else {
				A_SetInventory("UsingSupaDB", 0);
			}
		}
		KSSG A 15 A_WeaponReady();
		Goto Ready;
	RecoilY:
		TNT1 A 1 A_SetPitch(pitch - 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 3, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.05, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.00625, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.05, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.05, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.00625, SPF_INTERPOLATE);
		Stop;
	RecoilX:
		TNT1 A 1 A_SetAngle(angle + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.30, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle + 0.40, SPF_INTERPOLATE);
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
	}
}

Class UsingSupaDB:Inventory
{
	Default{
		Inventory.MaxAmount 1;
		+INVENTORY.IGNORESKILL;
	}
}

