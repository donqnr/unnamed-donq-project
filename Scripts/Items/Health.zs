Class Stim:CustomInventory
{
	Default{
		radius 9;
		Inventory.Amount 1;
		Inventory.MaxAmount 10;
		Inventory.Icon "PRURB0";
		Inventory.PickupMessage "Portable Stimpack (+25hp)";
		Inventory.InterHubAmount 10;
		+INVENTORY.IGNORESKILL;
		+INVENTORY.INVBAR;
		+INVENTORY.ADDITIVETIME;
	}
	States
	{
		Spawn:
			PRUR A -1;
			Stop;
		Use:
			PRUR A 0 A_JumpIfHealthLower(100, "FUCK");
			Fail;
		FUCK:
			PRUR A 0
			{
				if (health < 100)
				{
					A_GiveInventory("StimEffect",1);
					A_PlaySound("Heal", 3);
				}
			}
			Stop;
	}
}

Class SuperHealth:SoulSphere
{

}
Class StimEffect:PowerUp
{
	Default{
		PowerUp.Duration 100;
		PowerUp.Strength 1;
		+INVENTORY.ADDITIVETIME
	}
	override void DoEffect()
	{
		Super.DoEffect();
		if (Owner != null && Owner.health > 0 && (level.time & 3) == 0)
		{
			Owner.GiveBody(int(Strength));
		}
	}
}

Class SuperStimEffect:PowerUp
{
	Default{
		PowerUp.Duration 80;
		PowerUp.Strength 2;
	}
	override void DoEffect()
	{
		Super.DoEffect();
		if (Owner != null && Owner.health > 0 && (level.time & 3) == 0)
		{
			if (Owner.GiveBody(int(Strength)))
			{
				Owner.A_PlaySound("*regenerate", CHAN_ITEM);
			}
		}
	}
}

