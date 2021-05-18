class Vest : GreenArmor
{
	Default
	{
		Radius 20;
		Height 16;
		Inventory.Pickupmessage "A Bulletproof Vest";
		Inventory.Icon "VESTA0";
		Armor.SaveAmount 50;
	}
	States
	{
	Spawn:
		VEST B 6;
		VEST A 7 bright;
		loop;
	}
}