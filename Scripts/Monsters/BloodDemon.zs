//Like the Demon, but faster and now has a charge attack
//A bit janky, needs work

Class BloodDemon : DMonster replaces Demon
{
	Default {
	Health 400;
	speed 10;
	PainChance 60;
	Speed 10;
	Radius 30;
	Height 56;
	Mass 400;
	Monster;
	DamageFactor "PinkieDmg", 0;
	PainChance "PinkieDmg", 0;
	+FLOORCLIP;
	SeeSound "blooddemon/sight";
    PainSound "blooddemon/pain";
    DeathSound "blooddemon/death";
    ActiveSound "blooddemon/active";
	MinMissileChance 350;
	MeleeRange 80;
	}
	States
	{
	Spawn: 
		SRG2 AB 10 A_Look;
		Loop;
	See: 
		SRG2 A 0 A_PlaySound("blooddemon/walk");
		SRG2 AAABBB 1 A_Chase;
		SRG2 C 0 A_PlaySound("blooddemon/walk");
		SRG2 CCCDDD 1 A_Chase;
		Loop;
	Missile:
		SRG2 A 0 { A_FaceTarget(); A_PlaySound("blooddemon/active"); }
		SRG2 A 1 ThrustThing(angle*256/360, 3, true, 0);
		SRG2 A 0 {
		A_PlaySound("blooddemon/walk");
		ThrustThing(angle*256/360, 5, true, 0);
		}
		SRG2 AB 1 A_JumpIfTargetInsideMeleeRange("See");
		SRG2 C 0 {
		A_PlaySound("blooddemon/walk");
		ThrustThing(angle*256/360, 7, true, 0);
		}
		SRG2 CD 1 A_JumpIfTargetInsideMeleeRange("See");
		SRG2 A 0 {
		A_PlaySound("blooddemon/walk");
		ThrustThing(angle*256/360, 10, true, 0);
		}
		SRG2 AABB 1 A_JumpIfTargetInsideMeleeRange("Ram");
		SRG2 A 0 {
		A_PlaySound("blooddemon/walk");
		ThrustThing(angle*256/360, 15, true, 0);
		}
		SRG2 CCCDDD 1 A_JumpIfTargetInsideMeleeRange("Ram");
		SRG2 C 0 {
		A_PlaySound("blooddemon/walk");
		ThrustThing(angle*256/360, 20, true, 0);
		}
		SRG2 AAABBB 1 A_JumpIfTargetInsideMeleeRange("Ram");
		Goto Ram;
    Melee:
		SRG2 EF 4 A_FaceTarget;
		SRG2 G 4 A_CustomMeleeAttack((10), "blooddemon/melee");
		Goto See;
	Ram:
		SRG2 A 0 A_FaceTarget();
		SRG2 A 0 A_CustomMeleeAttack((20), "", "", "PinkieDmg");
//		SRG2 A 0 A_RadiusThrust(180,64,RTF_NOTMISSILE|RTF_THRUSTZ,64);
		Goto See;
    Pain: 
		SRG2 H 2;
		SRG2 H 2 A_Pain;
		Goto See;
    Death: 
		SRG2 I 8;
		SRG2 I 0 A_FaceTarget;
		SRG2 J 0 A_SpawnItemEx("BloodDemonArm", 10, 0, 32, 0, 8, 0, 0, 128);
		SRG2 J 8 A_Scream;
		SRG2 K 4;
		SRG2 L 4 A_NoBlocking;
		SRG2 M 4;
		SRG2 N -1;
		Stop;
    Raise: 
		SRG2 NMLKJI 5;
		Goto See;
	} 
}

Class BloodDemonArm : Actor
{
	Default {
	Radius 8;
	Height 8;
	Speed 8;
	BounceType "Doom";
	+DROPOFF;
	+Missile;
	}
    States
	{
	Spawn:
         SG2A ABCDEFGH 2;
         Loop;
	Death:
		SG2A I -1;
		Loop;
	}
}
