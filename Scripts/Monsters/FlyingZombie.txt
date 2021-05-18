// Zombie in an aircraft thing, kinda shit needs more work

Class FlyingZombie:Actor
{
	Default{
		Health 300;
		Speed 10;
		Radius 40;
		Height 56;
		Mass 400;
		+FLOAT;
		+NOGRAVITY;
		SeeSound "grunt/sight";
		AttackSound "grunt/attack";
		PainSound "grunt/pain";
		DeathSound "grunt/death";
		ActiveSound "grunt/active";
		Obituary "%o was gunned down by a zombie in an aircraft."; 
		MONSTER;
		}
	States
	{
	Spawn: 
		FLYC A 1 A_Look();
		Loop;
	See:
		FLYC A 1 A_Chase();
		loop;
	Missile:
		FLYC AA 1
		{
		A_FaceTarget();
		A_Chase(null,null,CHF_NORANDOMTURN);
		}
		FLYC B 1
		{
		A_Chase(null,null,CHF_NORANDOMTURN);
		A_SpawnProjectile("FZShot", 0, 10, frandom(-2.4,2.4),CMF_OFFSETPITCH,frandom(2.4,-2.4));
		A_SpawnProjectile("FZShot", 0, -10, frandom(-2.4,2.4),CMF_OFFSETPITCH,frandom(2.4,-2.4));
		}
		FLYC BCC 1
		{
		A_Chase(null,null,CHF_NORANDOMTURN);
		}
		FLYC B 1
		{
		A_Chase(null,null,CHF_NORANDOMTURN);
//		A_SpawnProjectile("FZShot", 0, 10, frandom(-2.4,2.4),CMF_OFFSETPITCH,frandom(2.4,-2.4));
//		A_SpawnProjectile("FZShot", 0, -10, frandom(-2.4,2.4),CMF_OFFSETPITCH,frandom(2.4,-2.4));
		}
		FLYC BCC 1
		{
		A_Chase(null,null,CHF_NORANDOMTURN);
		}
		Goto See;
	Pain: 
		Goto See;
	Death:
		FLYC A 5 { A_Scream(); A_StopSound(5); }
		FLYC A 5 A_Fall;
		FLYC A -1;
		Stop;
	Crash:
		EXPL ABCDEFGHIJKLMNOPQRSTU 4 Bright;
		TNT1 A -1;
		Stop;
	}
}
Class FZShot:DoomImpBall
{
	Default {
	scale 0.5;
	speed 30;
	DamageFunction (7);
	}
}