function sc_player_roll() {
    var roll_speed = 7;        
    
    var iframe_start = 20;     
    var iframe_end = 5;      

    
    if (roll_time > 0) {
        hspd = image_xscale * roll_speed;
        roll_time--
    } else{
		roll_time = 30;
        immunity = false;
        state = StatePlayer.IDLE;
        hspd = 0;
	}

    
    

   
    if (roll_time <= iframe_start && roll_time >= iframe_end) {
        immunity = true;   
    } else {
        immunity = false;
    }

    

}
