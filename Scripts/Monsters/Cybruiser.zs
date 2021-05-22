//Oh look, bet you haven't seen this one before
//Very much like the Baron of Hell or Hell Knight, but fires minimissiles in bursts of three.

//Decorate: Eriance (Small edits by donqnr)
//GLDefs: Dreadopp, SandyPaper (Brightmaps)
//Sounds: id Software, Eriance
//Sprites: id Software, Raven Software, Wolfendoom
//Sprite Edit: Eriance
//Idea Base: Doom 2 Cyberdemon

Class Cybruiser : DMonster
{ 
	Default {
		Health 1200;
		Radius 24;
		Height 64;
		Mass 1000;
		Speed 8;
		PainChance 20; 
		Monster;
		MeleeDamage 10;
		bloodcolor "red";
		DamageFactor "BaronDmg", 0;
		PainChance "BaronDmg", 0;
		Obituary "%o was blown away by a Cybruiser.";
		HitObituary "%o was smashed by a Cybruiser.";
		+FloorClip;
		+Boss;
		+DontHurtSpecies;
		SeeSound "monster/brusit"; 
		PainSound "baron/pain";
		DeathSound "monster/brudth";
		MeleeSound "baron/melee";
	}
  States
  { 
  Spawn: 
    BRUS AB 10 A_Look; 
    Loop;
  See:
    BRUS A 1 A_Playsound("monster/bruwlk");
    BRUS A 1 A_Chase;
    BRUS A 2 A_Chase;
    BRUS BB 2 A_Chase;
    BRUS C 1 A_Playsound("monster/bruwlk");
    BRUS C 1 A_Chase;
    BRUS C 2 A_Chase ;
    BRUS DD 2 A_Chase;
    Loop;
  Missile:
    BRUS E 12 A_FaceTarget;
    BRUS F 6 Bright A_SpawnProjectile("Bruisershot", 33.0, 9, frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.6,-1.6));
    BRUS E 4 A_FaceTarget;
    BRUS F 6 Bright A_SpawnProjectile("Bruisershot", 33.0, 9, frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.6,-1.6));
    BRUS E 4 A_FaceTarget;
    BRUS F 6 Bright A_SpawnProjectile("Bruisershot", 33.0, 9, frandom(1.8,-1.8),CMF_OFFSETPITCH,frandom(1.6,-1.6));
    Goto See;
  Melee:
    BRUS GH 8 A_FaceTarget;
    BRUS I 8 A_CustomMeleeAttack(15, "baron/melee", "", "Melee", true);
    Goto See;
  Pain: 
    BRUS J 2;
    BRUS J 2 A_Pain;
    Goto See;
  Death: 
    BRUS K 6 Bright A_Scream;
    BRUS LMN 6 Bright;
    BRUS O 6 Bright A_NoBlocking;
    BRUS QR 6 Bright;
    BRUS S 6;
    BRUS T -1 A_BossDeath;
    Stop;
  } 
}

Class Bruisershot:Actor
{
	Default{
		Radius 7;
		Height 5;
		Speed 14;
		DamageFunction (20);
		DamageType "BaronDmg";
		Projectile;
		scale 0.75;
		SeeSound "MisslFire";
		DeathSound "weapons/rocklx";
		Obituary "%o got blown by %k";
	}
	States
	{
	Spawn:
		MISL AAAAAAAAAAAAAAAAAAAAAAAAA 1 bright A_ScaleVelocity(1.04);
		MISL A 350 bright;
		loop;
	Death:
		MISL B 6 bright A_Explode((80), 80);
		MISL C 4 bright;
		MISL D 2 bright;
		Stop;
	}
}