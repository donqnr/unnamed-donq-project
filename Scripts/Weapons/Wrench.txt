Class Wrench : DWeapon
{
	Default {
	Weapon.SelectionOrder 3700;
	Weapon.Kickback 100;
	Obituary "%o's stupid face was caved in with %k's wrench";
	Tag "$TAG_FIST";
	+WEAPON.WIMPY_WEAPON;
	+WEAPON.MELEEWEAPON;
	+NOEXTREMEDEATH;
	}
	States
	{
	Ready:
		WRNC A 1 
		{
		A_WeaponReady();
		A_WeaponSway(30,10,1,1.5);
		}
		Loop;
	Deselect:
		"####" A 1 A_WeaponOffset(-4,8,WOF_ADD);
		"####" A 1 A_WeaponOffset(-6,12,WOF_ADD);
		"####" A 1 A_WeaponOffset(-8,16,WOF_ADD);
		"####" A 1 A_WeaponOffset(-10,20,WOF_ADD);
		"####" A 1 A_WeaponOffset(-8,16,WOF_ADD);
		"####" A 1 A_WeaponOffset(-6,12,WOF_ADD);
		"####" A 1 A_WeaponOffset(-4,8,WOF_ADD);
		TNT1 A 5;
		"####" A 0 A_Lower();
		Wait;
	Select:
		TNT1 A 0 A_ResetSway();
		WRNC A 1 A_WeaponOffset(-46,124,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(10,-20,WOF_ADD);
		"####" A 1 A_WeaponOffset(8,-16,WOF_ADD);
		"####" A 1 A_WeaponOffset(6,-12,WOF_ADD);
		"####" A 1 A_WeaponOffset(4,-8,WOF_ADD);
		Goto Ready;
	Fire:
		WRNC B 1
		{	
			A_ResetSway();
			A_WeaponOffset(-4,36,WOF_INTERPOLATE);
		    FTranslatedLineTarget t;
            double ang = angle + Random2() * (5.625 / 256);
            double pitch = AimLineAttack(ang, 64, null, 0., ALF_CHECK3D);
            LineAttack(ang, 96, pitch, (75), 'Melee', "BulletPuff", LAF_ISMELEEATTACK, t);

			if (t.linetarget)
			{
				A_PlaySound (t.linetarget.bNoBlood ? sound("WrenchHitWall") : sound("WrenchHit"), CHAN_WEAPON);
			}
			else
			{
				A_PlaySound ("WrenchMiss", CHAN_WEAPON);
			}
		}
		WRNC B 1 A_WeaponOffset(-80,52,WOF_INTERPOLATE);
		WRNC B 1 A_WeaponOffset(-140,82,WOF_INTERPOLATE);
		WRNC B 1 A_WeaponOffset(-220,122,WOF_INTERPOLATE);
		WRNC B 1 A_WeaponOffset(-280,172,WOF_INTERPOLATE);
		WRNC B 1 A_WeaponOffset(-360,222,WOF_INTERPOLATE);
		WRNC B 10 A_WeaponOffset(-460,292,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-75,184);
		WRNC A 1 A_WeaponOffset(-59,136,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-45,104,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-33,80,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-23,64,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-15,52,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-9,44,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-5,38,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-2,34,WOF_INTERPOLATE);
		WRNC A 1 A_WeaponOffset(-0,32,WOF_INTERPOLATE);
		WRNC A 1 A_ReFire;
		Goto Ready;
	}
}