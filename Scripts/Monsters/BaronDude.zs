//Baron of Hell and Hell Knight aren't that different except for being slightly faster.

Class BaronDude:DMonster replaces BaronOfHell
{
	Default {
		Health 800;
		Speed 8;
		Height 64;
		Mass 1000;
		PainChance 50;
		SeeSound "baron/sight";
		PainSound "baron/pain";
		DeathSound "baron/death";
		ActiveSound "baron/active";
		Obituary "$OB_BARON";
		HitObituary "$OB_BARONHIT";
		DamageFactor "BaronDmg", 0;
		PainChance "BaronDmg", 0;
		bloodcolor "green";
		DMonster.BludColor 2;
		Monster;
		}
	States
  {
	Spawn:
		BOSS AB 10 A_Look;
		Loop;
	See:
		BOSS AABBCCDD 2 A_Chase;
		Loop;
	Melee:
		BOSS EF 4 A_FaceTarget;
		BOSS G 4 A_CustomMeleeAttack(15, "baron/melee", "", "Melee", true); 
	Missile:
		BOSS EF 4 A_FaceTarget;
		BOSS G 4 A_SpawnProjectile("BarBall", 33.0, 9, frandom(1,-1),CMF_OFFSETPITCH,frandom(1,-1));
		Goto See;
	Pain:
		BOSS H 2;
		BOSS H 2 A_Pain;
		Goto See;
	Death:
		BOSS I 8;
		BOSS J 8 A_Scream;
		BOSS K 8;
		BOSS L 8 A_NoBlocking;
		BOSS MN 8;
		BOSS O -1 A_BossDeath;
		Stop;
	Raise:
		BOSS O 8;
		BOSS NMLKJI 8;
		Goto See;
  }
}

Class HellNite:BaronDude replaces HellKnight
{
	Default {
	Health 600;
	SeeSound "knight/sight";
	ActiveSound "knight/active";
	PainSound "knight/pain";
	DeathSound "knight/death";
	Obituary "%o was deaded by a Hell Knight.";
	}
	States
	{
	Spawn:
		BOS2 AB 10 A_Look;
		Loop;
	See:
		BOS2 AABBCCDD 2 A_Chase;
		Loop;
	Melee:
		BOS2 EF 4 A_FaceTarget;
		BOS2 G 4 A_CustomMeleeAttack(15, "baron/melee", "", "Melee", true); 
	Missile:
		BOS2 EF 4 A_FaceTarget;
		BOS2 G 4 A_SpawnProjectile("BarBall", 33.0, 9, frandom(1,-1),CMF_OFFSETPITCH,frandom(1,-1));
		Goto See;
	Pain:
		BOS2 H 2;
		BOS2 H 2 A_Pain;
		Goto See;
	Death:
		BOS2 I 8;
		BOS2 J 8 A_Scream;
		BOS2 K 8;
		BOS2 L 8 A_NoBlocking;
		BOS2 MN 8;
		BOS2 O -1 A_BossDeath;
		Stop;
	Raise:
		BOS2 O 8;
		BOS2 NMLKJI 8;
		Goto See;
	}
}

Class BarBall:BaronBall
{
	Default{
	speed 25;
	DamageFunction (24);
	DamageType("BaronDmg");
	Decal "BaronScorch";
	}
}
	