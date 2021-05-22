//Very weak zombie with an SMG, fires low damage bullets at you at a high firerate.

Class SMGDude:DMonster
{
	Default{
		Health 50;
		GibHealth 50;
		Speed 8;
		Radius 20;
		Height 56;
		PainThreshold 0;
		PainChance 180;
		Monster;
		SeeSound "grunt/sight";
		AttackSound "grunt/attack";
		PainSound "grunt/pain";
		DeathSound "grunt/death";
		ActiveSound "grunt/active";
		Obituary "%o was shot by some asshole with an submachine gun."; 
		DropItem "Ninemm";
		+DOHARMSPECIES;
		}
	States
	{
	Spawn: 
		EXTR AB 10 A_Look(); 
		Loop;
	See:
		EXTR A 0 A_CheckRange(750,"OutOfRange");
		EXTR AA 2 A_Chase();
		EXTR A 0 A_PlaySound("step1", 7);
		EXTR BB 2 A_Chase();
		EXTR CC 2 A_Chase();
		EXTR A 0 A_PlaySound("step2", 7);
		EXTR DD 2 A_Chase();
		loop;
	OutOfRange:
		EXTR AA 2 A_Chase(null,null);
		EXTR A 0 A_PlaySound("step1", 7);
		EXTR BB 2 A_Chase(null,null);
		EXTR CC 2 A_Chase(null,null);
		EXTR A 0 A_PlaySound("step2", 7);
		EXTR DD 2 A_Chase(null,null);
		goto See;
	Missile:
		EXTR E 10 A_FaceTarget();
		EXTR E 0 A_CheckRange(1500,"See");
		EXTR F 1 
		{
		A_SpawnProjectile("SMGDudeShot", 46.0, 0, frandom(-4,4),CMF_OFFSETPITCH,frandom(4,-4));
		A_SpawnItemEx("PistolCasing",-2,0,48,0,frandom(-8,-12),0,frandom(-170,-190));
		}
		EXTR E 1 A_MonsterRefire(130, "See");
		Goto Missile+2;
	Pain: 
		EXTR G 2;
		EXTR G 2 A_Pain();
		Goto See;
	Death:
		EXTR I 5 ;
		EXTR A 0 A_Jump(127, "Death2");
		EXTR J 5 A_Scream();
		EXTR K 4 A_Fall();
		EXTR L 3;
		EXTR L 1;
		EXTR M -1;
		Stop;
	Death2:
		EXTR N 5 A_Scream();
		EXTR OP 4;
		EXTR P 3 A_Fall();
		EXTR P 1;
		EXTR Q -1;
		Stop;
	XDeath:
		EXTR R 3 A_XScream();
		EXTR S 3 A_Fall();
		POSS O 3 ;
		POSS P 3;
		POSS QRST 3; 
		POSS U -1;
		Stop;
	Raise: 
		EXTR MLKJI 5;
		Goto See;
	}
}

Class SMGDudeShot:Boolet
{
	Default{
		DamageFunction(3);
		SeeSound "PistolFire";
		Speed 70;
	}
}

Class SMGDudeCorpse:Actor
{
	Default{
		Health 300;
		Radius 20;
		Height 56;
		Mass 250;
		DeathSound "grunt/death";
		+SHOOTABLE;
		+NOTAUTOAIMED;
		+CORPSE;
		+ISMONSTER;
	}
	States
	{
	Spawn:
		EXTR I 5 ;
		EXTR A 0 A_Jump(127, "Spawn2");
		EXTR J 5 A_Scream();
		EXTR K 4;
		EXTR L 3;
		EXTR L 1 A_SetSize(20,10);
		EXTR M 1;
	Ded:
		EXTR M 1;
		loop;
	Spawn2:
		EXTR N 5;
		EXTR OP 4;
		EXTR P 3;
		EXTR P 1 A_SetSize(20,10);
		EXTR Q 1;
	Ded2:
		EXTR Q 1;
		loop;
	Death:
	XDeath:
		POSS O 3  A_XScream();
		POSS P 3;
		POSS QRST 3; 
		POSS U -1;
		Stop;
	}
}

Class SMGDudeShotSound:Actor
{
	Default{
	}
	States
	{
	Spawn:
		TNT1 A 1 NoDelay A_PlaySound("PistolFire",4,1,0,1);
		Stop;
	}
}
