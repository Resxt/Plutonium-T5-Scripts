#include maps\mp\_utility;

Init()
{
	if (GetDvarInt("mapvote_enable"))
	{
		replaceFunc(maps\mp\gametypes\_killcam::finalkillcamwaiter, ::OnKillcamEnd);
	}
}

OnKillcamEnd()
{		
	while (level.inFinalKillcam)
	{
		wait(0.05);
	}

    if (!IsDefined(level.finalkillcam_winner))
	{
	    if (isRoundBased() && !wasLastRound())
			return false;	
		wait GetDvarInt("mapvote_display_wait_time");
		
		[[level.mapvote_start_function]]();
		[[level.mapvote_end_function]]();
        return false;
    }
	
    level waittill("final_killcam_done");
	if (isRoundBased() && !wasLastRound())
		return true;
	wait GetDvarInt("mapvote_display_wait_time");

	[[level.mapvote_start_function]]();
	[[level.mapvote_end_function]]();
    return true;
}