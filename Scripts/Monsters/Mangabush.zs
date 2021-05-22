//Mancubus, but its fireballs now leave flames wherever they hit.

Class Mangabush:DMonster replaces Fatso
{	
	Default {
	Health 600;
	Radius 48;
	Height 64;
	Mass 1000;
	Speed 8;
	PainChance 80;
	Monster;
	+FLOORCLIP;
	+BOSSDEATH	;
	SeeSound "fatso/sight";
	PainSound "fatso/pain";
	DeathSound "fatso/death";
	ActiveSound "fatso/active";
	Obituary "$OB_FATSO";
	DamageFactor "MangabushFlame", 0;
	DamageFactor "MangabushDmg", 0;
	PainChance "MangabushFlame", 0;
	}
	States
	{
	Spawn:
		FATT AB 15 A_Look;
		Loop;
	See:
		FATT AABBCCDDEEFF 3 A_Chase;
		Loop;
	Missile:
		FATT G 10 
		{
		A_FatRaise();
		A_FaceTarget();
		}
		FATT H 10 Bright
		{
			A_SpawnProjectile("MancFireBall", 32, -9, frandom(1.4,-1.4)+15,0,0);
			A_SpawnProjectile("MancFireBall", 32, 9, frandom(1.4,-1.4),0,0);
		}
		FATT IG 5 A_FaceTarget;
		FATT H 10 Bright
		{
			A_SpawnProjectile("MancFireBall", 32, -9, frandom(1.4,-1.4),0,0);
			A_SpawnProjectile("MancFireBall", 32, 9, frandom(1.4,-1.4)-15,0,0);
		}
		Goto See;
	Pain:
		FATT J 3;
		FATT J 3 A_Pain;
		Goto See;
	Death:
		FATT K 6;
		FATT L 6 A_Scream;
		FATT M 6 A_NoBlocking;
		FATT NOPQRS 6;
		FATT T -1 A_BossDeath;
		Stop;
	Raise:
		FATT R 5;
		FATT QPONMLK 5;
		Goto See;
  }
}

Class MancFireball:FatShot
{
	Default {
	DamageFunction (18);
	DamageType "MangabushFlame";
	}
	States
	{
	Spawn:
		MANF AB 4 Bright;
		Loop;
	Death:
		MISL B 0
		{
		A_SpawnProjectile("MancFlame",0);
		for (int angle = 0; angle < 361; angle = angle + 45)
			{
			A_SpawnProjectile("MancFireballCluster", 32.0,0,angle+frandom(2,-2),CMF_TRACKOWNER|CMF_ABSOLUTEPITCH|CMF_ABSOLUTEANGLE,frandom(-25,-50));
			}
		}
		MISL B 8 Bright;
		MISL C 6 Bright;
		MISL D 4 Bright;
		Stop;
		}
	}

Class MancFireballCluster:FlameProj
{
	Default{
		speed 5;
		Damage (0);
		DamageType "MangabushDmg";
	}
	States
	{
	Spawn:
		FRFX A 1 Bright A_SpawnItemEx("FlameProjTrail");
		Loop;
	Death:
		FRFX B 1 bright A_NoGravity();
		FRFX C 1 bright;
		TNT1 A 0 A_SpawnProjectile("MancFlame",0,0,0,CMF_TRACKOWNER);
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

Class MancFlame : Actor
{
	Default{
		Radius 7;
		Height 5;
		Damage (0);
		Projectile;
		Speed 0;
		RenderStyle "Add";
		Alpha 0.6;
		DamageType "MangabushFlame";
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
		A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		}
		FLME A 1 Bright Light("flamelight")
		{
		A_SetScale(0.4);
		A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		}
		FLME B 1 Bright Light("flamelight")
		{
		A_SetScale(0.6);
		A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		}
		FLME B 1 Bright Light("flamelight")
		{
		A_SetScale(0.8);
		A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		}
		FLME C 1 Bright Light("flamelight")
		{
		A_SetScale(1);
		A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		}
		FLME C 1 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME DEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
		FLME ABCDEFGHIJKLMN 2 Bright Light("flamelight") A_Explode((1),32,XF_EXPLICITDAMAGETYPE,0,0,0,0,"","MangabushFlame");
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
	
	
	