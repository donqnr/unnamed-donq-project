//New weapon class to add functionality, every new weapon inherits from this

Class DWeapon:Weapon abstract
{
	float MinSpreadX;				
	float MinSpreadY;				//The initial spread when you start firing a weapon
	property MinSpreadX: MinSpreadX;
	property MinSpreadY: MinSpreadY;
	
	float SpreadIncreaseX;			//How much bullet spread increases between each shot
	float SpreadIncreaseY;			
	property SpreadIncreaseX: SpreadIncreaseX;
	property SpreadIncreaseY: SpreadIncreaseY;
	
	float MaxSpreadX;				//The maximum spread the weapon reaches after sustained fire
	float MaxSpreadY;
	property MaxSpreadX: MaxSpreadX;
	property MaxSpreadY: MaxSpreadY;
	
	float CurrentSpreadX;
	float CurrentSpreadY;
	
	bool UsingSuperAmmo;			//Used to change between regular and the more powerful ammo types for weapons that have them.
	
	Class<Ammo> SuperAmmo;			//What ammo is used as the super ammo
	property SuperAmmo: SuperAmmo;
	
	bool HasSuperAmmo;				//Does the weapon have a super ammo type
	property HasSuperAmmo: HasSuperAmmo;
	
	Class<Actor> NormalProj;		//Projectile to fire when using regular ammo type
	property NormalProj: NormalProj;
	Class<Actor> SuperProj;			//Projectile to fire when using super ammo type
	property SuperProj: SuperProj;
	
	float RecoilMultY;
	float RecoilMultX;
	property RecoilMultY: RecoilMultY;
	property RecoilMultX: RecoilMultX;
	
	float OffsetX;
	float OffsetY;
	
	float ofst;
	
	
	Default
	{
		DWeapon.MinSpreadX 0;
		DWeapon.MinSpreadY 0;
		DWeapon.MaxSpreadX 0;
		DWeapon.MaxSpreadY 0;
		DWeapon.SpreadIncreaseX 0;
		DWeapon.SpreadIncreaseY 0;
		DWeapon.HasSuperAmmo false;
		DWeapon.NormalProj "Boolet";
		DWeapon.SuperProj "Boolet";
		DWeapon.RecoilMultY 1;
		DWeapon.RecoilMultX 1;
		Weapon.BobStyle "InverseSmooth";
		Weapon.BobRangeX 0.8;
		Weapon.BobRangeY 0.8;
		Weapon.BobSpeed 1.2;
	}
	
	override void PostBeginPlay()
	{
		Super.PostBeginPlay();
		CurrentSpreadX = MinSpreadX;
		CurrentSpreadY = MinSpreadY;
		UsingSuperAmmo = false;
		if (MinSpreadX > MaxSpreadX) //If the minimum spread is larger than maximum (what are you even trying to do) set max to same as min
		{
			MaxSpreadX = MinSpreadX;
		}
		if (MinSpreadY > MaxSpreadY)
		{
			MaxSpreadY = MinSpreadY;
		}
		OffsetX = 0;
		OffsetY = 0;
		return;
	}
	
	override void Tick()
	{
		Super.Tick();
		return;
	}
	
	action state A_FireBoolts(int useammo, float spawnofs_horz, int spawnheight, int booletamount)
	{
		Class<Actor> whattofire = invoker.NormalProj;	//Set up the projectile to fire and what ammo to take, regular ammo type by default
		Class<Ammo> ammototake = invoker.AmmoType1;
		if (invoker.UsingSuperAmmo && CountInv(invoker.SuperAmmo) > 0)	//If super ammo is selected, change to super projectile and ammo
		{
			whattofire = invoker.SuperProj;
			ammototake = invoker.SuperAmmo;
		}
		int i = 0;
		if (CountInv(ammototake) > 0)	//Only allow firing if you have ammo
		{
			for(i; i < booletamount; i++)	//Loop for how many projectiles are to be fired at once
			{
				A_FireProjectile(whattofire,frandom(Invoker.CurrentSpreadX, -invoker.CurrentSpreadX),useammo,spawnofs_horz,spawnheight,0,frandom(invoker.CurrentSpreadY,-invoker.CurrentSpreadY));
			}
			if (GetCVar("sv_infiniteammo") <= 0) //If infinite ammo is enabled, don't spend ammo
			{
				A_TakeInventory(ammototake, useammo); //Take the amount of ammo specified
			}
			
			invoker.CurrentSpreadX = invoker.CurrentSpreadX + invoker.SpreadIncreaseX; //Increase bullet spread on the X axis by the amount specified by the property
			if (invoker.CurrentSpreadX > invoker.MaxSpreadX)	//If it exceeds the max amount, set it to the max amount
			{
				invoker.CurrentSpreadX = Invoker.MaxSpreadX;
			}
			invoker.CurrentSpreadY = invoker.CurrentSpreadY + invoker.SpreadIncreaseY;	//Same shit as before but for the Y axis
			if (invoker.CurrentSpreadY > invoker.MaxSpreadY)
			{
				invoker.CurrentSpreadY = Invoker.MaxSpreadY;
			}
		}
		return null;
	}
	
	//Action state to handle changing ammo types
	action state A_ChangeAmmoType()
	{
		
		if(!invoker.HasSuperAmmo) //Do nothing if the weapon doesn't have a super ammo type
		{
		return null;
		}
		
		if(!invoker.UsingSuperAmmo && CountInv(invoker.SuperAmmo) > 0) //Change ammo type if not selected and have the ammo for it
		{
			invoker.UsingSuperAmmo = true;
		} else {
			invoker.UsingSuperAmmo = false;		//Change back to/stay using regular ammo
		}
		return null;
	}
	
	action state A_DecreaseSpread(float x, float y)
	{
		if (invoker.CurrentSpreadX > Invoker.MinSpreadX)
		{ 
		Invoker.CurrentSpreadX = Invoker.CurrentSpreadX - x;
			if (invoker.CurrentSpreadX < invoker.MinSpreadX)
			{
				invoker.CurrentSpreadX = invoker.MinSpreadX;
			}
		}
		if (invoker.CurrentSpreadY > Invoker.MinSpreadY)
		{ 
		Invoker.CurrentSpreadY = Invoker.CurrentSpreadY - y;
			if (invoker.CurrentSpreadY < invoker.MinSpreadY)
			{
				invoker.CurrentSpreadY = invoker.MinSpreadY;
			}
		}
		return null;
	}
	
	action state A_ResetSpread()
	{
		invoker.CurrentSpreadX = Invoker.MinSpreadX;
		invoker.CurrentSpreadY = invoker.MinSpreadY;
		return null;
	}
	
	action state A_RandomOffset(float min, float max)
	{
		invoker.ofst = frandom(min,max);
		return null;
	}
	
	action state A_WeaponSway(float clampX = 30, float clampY = 10, float speed = 1, float returnspeed = 1)
	{
	
		invoker.OffsetX = invoker.OffsetX + GetPlayerInput(INPUT_YAW,-1) * (speed * 0.001);
		invoker.OffsetY = invoker.OffsetY + GetPlayerInput(INPUT_PITCH,-1) * (speed * 0.001);
		float yaw = GetPlayerInput(INPUT_YAW,-1);
		float pitch = GetPlayerInput(INPUT_PITCH,-1);
		
		
		invoker.OffsetX = clamp(invoker.OffsetX, -clampX, clampX);
		invoker.OffsetY = clamp(invoker.OffsetY, -clampY, clampY);
		
		A_WeaponOffset(invoker.OffsetX,invoker.OffsetY + 32, WOF_INTERPOLATE);
		

		if (invoker.OffsetX < 0)
		{
			invoker.OffsetX = invoker.OffsetX - (invoker.OffsetX * (returnspeed * 0.1));
		} else if (invoker.OffsetX > 0) {
			invoker.OffsetX = invoker.OffsetX - (invoker.OffsetX * (returnspeed * 0.1));
		}
		if (invoker.OffsetX <= 0.1 && invoker.OffsetX >= -0.1)
		{
				invoker.OffsetX = 0;
		}

		if (invoker.OffsetY < 0)
		{
			invoker.OffsetY = invoker.OffsetY - (invoker.OffsetY * (returnspeed * 0.1));
		} else if (invoker.OffsetY > 0) {
				invoker.OffsetY = invoker.OffsetY - (invoker.OffsetY * (returnspeed * 0.1));
		}
		if (invoker.OffsetY <= 0.1 && invoker.OffsetY >= -0.1)
		{
				invoker.OffsetY = 0;
		}
		
		return null;
	}
	
	action state A_ResetSway()
 	{
		invoker.OffsetX = 0;
		invoker.OffsetY = 0;
		A_WeaponOffset(0,32,WOF_INTERPOLATE);
		return null;
	}
	
	action state A_DWeaponOffset(float x, float y)
	{
		invoker.OffsetX = invoker.OffsetX + x;
		invoker.OffsetY = invoker.OffsetY + y;
		
		A_WeaponOffset(invoker.OffsetX,invoker.OffsetY + 32, WOF_INTERPOLATE);
		
		return null;
	}
}