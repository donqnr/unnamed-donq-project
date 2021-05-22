//Shotgun Guy, like all enemies with firearms now fires fast projectiles rather than hitscan.

Class SGDude:DMonster replaces ShotgunGuy
{
	Default{
		Health 80;
		GibHealth 40;
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
		Obituary "Some dude with a shotgun shot %o with his shotgun."; 
		DropItem "BuckShot";
		MONSTER;
		+DOHARMSPECIES;
		}
	States
	{
	Spawn: 
		SPOS AB 10 A_Look(); 
		Loop;
	See:
		SPOS E 0 A_CheckRange(1028,"OutOfRange");
		SPOS AA 2 A_Chase();
		SPOS A 0 A_PlaySound("step1", 7);
		SPOS BB 2 A_Chase();
		SPOS CC 2 A_Chase();
		SPOS A 0 A_PlaySound("step2", 7);
		SPOS DD 2 A_Chase();
		loop;
	OutOfRange:
		SPOS AA 2 A_Chase(null,null);
		SPOS A 0 A_PlaySound("step1", 7);
		SPOS BB 2 A_Chase(null,null);
		SPOS CC 2 A_Chase(null,null);
		SPOS A 0 A_PlaySound("step2", 7);
		SPOS DD 2 A_Chase(null,null);
		goto see;
	Missile:
		SPOS E 10 A_FaceTarget(0,0);
		SPOS F 2 bright
		{
			int i = 0;
			for (i; i < 7; i++)
			{
				A_SpawnProjectile("SGDudeShot", 33.0, 9, frandom(2.2,-2.2),CMF_OFFSETPITCH,frandom(3,-3));
			}
		}
		SPOS E 5 A_PlaySound("ShotgunPump", 7);
		SPOS E 5 A_SpawnItemEx("ShotgunCasing",-2,0,28,0,frandom(-8,-12),0,frandom(-170,-190));
		Goto See;
	Pain: 
		SPOS G 2;
		SPOS G 2 A_Pain();
		Goto See;
	Death: 
		SPOS H 5;
		SPOS I 5 A_Scream();
		SPOS J 5 A_Fall();
		SPOS K 5;
		SPOS L -1;
		stop;
	XDeath:
		SPOS M 5;
		SPOS N 5 A_XScream();
		SPOS N 5 A_Fall();
		SPOS P 5;
		SPOS QRST 5;
		SPOS U -1;
		Stop;
	Raise: 
		SPOS KJIH 5;
		Goto See;
	}
}

Class SGDudeShot:Boolet
{
	Default{
		DamageFunction(6);
		SeeSound("ShotgunFire");
		Speed 60;
	}
}

Class SGDudeCorpse:Actor
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
		SPOS H 5;
		SPOS I 5 A_Scream();
		SPOS J 5;
		SPOS K 5 A_SetSize(20,10);
		SPOS L 1;
	Corps:
		SPOS L 1;
		loop;
	Death:
		SPOS O 5 A_XScream();
		SPOS P 5;
		SPOS QRST 5; 
		SPOS U -1;
		Stop;
	}
}