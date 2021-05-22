Class NadeLauncher : DWeapon
{
	Default{
		Weapon.Selectionorder 320;
		Weapon.SlotNumber 5;
		Weapon.AmmoType "ClusterGrenade";
		Weapon.AmmoType2 "PhosphorGrenade";
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 2;
		Inventory.PickupMessage "A Grenade Launcher (Slot 5)";
		Obituary "%o was blown up with %k's Grenade Launcher.";

		DWeapon.MinSpreadX 0;
		DWeapon.MinSpreadY 0;
		DWeapon.MaxSpreadX 0;
		DWeapon.MaxSpreadY 0;
		DWeapon.SpreadIncreaseX 0;
		DWeapon.SpreadIncreaseY 0;
		DWeapon.SuperAmmo "PhosphorGrenade";
		DWeapon.HasSuperAmmo true;
		DWeapon.NormalProj "ClusterProj";
		DWeapon.SuperProj "PhosphorProj";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		GLAG A 1 
		{
		A_WeaponReady(WRF_ALLOWRELOAD);
		A_WeaponSway(30,10,1,1.5);
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
		GLAG A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		GLAG A 0 A_JumpIf(CountInv("ClusterGrenade") < 1 && !invoker.UsingSuperAmmo, "Dryfire");
		GLAG A 0 A_JumpIf(CountInv("PhosphorGrenade") < 1 && invoker.UsingSuperAmmo == 1, "Dryfire");
		GLAF A 1
		{
			A_ResetSway();
			A_FireBoolts(1,0,0,1);
			A_PlaySound("NadeFire",1);
			A_Overlay(3,"Recoil");
		}
//		TNT1 A 0 A_SetPitch(pitch - 1,SPF_INTERPOLATE)
		GLAF A 1 A_WeaponOffset(0,36,WOF_INTERPOLATE);
		GLAF A 1 A_WeaponOffset(0,40,WOF_INTERPOLATE);
		GLAF A 1 A_WeaponOffset(0,43,WOF_INTERPOLATE);
		GLAF B 1 A_WeaponOffset(0,40,WOF_INTERPOLATE);
		GLAF B 1 A_WeaponOffset(0,36,WOF_INTERPOLATE);
		GLAF B 1 A_WeaponOffset(0,36,WOF_INTERPOLATE);
		GLAG A 2 A_WeaponOffset(0,32,WOF_INTERPOLATE);
		GLAG C 1 A_WeaponOffset(0,32,WOF_INTERPOLATE);
		GLAG C 1 A_WeaponOffset(1,33,WOF_INTERPOLATE);
		GLAG D 1 A_WeaponOffset(3,35,WOF_INTERPOLATE);
		GLAG D 1 A_WeaponOffset(6,39,WOF_INTERPOLATE);
		GLAG D 1 A_WeaponOffset(10,42,WOF_INTERPOLATE);
		GLAG C 0
		{
		A_PlaySound("NadeReload1",1);
		A_SpawnItemEx ("NadeCasing",cos(pitch)*4 - sin(pitch)*12,0,28-(sin(pitch)*4),-4,frandom(-6,-10),-sin(pitch)*frandom(10,14),0);
		}
		GLAG E 1 A_WeaponOffset(15,47,WOF_INTERPOLATE);
		GLAG E 1 A_WeaponOffset(19,51,WOF_INTERPOLATE);
		GLAG E 1 A_WeaponOffset(22,54,WOF_INTERPOLATE);
		GLAG F 1 A_WeaponOffset(24,56,WOF_INTERPOLATE);
		GLAG F 2 A_WeaponOffset(25,57,WOF_INTERPOLATE);
		GLAG F 2 A_WeaponOffset(25,57,WOF_INTERPOLATE);
		GLAG C 0 A_PlaySound("NadeReload2",1);
		GLAG G 2 A_WeaponOffset(25,57,WOF_INTERPOLATE);
		GLAG G 1 A_WeaponOffset(25,57,WOF_INTERPOLATE);
		GLAG G 1 A_WeaponOffset(28,60,WOF_INTERPOLATE);
		GLAG H 1 A_WeaponOffset(32,64,WOF_INTERPOLATE);
		GLAG C 0 A_PlaySound("NadeReload3",1);
		GLAG H 1 A_WeaponOffset(36,68,WOF_INTERPOLATE);
		GLAG H 1 A_WeaponOffset(32,64,WOF_INTERPOLATE);
		GLAG F 2 A_WeaponOffset(28,60,WOF_INTERPOLATE);
		GLAG F 2 A_WeaponOffset(25,57,WOF_INTERPOLATE);
		GLAG F 1 A_WeaponOffset(24,56,WOF_INTERPOLATE);
		GLAG E 1 A_WeaponOffset(22,54,WOF_INTERPOLATE);
		GLAG E 1 A_WeaponOffset(19,51,WOF_INTERPOLATE);
		GLAG E 1 A_WeaponOffset(15,47,WOF_INTERPOLATE);
		GLAG C 0 A_PlaySound("NadeReload4",1);
		GLAG D 1 A_WeaponOffset(10,42,WOF_INTERPOLATE);
		GLAG D 1 A_WeaponOffset(6,39,WOF_INTERPOLATE);
		GLAG D 1 A_WeaponOffset(3,35,WOF_INTERPOLATE);
		GLAG C 1 A_WeaponOffset(1,33,WOF_INTERPOLATE);
		GLAG C 1 A_WeaponOffset(0,32,WOF_INTERPOLATE);
		GLAG A 4 A_WeaponOffset(0,32,WOF_INTERPOLATE);
		Goto Ready;
	Spawn:
		GLAU A -1;
		Stop;
	Reload:
		TNT1 A 0
		{
			A_ChangeAmmoType();
			if (invoker.UsingSuperAmmo)
			{
				A_SetInventory("UsingPhosphor", 1);
			} else {
				A_SetInventory("UsingPhosphor", 0);
			}
		}
		GLAG A 15 A_WeaponReady();
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
		TNT1 A 1 A_SetPitch(pitch - 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 3, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 2, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.00625, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.025, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0125, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.00625, SPF_INTERPOLATE);
		Stop;
	}
}

Class ClusterGrenade:Ammo
{
	Default{
		Inventory.Amount 2;
		Inventory.MaxAmount 30;
		Ammo.Backpackamount 2;
		Ammo.BackpackMaxAmount 60;
		Inventory.Icon "NADAA0";
		Inventory.PickupMessage "A few cluster grenades.";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		NADA A -1;
		Stop;
	}
}

Class PhosphorGrenade:Ammo
{
	Default{
		Inventory.Amount 2;
		Inventory.MaxAmount 20;
		Ammo.Backpackamount 0;
		Ammo.BackpackMaxAmount 40;
		Inventory.Icon "NADAFA0";
		Inventory.PickupMessage "A few phosphorous grenades.";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		NADA A -1;
		Stop;
	}
}

Class ClusterProj:Actor
{
	Default{
		Radius 7;
		Height 5;
		Speed 40;
		DamageFunction (50);
		Projectile;
		Alpha 0.75;
		BounceType "Hexen";
		BounceCount 3;
		BounceFactor 0.4;
		WallBounceFactor 0.4;
		BounceSound "NadeBounce";
		gravity 0.5;
		reactiontime 35;
		scale 1.5;
		-NOGRAVITY
		DeathSound "weapons/rocklx";
		Obituary "%o got blown by %k";
	}
	States
	{
	Spawn:	
		GRND A 1 bright A_Countdown();
		Loop;
	Death:
		MISL B 0
		{
			int angle = -180;
			for (angle; angle < 180; angle = angle + 30) 
			{
				A_SpawnProjectile("GrenadeCluster", 0, 0, frandom(angle+25,angle-25), CMF_AIMDIRECTION|CMF_TRACKOWNER, frandom(-30,-90));
			}
			A_SetScale(1,1);
		}
		MISL B 6 bright
		{
		A_Explode((128), 128);
		A_SetGravity(0);
		}
		MISL C 4 bright;
		MISL D 2 bright;
		Stop;
	}
}

Class GrenadeCluster:Actor
{
	Default{
		Radius 3;
		Height 3;
		Speed 6;
		DamageFunction (0);
		Projectile;
		Alpha 0.75;
		BounceType "Hexen";
		BounceCount 3;
		BounceFactor 0.75;
		WallBounceFactor 0.75;
		BounceSound "NadeBounce";
		reactiontime 30;
		gravity 0.5;
		scale 0.40;
		-NOGRAVITY
		+BOUNCEONACTORS
		+THRUACTORS
		Obituary "%o got blown by %k";
	}
	States
	{
	Spawn:	
		CLUS A 1 bright A_Countdown();
		Loop;
	Death:
		MISL B 0
		{
		A_PlaySound("weapons/rocklx", 0, 0.25);
		A_SetGravity(0);
		A_SetScale(0.8,0.8);
		}
		MISL B 6 bright A_Explode((64), 140);
		MISL C 4 bright;
		MISL D 2 bright;
		Stop;
	}
}

Class PhosphorProj : ClusterProj
{
	States
	{
	Spawn:	
		GRND A 1 bright A_Countdown();
		Loop;
	Death:
		MISL B 0
		{
			int angle = -180;
			for (angle; angle < 180; angle = angle + 20) 
			{
				A_SpawnProjectile("PhosphorCluster", 0, 0, frandom(angle+5,angle-5), CMF_AIMDIRECTION|CMF_TRACKOWNER, frandom(-60,-90));
			}
		}
		MISL B 6 bright
		{
		A_Explode((256), 128);
		A_SpawnProjectile("PhosphorFlame",0,0,0,CMF_TRACKOWNER);
		A_SetGravity(0);
		}
		MISL C 4 bright;
		MISL D 2 bright;
		Stop;
	}
}

Class PhosphorCluster:Actor
{
	Default{
		Radius 7;
		Height 5;
		DamageFunction (10);
		Projectile;
		Speed 10;
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
		FRFX A 1 Bright Light("flameprojlight") A_SpawnItemEx("PhosphorClusterTrail");
		Loop;
	Death:
		FRFX B 1 bright A_NoGravity();
		FRFX C 1 bright;
		TNT1 A 0 A_SpawnProjectile("PhosphorFlame",0,0,0,CMF_TRACKOWNER);
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

Class PhosphorClusterTrail:DBShotTrail
{
	Default{
		Scale 1.5;
	}
}
	
Class PhosphorFlame : Actor
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
		A_Explode((2),32,1);
		}
		FLME A 1 Bright Light("flamelight")
		{
		A_SetScale(0.4);
		A_Explode((2),32,1);
		}
		FLME B 1 Bright Light("flamelight")
		{
		A_SetScale(0.6);
		A_Explode((2),32,1);
		}
		FLME B 1 Bright Light("flamelight")
		{
		A_SetScale(0.8);
		A_Explode((2),32,1);
		}
		FLME C 1 Bright Light("flamelight")
		{
		A_SetScale(1);
		A_Explode((2),32,1);
		}
		FLME C 1 Light("flamelight") A_Explode((2),32,1);
		FLME DEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((2),32,1);
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


Class UsingPhosphor:Inventory { Default { Inventory.MaxAmount 1; +INVENTORY.IGNORESKILL; } }