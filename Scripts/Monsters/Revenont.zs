//Faster, bit weaker but now fires 2 missiles at once that are faster, but home in less effectively.

Class Revenont:DMonster replaces Revenant
{
	Default{
		radius 18;
		height 58;
		Health 420;
		scale 0.8;
		Mass 500;
		Speed 13;
		PainChance 100;
		Monster;
		MeleeThreshold 196;
		+FLOORCLIP;
		DamageFactor "RevDmg", 0;
		PainChance "RevDmg", 0;
		SeeSound "skeleton/sight";
		PainSound "skeleton/pain";
		DeathSound "skeleton/death";
		ActiveSound "skeleton/active";
		MeleeSound "skeleton/melee";
		HitObituary "%o took a hard bone to his face.";
		Obituary "$OB_UNDEAD";
	}
	States
	{
	Spawn:
		SKEL AB 10 A_Look;
		Loop;
	See:
		SKEL AABBCCDDEEFFAABBCCDDEEFF 2 A_Chase;
		Loop;
	Melee:
		SKEL G 0 A_FaceTarget;
		SKEL G 4 A_SkelWhoosh;
		SKEL H 4 A_FaceTarget;
		SKEL I 4 A_SkelFist;
		Goto See;
	Missile:
		SKEL J 0 Bright A_FaceTarget;
		SKEL J 6 Bright A_FaceTarget;
		SKEL K 3 A_SpawnProjectile("RevSeeker", 50.0, 10, 0,0,0);
		SKEL K 3 A_SpawnProjectile("RevSeeker", 50.0, -10, 0,0,0);
		SKEL K 6 A_FaceTarget;
		Goto See;
	Pain:
		SKEL L 5;
		SKEL L 5 A_Pain;
		Goto See;
	Death:
		SKEL LM 7;
		SKEL N 7 A_Scream;
		SKEL O 7 A_NoBlocking;
		SKEL P 7;
		SKEL Q -1;
		Stop;
	Raise:
		SKEL Q 5;
		SKEL PONML 5;
		Goto See;
	}
}

Class RevSeeker:RevenantTracer
{
	Default {
	radius 8;
	height 6;
	DamageFunction (16);
	DamageType "RevDmg";
	speed 13;
	scale 0.7;
	}
	States
	{
	Spawn:
		FATB AB 2 Bright A_SeekerMissile(8, 8, SMF_PRECISE);
		Loop;
	Death:
		FBXP A 8 Bright;
		FBXP B 6 Bright;
		FBXP C 4 Bright;
		Stop;
	}
}