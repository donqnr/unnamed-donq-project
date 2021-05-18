//Basically Chaingun Guy on steroids. Getting caught by his stream of bullets will be very painful.

Class MinigunDude:DMonster
{
	Default{
		Health 100;
		GibHealth 50;
		Speed 5;
		Radius 20;
		Height 56;
		PainThreshold 0;
		PainChance 180;
		SeeSound "grunt/sight";
		AttackSound "grunt/attack";
		PainSound "grunt/pain";
		DeathSound "grunt/death";
		ActiveSound "grunt/active";
		Obituary "%o got fucking torn to shreds by a minigunner."; 
		DropItem "FiveFiveSix";
		MONSTER;
		+DOHARMSPECIES;
		}
	States
	{
	Spawn: 
		CPS2 AB 10 A_Look(); 
		Loop;
	See:
		EXTR A 0 A_CheckRange(1600,"OutOfRange");
		CPS2 AA 2 A_Chase();
		CPS2 A 0 A_PlaySound("step1", 7);
		CPS2 BB 2 A_Chase();
		CPS2 CC 2 A_Chase();
		CPS2 A 0 A_PlaySound("step2", 7);
		CPS2 DD 2 A_Chase();
		loop;
	OutOfRange:
		CPS2 AA 2 A_Chase(null,null);
		CPS2 A 0 A_PlaySound("step1", 7);
		CPS2 BB 2 A_Chase(null,null);
		CPS2 CC 2 A_Chase(null,null);
		CPS2 A 0 A_PlaySound("step2", 7);
		CPS2 DD 2 A_Chase(null,null);
		goto see;
	Missile:
		CPS2 A 0 A_PlaySound("MinigunWindUp", 0, 1, false, 0.2);
		CPS2 E 35 A_FaceTarget();
		CPS2 F 1 
		{
			A_PlaySound("MinigunFire", 4, 1, true);
			int i = 0;
			for(i; i < 2; i++)
			{
				A_SpawnProjectile("MiniDudeShot", 35.5, 9, frandom(-3,3),CMF_OFFSETPITCH,frandom(2.4,-2.4));
				A_SpawnItemEx("MinigunCasing",-2,0,28,0,frandom(-8,-12),0,frandom(-170,-190));
			}
		}
		CPS2 E 1 A_MonsterRefire(180, "WindDown");
		Goto Missile+2;
	Pain: 
		CPS2 G 2;
		CPS2 G 2 A_Pain();
		Goto See;
	Death: 
		CPS2 H 5;
		CPS2 I 5 A_Scream();
		CPS2 J 5 A_Fall();
		CPS2 KLMNO 5;
		CPS2 P -1;
		stop;
	XDeath:
		CPS2 Q 5 A_StopSound(4);
		CPS2 R 5 A_XScream();
		CPS2 S 5 A_Fall();
		CPS2 TUVW 5;
		CPS2 X -1;
		Stop;
	Raise: 
		CPS2 P 5;
		CPS2 ONMLKJIH 5;
		Goto See;
	WindDown:
		CPS2 E 15 A_PlaySound("MinigunWindDown");
		Goto See;
	}
}

Class MiniDudeShot:Boolet
{
	Default{
		DamageFunction(3);
		Speed 90;
	}
}

Class MiniDudeCorpse:Actor
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
		CPS2 H 5;
		CPS2 I 5 A_Scream();
		CPS2 J 5 A_SetSize(20,10);
		CPS2 KLMNO 5;
		CPS2 P 1;
	Corps:
		CPS2 P 1;
		loop;
	Death:
		CPS2 T 5 A_XScream();
		CPS2 UVW 5;
		CPS2 X -1;
		Stop;
	}
}