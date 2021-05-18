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
			if (health < 1)
			{
			IgniteAmount = IgniteAmount - 3;
			}
			A_DamageSelf(1 + (IgniteAmount * 0.4),'Fire',0,null,"None",AAPTR_TRACER,0);
		}
		A_SpawnItemEx("DFlameParticle", frandom(radius,-radius), frandom(radius,-radius), frandom(height,-height));
		return;
			
	}
	
	override int TakeSpecialDamage(Actor inflictor, Actor source, int damage, Name damagetype)
	{
		if (damagetype == 'Ignite' || damagetype == 'MangabushFlame')
		{
			IgniteAmount = IgniteAmount + damage;
			IgniteAmount = clamp(IgniteAmount, 0, 100);
			tracer = source;
			return damage * 0.5;
		}
		return damage;
	}