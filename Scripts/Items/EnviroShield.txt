Class EnviroShield:CustomInventory
{
	Default{
		radius 12;
		Inventory.Amount 1;
		Inventory.MaxAmount 200;
		Inventory.Icon "CELLA0";
		Inventory.PickupMessage "Environmental Shield";
		Inventory.InterHubAmount 0;
		+INVENTORY.IGNORESKILL;
	}
	States
	{
		Spawn:
			CELL A -1;
			Stop;
		Use:
			CELL A 0;
			Fail;
	}
	override void AbsorbDamage (int damage, Name damageType, out int newdamage)
	{
		if (damageType == 'Fire' || damageType == 'Slime')
		{
			newdamage = 0;
			Owner.TakeInventory("EnviroShield", damage);
		}
	}
}
