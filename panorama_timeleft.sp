#include <sourcemod>

public Plugin myinfo = 
{
	name = "Panorama - Timeleft",
	author = "Fastmancz",
	description = "Shows Timeleft at the bottom of the screen",
	version = "1.0.0"
};

public void OnPluginStart()
{
	CreateTimer(1.0, Timeleft, _, TIMER_REPEAT);
}

public Action Timeleft(Handle timer)
{
	char time[60];
	int iTimeleft;

	GetMapTimeLeft(iTimeleft);
	FormatTime(time, sizeof(time), "%M:%S", iTimeleft);

	for(int i = 1; i <= MaxClients; i++)
	{
		if(IsClientInGame(i) && !IsFakeClient(i))
		{
			char message[60];
			Format(message, sizeof(message), "Timeleft: %s", time);
			SetHudTextParams(-1.0, 1.00, 1.0, 4, 180, 255, 255, 0, 0.00, 0.00, 0.00);
			ShowHudText(i, -1, message);
		}
	}
	return Plugin_Continue;
}