// The Boolet class, acts as a base for bullet weapon projectiles.
// Every bullet projectile inherits from this.
// Uses Belmondo's particle based tracer system (ztracers.txt)

Class Boolet:_ZTracer{
	Default{
		Radius 3;
		Height 3;
		Speed 120;
		DamageFunction (1);
		Projectile;
		Obituary "what the fuck";
		Decal "BulletChip";
		+BLOODSPLATTER;
		+SPAWNSOUNDSOURCE;
		+NOEXTREMEDEATH;
		+FORCEXYBILLBOARD;
	}
	States
	{
	Spawn:
		TNT1 A 1 Bright;
		Loop;
	Death:
		PUFF A 0 
		{	
			int i = 0;
			int r = frandom(1,3);
			for (i; i < r; i++)
			{
			A_SpawnItemEx("WallHitParticleThingIDK",0,0,0,frandom(-1,-4),0,frandom(1,6),frandom(-90,90),0);
			}
		A_PlaySound("ric");
		}
		Stop;
	XDeath:
		PUFF A 0 A_PlaySound("bullethit");
		Stop;
		}
	}
	
Class RedBoolet:_ZTracerRed{
	Default{
		Radius 7;
		Height 5;
		Speed 120;
		DamageFunction (1);
		Projectile;
		Obituary "what the fuck";
		Decal "BulletChip";
		+BLOODSPLATTER;
		+SPAWNSOUNDSOURCE;
		+NOEXTREMEDEATH;
		+FORCEXYBILLBOARD;
	}
	States
	{
	Spawn:
		TNT1 A 1 Bright;
		Loop;
	Death:
		PUFF A 0 
		{	
			int i = 0;
			int r = frandom(1,3);
			for (i; i < r; i++)
			{
			A_SpawnItemEx("WallHitParticleThingIDK",0,0,0,frandom(-1,-4),0,frandom(1,6),frandom(-90,90),0);
			}
		A_PlaySound("ric");
		}
		Stop;
	XDeath:
		PUFF A 0 A_PlaySound("bullethit");
		Stop;
		}
	}

Class BooletTrail:Actor{
	Default{
		Radius 20;
		Alpha 0.8;
		Gravity 0;
		Scale 0.25;
		RenderStyle "AddStencil";
		StencilColor "Orange";
		+NOINTERACTION
		+FORCEXYBILLBOARD;
		}
		States
		{
		Spawn:
		PUFF A 1 bright Light("BooletLight")
		{
		}
		Stop;
	}
}
Class WallHitParticleThingIDK:Actor
{
	Default{
		scale 0.22;
		radius 3;
		height 3;
		BounceType "Doom";
		BounceFactor 0.2;
		RenderStyle "AddStencil";
		StencilColor "orange";
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
		PUFF A 1;
		Loop;
	Death:
		PUFF A 1 A_FadeOut(0.08,1);
		loop;
	}
}