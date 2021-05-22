//Zombie with an assault rifle, shoots 3-round bursts at you.

Class ARDude:DMonster replaces Zombieman
{
	Default{
		Health 80;
		GibHealth 50;
		Speed 6;
		Radius 20;
		Height 56;
		PainThreshold 0;
		PainChance 180;
		SeeSound "grunt/sight";
		AttackSound "grunt/attack";
		PainSound "grunt/pain";
		DeathSound "grunt/death";
		ActiveSound "grunt/active";
		Obituary "%o was shot by some asshole with an assault rifle."; 
		AttackSound "weapons/pistol";
		DropItem "SevenSixTwo";
		MONSTER;
		+DOHARMSPECIES;
		}
	States
	{
	Spawn: 
		RFTR AB 10 A_Look(); 
		Loop;
	See:
		RFTR A 0 A_CheckRange(1600,"OutOfRange");
		RFTR AA 2 A_Chase();
		RFTR A 0 A_PlaySound("step1", 7);
		RFTR BB 2 A_Chase();
		RFTR CC 2 A_Chase();
		RFTR A 0 A_PlaySound("step2", 7);
		RFTR DD 2 A_Chase();
		loop;
	OutOfRange:
		RFTR AA 2 A_Chase(null,null);
		RFTR A 0 A_PlaySound("step1", 7);
		RFTR BB 2 A_Chase(null,null);
		RFTR CC 2 A_Chase(null,null);
		RFTR A 0 A_PlaySound("step2", 7);
		RFTR DD 2 A_Chase(null,null);
		goto See;
	Missile:
		RFTR E 5 A_FaceTarget(0,0);
		RFTR F 2 bright 
		{
		A_SpawnProjectile("ARDudeShot", 33.0, 9,frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.8,-1.8));
		A_SpawnItemEx("MachineGunCasing",-2,0,28,0,frandom(-8,-12),0,frandom(-170,-190));
		}
		RFTR E 2;
		RFTR F 2 bright 
		{
		A_SpawnProjectile("ARDudeShot", 33.0, 9,frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.8,-1.8));
		A_SpawnItemEx("MachineGunCasing",-2,0,28,0,frandom(-8,-12),0,frandom(-170,-190));
		}
		RFTR E 2;
		RFTR F 2 bright 
		{
		A_SpawnProjectile("ARDudeShot", 33.0, 9,frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.8,-1.8));
		A_SpawnItemEx("MachineGunCasing",-2,0,28,0,frandom(-8,-12),0,frandom(-170,-190));
		}
		RFTR E 2;
		RFTR F 2 bright 
		{
		A_SpawnProjectile("ARDudeShot", 33.0, 9,frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.8,-1.8));
		A_SpawnItemEx("MachineGunCasing",-2,0,28,0,frandom(-8,-12),0,frandom(-170,-190));
		}
		Goto See;
	Pain: 
		RFTR G 2;
		RFTR G 2 A_Pain();
		Goto See;
	Death: 
		RFTR H 5;
		RFTR I 5 A_Scream();
		RFTR J 5 A_Fall();
		RFTR K 5;
		RFTR L -1;
		stop;
	XDeath:
		RFTR M 3;
		RFTR N 3 A_XScream();
		RFTR N 3;
		RFTR P 3 A_Fall();
		POSS QRST 3;
		RFTR U -1;
		Stop;
	Raise: 
		RFTR KJIH 5;
		Goto See;
	}
}


Class ARDudeShot:Boolet
{
	Default{
		DamageFunction(7);
		SeeSound("MGFire");
		Speed 90;
	}
}

Class ARDudeCorpse:Actor
{
	Default{
		Health 300;
		Radius 20;
		Height 56;
		Mass 500;
		DeathSound "grunt/death";
		+SHOOTABLE;
		+NOTAUTOAIMED;
	}
	States
	{
	Spawn: 
	Death: 
		RFTR H 5;
		RFTR I 5 A_Scream();
		RFTR J 5;
		RFTR K 5 A_SetSize(20,10);
		RFTR L 1;
	Corps:
		RFTR L 1;
		loop;
	Death:
		POSS O 3 A_XScream();
		POSS P 3;
		POSS QRST 3; 
		POSS U -1;
		Stop;
	}
}