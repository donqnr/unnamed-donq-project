//The Imp is now faster and fires three fireballs in quick succession.

Class ImpDude:DMonster replaces DoomImp
{
	Default{
		Health 70;
		GibHealth 50;
		Radius 20;
		Height 56;
		Mass 100;
		Speed 8;
		PainChance 200;
		Monster;
		+FLOORCLIP;
		DamageFactor "ImpDmg", 0;
		PainChance "ImpDmg", 0;
		SeeSound "imp/sight";
		PainSound "imp/pain";
		DeathSound "imp/death";
		ActiveSound "imp/active";
		HitObituary "$OB_IMPHIT";
		Obituary "%o was burned by an Imp."; 
		+DONTHARMSPECIES
		}
	States
	{
	Spawn:
		TRO4 AB 8 A_Look;
		Loop;
	See:
		TRO4 AABBCCDD 2 A_Chase;
		Loop;
	Melee:
	Missile:
//		TRO4 E 0 A_Jump(120, "Missile2");
		TRO4 E 0 A_CheckRange(2048,"See");
		TRO4 EF 4 A_FaceTarget;
		TRO4 G 3 A_SpawnProjectile("ImpDudeShot", 33.0, 9, random(1,-1),CMF_OFFSETPITCH,random(1,-1));
		TRO4 EF 2 A_FaceTarget;
		TRO4 G 2 A_SpawnProjectile("ImpDudeShot", 33.0, 9, random(1,-1),CMF_OFFSETPITCH,random(1,-1));
		TRO4 EF 2 A_FaceTarget;
		TRO4 G 2 A_SpawnProjectile("ImpDudeShot", 33.0, 9, random(1,-0),CMF_OFFSETPITCH,random(1,-1));
		Goto See;
	Missile2:
		TRO4 EF 8 A_FaceTarget;
		TRO4 G 7
		{
		int i = -8;
		for (i; i < 8; i = i + 4)
			{
			 A_SpawnProjectile("ImpDudeShot", 33.0, 9, i,CMF_OFFSETPITCH, 0);
			}
		}
		Goto See;
	Pain:
		TRO4 H 2;
		TRO4 H 2 A_Pain();
		Goto See;
	Pain.Fire:
		TRO4 H 2;
		TRO4 H 2 A_Pain();
		Goto See;
	Death: 
		TRO4 I 5;
		TRO4 J 5 A_Scream();
		TRO4 K 5;
		TRO4 L 5 A_Fall();
		TRO4 M -1;
		stop;
	XDeath:
		TROO N 5;
		TROO O 5 A_XScream;
		TROO P 5;
		TROO Q 5 A_NoBlocking;
		TROO RST 5;
		TROO U -1;
		Stop;
	Raise:
		TRO4 ML 8;
		TRO4 KJI 6;
		Goto See;
	}
}


Class ImpDudeShot:DoomImpBall
{
	Default{
		DamageFunction(7);
		DamageType("ImpDmg");
		Speed 20;
		Scale 0.7;
		Decal "DoomImpScorch";
	}
}

Class ImpDudeCorpse:Actor
{
	Default{
		Health 300;
		Radius 20;
		Height 56;
		Mass 500;
		DeathSound "imp/death";
		+SHOOTABLE;
		+NOTAUTOAIMED;
	}
	States
	{
	Spawn: 
		TRO4 I 5;
		TRO4 J 5 A_Scream();
		TRO4 K 5;
		TRO4 L 5 A_SetSize(20,10);
		TRO4 M 1;
	Corps:
		TRO4 M 1;
		loop;
	Death:
		TROO O 5 A_XScream();
		TROO P 5;
		TROO QRST 5; 
		TROO U -1;
		Stop;
	}
}