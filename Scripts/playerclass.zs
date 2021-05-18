Class DickKickem : DoomPlayer
{

	int IgniteAmount;
	class ignitor;
	
	override void Tick()
	{	
		if (!player || !player.mo || player.mo != self)
		{
			Super.Tick();
			return;
		}
		
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
			A_DamageSelf(1 + (IgniteAmount * 0.15),'OnFire',0,null,"None",AAPTR_MASTER,0);
		}
		A_SpawnItemEx("DFlameParticle", frandom(radius,-radius), frandom(radius,-radius), frandom(height,-height));
		A_SpawnItemEx("DFlameParticle", frandom(radius,-radius), frandom(radius,-radius), frandom(height,-height));
		if (health < 1)
		{
			A_SetTranslation("RedBludFireDeath");
		}
		return;
			
	}
	
	override int TakeSpecialDamage(Actor inflictor, Actor source, int damage, Name damagetype)
	{
		if (damagetype == 'Ignite' || damagetype == 'MangabushFlame')
		{
			IgniteAmount = IgniteAmount + damage;
			IgniteAmount = clamp(IgniteAmount, 0, 20);
			if (source)
			{
				let ignitor = source;
				master = ignitor;
			}
			
			return damage * 0.5;
		}
		return damage;
	}

	Default
	{
		Player.StartItem "Wrench";
		Player.WeaponSlot 1, "Wrench";
		Player.WeaponSlot 2, "DKPistol", "MachinePistol";
		Player.WeaponSlot 3, "DKShotgun", "SupaShotgun";
		Player.WeaponSlot 4, "DKMinigun", "PlasmaCannon", "DKMachinegun";
		Player.WeaponSlot 5, "NadeLauncher", "DKMissileLauncher";
		Player.WeaponSlot 6, "Railgun";
		Player.WeaponSlot 7, "DKFlamethrower";
		Player.WeaponSlot 8, "ClusterFucker6000";
		Player.AirCapacity 0;
	}
}