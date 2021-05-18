Class DFlameParticle:Actor
{
	Default
	{
		Scale 0.25;
		RenderStyle "Add";
		Alpha 0.8;
		gravity 0;
	}
	States
	{
	Spawn:
		FIRE ABCDEFGH 2 bright;
		Stop;
	}
}
