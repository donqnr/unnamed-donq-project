Class DCacodemon : DMonster replaces Cacodemon
{
	Default 
	{
		Health 500;
		Radius 25;
		Height 50;
		Mass 300;
		Speed 3;
		scale 0.85;
		PainChance 128;
		BloodColor "blue";
		DMonster.BludColor 1;
		Monster;
		+FLOAT;
		+NOGRAVITY;
		DamageFactor "CacoDmg", 0;
		PainChance "CacoDmg", 0;
		SeeSound "caco/sight";
		PainSound "caco/pain";
		DeathSound "caco/death";
		ActiveSound "caco/active";
		Obituary "$OB_CACO";
		HitObituary "$OB_CACOHIT";
	}
	States
	{
	Spawn:
		HEAD A 10 A_Look;
		Loop;
	See:
		HEAD A 1 A_Chase;
		Loop;
	Missile:
		HEAD BC 4 A_FaceTarget;
		HEAD D 4 Bright A_SpawnProjectile("CacoShot", 20.0, 0, 0,CMF_OFFSETPITCH,0);
		Goto See;
	Pain:
		HEAD E 3;
		HEAD E 3 A_Pain;
		HEAD F 6;
		Goto See;
	Death:
		HEAD G 8;
		HEAD H 8 A_Scream;
		HEAD IJ 8;
		HEAD K 8 A_NoBlocking;
		HEAD L -1 A_SetFloorClip;
		Stop;
	Raise:
		HEAD L 8 A_UnSetFloorClip;
		HEAD KJIHG 8;
		Goto See;
	}
}

Class CacoShot:CacodemonBall
{
	Default{
		DamageFunction(17);
		DamageType "CacoDmg";
		Decal "CacoScorch";
	}
}