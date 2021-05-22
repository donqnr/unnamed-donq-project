Class RailGun:DWeapon
{
	Default{
		Weapon.Selectionorder 320;
		Weapon.AmmoType1 "RailSlugs";
		Weapon.SlotNumber 6;
		Weapon.AmmoUse1 0;
		Weapon.AmmoGive1 2;
		DWeapon.NormalProj "RailShot";
		DWeapon.RecoilMultY 1.25;
		DWeapon.RecoilMultX 0.15;
		Inventory.PickupMessage "Railgun (Slot 6)";
		Obituary "%o was decimated with %k's Rail Gun.";
		AttackSound "RailGunFire";
		+Weapon.NOAUTOFIRE;
		+EXTREMEDEATH
		+Weapon.Ammo_Optional;
		+Weapon.Alt_Ammo_Optional;
	}
	States
	{
	Ready:
		RLGN A 1 
		{
		A_WeaponReady();
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
		RLGN A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		RLGN A 0 A_JumpIf(CountInv("RailSlugs") < 1, "DryFire");
		RLGN B 1 
		{
		A_FireBoolts(1, 0, 0, 1);
		A_Overlay(2,"Recoil");
		A_Overlay(3,"RecoilX");
		A_ResetSway();
		}
		RLGN B 1 A_WeaponOffset(0, 3,WOF_ADD);
		RLGN B 1 A_WeaponOffset(0, 5,WOF_ADD);
		RLGN C 1 A_WeaponOffset(0, 7,WOF_ADD);
		RLGN C 1 A_WeaponOffset(0, 5,WOF_ADD);
		RLGN C 1 A_WeaponOffset(0, 2,WOF_ADD);
		RLGN C 1 A_WeaponOffset(0, 1,WOF_ADD);
		RLGN A 70 A_WeaponOffset(0, 0,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -1,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -2,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -7,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -9,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -3,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -1,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -0,WOF_ADD);
		RLGN A 1 A_WeaponOffset(0, -0,WOF_ADD);
		Goto Ready;
	Spawn:
		RLGN P -1;
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
		TNT1 A 1 A_SetPitch(pitch - 2 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1.75 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1.5 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 1 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.75 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.50 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.125 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch - 0.0625 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 1.0 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.75 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.5 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.25 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.125 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		TNT1 A 1 A_SetPitch(pitch + 0.0625 * Invoker.RecoilMultY, SPF_INTERPOLATE);
		Stop;
	RecoilX:
		TNT1 A 1 A_SetAngle(angle - 2 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.9 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.8 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.7 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.6 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.5 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.4 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.3 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.2 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1.1 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 1 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.9 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.8 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.7 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.6 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.5 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.4 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.3 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.2 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.1 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.05 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.025 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.0125 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		TNT1 A 1 A_SetAngle(angle - 0.00625 * Invoker.RecoilMultX, SPF_INTERPOLATE);
		Stop;
	}
}

Class RailShot : FastProjectile
{
	Default{
		MissileType "RailShotTrail";
		RenderStyle "Add";
		Projectile;
		Radius 5;
		Height 5;
		Scale 1;
		missileheight 8;
		Speed 240;
		DamageFunction (280);
		SeeSound "RailGunFire";
		Decal "PlasmaScorch";
		+SPAWNSOUNDSOURCE
		+EXTREMEDEATH
		+RIPPER
	}
	States
	{
	Spawn:
		RGSH ABC 3 Bright;
		Loop;
	Death:
	XDeath:
		PLSE A 0 A_SetScale(1);
		PLSE AAAABBBBCCCDDEE 1 bright;
		Stop;
	}
}

Class RailShotTrail:BooletTrail
{
	Default{
	Scale 0.25;
	RenderStyle "Add";
	}
	States
	{
		Spawn:
		PLSE A 1 bright;
		PLSE AA 0 bright A_SpawnItemEx("RailTrailParticle", 0, 0, 0, frandom(0.20,-0.20),frandom(0.20,-0.20),frandom(0.20,-0.20));
		PLSE AAAABBBBCCCDDDEE 1 bright;
		Stop;
	}
}

Class RailTrailParticle:Actor
{
	Default{
		RenderStyle "Add";
		gravity 0;
		Scale 0.07;
		}
	States
	{
		Spawn:
		PLSS ABAB 3 bright;
		FadeOut:
		PLSS AB 3 bright A_FadeOut(0.05);
		loop;
	}
}

Class RailSlugs:Ammo
{
	Default{
		radius 8;
		Inventory.Amount 2;
		Inventory.MaxAmount 20;
		Ammo.Backpackamount 2;
		Ammo.BackpackMaxAmount 40;
		Inventory.Icon "IONAA0";
		Inventory.PickupMessage "Railgun Slugs";
		Inventory.PickupSound "ammopickup";
	}
	States
	{
	Spawn:
		IONA AAAAAABBCCDDCCBBAAAAAA 1;
		Loop;
	}
}
		