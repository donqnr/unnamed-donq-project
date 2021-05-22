

Class JumpJets:CustomInventory
{
	Default{
		radius 12;
		Inventory.Amount 1;
		Inventory.MaxAmount 100;
		Inventory.Icon "CELLA0";
		Inventory.PickupMessage "JumpJets";
		+INVENTORY.IGNORESKILL;
		+INVENTORY.INVBAR;
	}
	States
	{
		Pickup:
			CELL A 0 A_GiveInventory("JumpJetCharge", 1);
		Spawn:
			CELL A -1;
			Stop;
		Use:
			CELL A 0 
			{
				if (CountInv("JumpJets") > 99)
				{
					A_ChangeVelocity(velx,vely,16,CVF_REPLACE);
					A_TakeInventory ("JumpJets", 99);
				}
			}
			Fail;
	}
}

Class JumpJetCharge:PowerUp
{
	Default{
		PowerUp.Duration 0x7FFFFFFD;
		PowerUp.Strength 1;
		+INVENTORY.ADDITIVETIME
	}
	override void DoEffect()
	{
		Super.DoEffect();
		if (Owner != null && Owner.health > 0 && (level.time & 1) == 0)
		{
			Owner.GiveInventory("JumpJets", 2);
		}
	}
}