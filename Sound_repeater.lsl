
key sound1 = "67b598ab-3ea1-a0e4-31dc-5b53df3ca6c4";
key sound2 = "d0558313-a5ca-7b5f-3838-b43b77c70ff4";
key sound3 = "c99010e3-041b-4394-5ccb-45c7fd794f39";
key sound4 = "ce75c724-8517-f623-ce70-3d70266391f8";
key sound5 = "5a2c7712-a67a-ebc9-9eaf-18235fffc0fa";
key sound6 = "b7f2f9b1-32c5-e286-c027-b3ea4883f851";

integer sound = 1;

integer on = FALSE;

default
{
    on_rez(integer start_p)    {
        llInstantMessage( llGetOwner(), "Resetting. ." );
        llResetScript();
    }
    
    state_entry()    {
        llPreloadSound(sound1);
        llPreloadSound(sound2);
        llPreloadSound(sound3);
        llPreloadSound(sound4);
        llPreloadSound(sound5);
        llPreloadSound(sound6);
        
    }

    touch_start(integer total_number)    {
        llSetTimerEvent(0);
        if(on == FALSE) {
            on = TRUE;
            llInstantMessage( llGetOwner(), "Sounds are now ON" );
            sound = 1;
            llSetTimerEvent(1);
        }
        else if(on == TRUE) {
            on = FALSE;
            llInstantMessage( llGetOwner(), "Sounds are now OFF" );
            llStopSound();
            
            llSetTimerEvent(0);
        }
    }
    
    timer() {
        llSetTimerEvent(0);
        if(on == TRUE)  {
            llSetTimerEvent(9);
            //llOwnerSay("starting sound "+(string)sound);
            if(sound == 1)  llPlaySound(sound1,1);
            if(sound == 2)  llPlaySound(sound2,1);
            if(sound == 3)  llPlaySound(sound3,1);
            if(sound == 4)  llPlaySound(sound4,1);
            if(sound == 5)  llPlaySound(sound5,1);
            if(sound == 6)  llPlaySound(sound6,1);
           // llOwnerSay("ending sound "+(string)sound);
            
            sound++;
            if(sound == 7) sound = 1;
            
            
        }
    }
}
