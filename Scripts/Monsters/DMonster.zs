// Stuff for new monsters

Class DMonster:Actor abstract
{
	int BludColor; 					//Dumb shitty workaround because comparing BloodColor directly doesn't work
	property BludColor: BludColor; 	// 0 = red  1 = blue  2 = green
	int IgniteAmount;
	
	override void Tick()
	{	
		if (IgniteAmount > 0)
			OnFire();
			
		Super.Tick();
		return;
	}
	
	void OnFire()
	{
		if ((Level.maptime & 7) == 0 && IgniteAmount > 0)
		{
			IgniteAmount--;
			A_DamageSelf(1 + (IgniteAmount * 0.4),'Fire',0,null,"None",AAPTR_TRACER,0);
		}
		A_SpawnItemEx("DFlameParticle", frandom(radius,-radius), frandom(radius,-radius), frandom(height,-height));
		if (health < 1)
		{
			if (BludColor == 1)
			{
				A_SetTranslation("BluBludFireDeath");
			} else if (BludColor == 2) {
				A_SetTranslation("GrnBludFireDeath");
			} else {
				A_SetTranslation("RedBludFireDeath");
			}
		}
		return;
			
	}
	
	override int TakeSpecialDamage(Actor inflictor, Actor source, int damage, Name damagetype)
	{
		if (damagetype == 'Ignite' || damagetype == 'MangabushFlame')
		{
			IgniteAmount = IgniteAmount + damage;
			IgniteAmount = clamp(IgniteAmount, 0, 100);
			tracer = source;
			return damage * 0.75;
		}
		return damage;
	}
	
	Default{
		MONSTER;
		+INTERPOLATEANGLES;
		+DOHARMSPECIES;
		PainChance "Ignite", 0;
		DMonster.BludColor 0;
		}
}

