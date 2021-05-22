Class ShotgunCasing : Actor
{
	Default
	{
		scale 0.5;
		radius 3;
		height 3;
		BounceType "Doom";
		BounceFactor 0.6;
		speed 8;
		Projectile;
		-NOGRAVITY;
		+MOVEWITHSECTOR;
		+ALLOWBOUNCEONACTORS;
		+BOUNCEONACTORS;
		+CLIENTSIDEONLY;
		+FORCEXYBILLBOARD;
	}
	States
	{
	Spawn:
		SGSH ABCD 2;
		Loop;
	Death:
		TNT1 A 0 A_Jump(128,"Death2");
		SGSH B 350;
		Goto FadeOut;
	Death2:
		SGSH D 350;
		Goto FadeOut;
	FadeOut:
		#### # 1 A_FadeOut(0.1);
		Loop;
	}
}

Class DBCasing : ShotgunCasing
{
	States
	{
	Spawn:
		DBSH ABCD 2;
		Loop;
	Death:
		TNT1 A 0 A_Jump(128,"Death2");
		DBSH B 350;
		Goto FadeOut;
	Death2:
		DBSH D 350;
		Goto FadeOut;
	FadeOut:
		#### # 1 A_FadeOut(0.1);
		Loop;
	}
}

Class MachineGunCasing : Actor
{
	Default
	{
		scale 0.6;
		radius 3;
		height 3;
		BounceType "Doom";
		BounceFactor 0.4;
		speed 8;
		Projectile;
		-NOGRAVITY;
		+MOVEWITHSECTOR;
		+ALLOWBOUNCEONACTORS;
		+BOUNCEONACTORS;
		+CLIENTSIDEONLY;
		+FORCEXYBILLBOARD;
	}
	States
	{
	Spawn:
		RFSH ABCD 2;
		Loop;
	Death:
		TNT1 A 0 A_Jump(128,"Death2");
		RFSH B 350;
		goto FadeOut;
	Death2:
		RFSH D 350;
		goto FadeOut;
	FadeOut:
		#### # 1 A_FadeOut(0.1);
		loop;
	}
}

Class MinigunCasing : MachineGunCasing
{
	Default
	{
		scale 0.5;
	}
}

Class PistolCasing : Actor
{
	Default
	{
		scale 0.8;
		radius 3;
		height 3;
		BounceType "Doom";
		BounceFactor 0.5;
		speed 8;
		Projectile;
		-NOGRAVITY;
		+MOVEWITHSECTOR;
		+ALLOWBOUNCEONACTORS;
		+BOUNCEONACTORS;
		+CLIENTSIDEONLY;
		+FORCEXYBILLBOARD;
	}
	States
	{
	Spawn:
		PSSH ABCD 2;
		Loop;
	Death:
		TNT1 A 0 A_Jump(128,"Death2");
		PSSH B 350;
		goto FadeOut;
	Death2:
		PSSH D 350;
		goto FadeOut;
	FadeOut:
		#### # 1 A_FadeOut(0.1);
		loop;
	}
}

Class NadeCasing : Actor
{
	Default
	{
		scale 0.8;
		radius 6;
		height 6;
		BounceType "Doom";
		BounceFactor 0.2;
		speed 3;
		Projectile;
		-NOGRAVITY;
		+MOVEWITHSECTOR;
		+ALLOWBOUNCEONACTORS;
		+BOUNCEONACTORS;
		+CLIENTSIDEONLY;
		+FORCEXYBILLBOARD;
	}
	States
	{
	Spawn:
		NADC ABCD 2;
		Loop;
	Death:
		TNT1 A 0 A_Jump(128,"Death2");
		NADC B 350;
		goto FadeOut;
	Death2:
		NADC D 350;
		goto FadeOut;
	FadeOut:
		#### # 1 A_FadeOut(0.1);
		loop;
	}
}
