Class ClusterFucker6000:DWeapon
{
	Default
	{
		Weapon.Selectionorder 320;
		Weapon.AmmoType1 "CFCell";
		Weapon.SlotNumber 8;
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 1;
		Inventory.PickupMessage "ClusterFucker 6000! (Slot 8)";
		Obituary "%o couldn't escape %k's ClusterFucker 6000.";
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "CFBall";
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;	
	}
	States
	{
	Ready:
		CLFK A 1 
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1.5,0.75);
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
		CLFK A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		CLFK A 0 A_JumpIf(CountInv("CFCell") < 1, "DryFire");
		CLFK A 0 A_PlaySound("CFCharge");
		CLFK AAAAAAAAAAAABBBBBBBBBBBBCCCCCCCCCDDDDDDDDDEEEEEEFFFFFFGGGHHH 1 A_WeaponSway(30,10,0.75,2);
		Goto Hold;
	Hold:
		CLFK H 1;
		CLFK H 1 A_ReFire("Hold");
		Goto FireEnd;
	FireEnd:
		CLFF A 2 A_FireBoolts(1,0,0,1);
		CLFF B 1 A_WeaponOffset(0, 34,WOF_INTERPOLATE);
		CLFF B 1 A_WeaponOffset(0, 38,WOF_INTERPOLATE);
		CLFF C 1 A_WeaponOffset(0, 44,WOF_INTERPOLATE);
		CLFF C 1 A_WeaponOffset(0, 52,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 58,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 62,WOF_INTERPOLATE);
		CLFK A 15 A_WeaponOffset(0, 64,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 63,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 61,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 58,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 54,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 49,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 43,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 38,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 34,WOF_INTERPOLATE);
		CLFK A 1 A_WeaponOffset(0, 33,WOF_INTERPOLATE);
		Goto Ready;
	Spawn:
		BFUG A -1;
		Stop;
	RecoilAnim:
		TNT1 B 0 A_OverlayFlags(2,PSPF_ADDWEAPON,true);
		CLFK B 1 A_OverlayOffset(1,0,32,WOF_INTERPOLATE);
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

Class CFCell:Ammo
{
	Default{
		Inventory.Amount 1;
		Inventory.MaxAmount 4;
		Ammo.Backpackamount 1;
		Ammo.BackpackMaxAmount 8;
		Inventory.Icon "CFCLA0";
		Inventory.PickupMessage "Clusterfucker 6000 charge";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		CFCL A -1;
		Stop;
	}
}

Class CFBall:Actor
{
	Default{
		Radius 7;
		Height 3;
		Speed 14;
		DamageFunction (200);
		Projectile;
		Alpha 0.75;
		Scale 0.7;
		RenderStyle "Add";
		SeeSound "CFFire";
		DeathSound "CFExplode";
		Obituary "%o got deaded by %k";
		+SKYEXPLODE
	}
	States
	{
	Spawn:
		BFS1 AB 2 Bright light("CFLight");
		Loop;
	Death:
		BFE1 A 6 bright
		{
			A_Explode(200, (200));
			int h = -180;
			int v = -180;
			for (h; h < 180; h = h + 45) 
			{
				for (v = -180; v < 180; v = v + 45)
				{
					A_SpawnProjectile("CFCluster", 0, 0, random(h-80,h+80), CMF_AIMDIRECTION|CMF_TRACKOWNER, random(v-80,v+80));
				}
			}
		}
		BFE1 B 6 bright;
		BFE1 C 4 bright;
		BFE1 DED 2 bright;
		Stop;
	}
}

Class CFCluster:Actor
{
	Default{
	Radius 13;
	Height 8;
	Speed 25;
	DamageFunction (0);
	Scale 1;
	reactiontime 35;
	Alpha 0.75;
	RenderStyle "Add";
	+THRUACTORS
	+SKYEXPLODE
	Projectile;
	}
	States
	{
	Spawn:
		APLS AB 4 Bright A_Countdown();
		Loop;
	Death:
		APBX A 0 bright
		{
			int h = -180;
			int v = -180;
			for (h; h < 180; h = h + 90) 
			{
				for (v = -180; v < 180; v = v + 90)
				{
					A_SpawnProjectile("CFCluster2", 0, 0, random(h-80,h+80), CMF_AIMDIRECTION|CMF_TRACKOWNER, random(v-80,v+80));
				}
			}
		}
		APBX ABCDE 3 Bright;
		Stop;
	}
}

Class CFCluster2:Actor
{
	Default{
	Radius 6;
	Height 5;
	Speed 80;
	BounceType "Doom";
	BounceFactor 1;
	DamageFunction (40);
	Scale 0.2;
	Alpha 0.75;
	RenderStyle "Add";
	reactiontime 35;
	gravity 0.5;
	-NOGRAVITY;
	Projectile;
	}
	States
	{
	Spawn:
		APLS AB 4 Bright light("CFCLight") A_Countdown();
		Loop;
	Death:
		APBX A 0 A_PlaySound("weapons/plasmax", 4, 0.1);
		APBX ABCDE 3 Bright;
		Stop;
	}
}