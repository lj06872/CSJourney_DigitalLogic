




`timescale 1ns/1ps

module pixel_gen(
    input btn,
    input mySW1,
    input clk_d,
    input [9:0] pixel_x,
    input [9:0] pixel_y,
    input video_on,
    input win_signal,
    output reg[3:0] red = 0,
    output reg[3:0] green = 0,
    output reg[3:0] blue = 0,
    output reg collision_led,
    output reg score_stop_signal
   );
   reg [9:0] x_loc;
   reg [9:0] y_loc;
   reg [9:0] y1_loc; 
   reg [9:0] counter; 
   reg [9:0] change;
   reg [9:0] x_mover;
   reg flag;
   
   
   reg a,b,c,d,e,f,g,  a1,b1,c1,d1,e1,f1,g1,  a2,b2,c2,d2,e2,f2,g2; //THREE 7-SEGMENT DISPLAYS
   always @ (posedge clk_d)
    begin     
            a <= (pixel_x>505-x_loc && pixel_x<520-x_loc && pixel_y>405-y1_loc && pixel_y<408-y1_loc)?1:0;               
            b <= (pixel_x>500-x_loc && pixel_x<503-x_loc && pixel_y>408-y1_loc && pixel_y<423-y1_loc)?1:0;         
            c <= (pixel_x>522-x_loc && pixel_x<525-x_loc && pixel_y>408-y1_loc && pixel_y<423-y1_loc)?1:0;         
            d <= (pixel_x> 505-x_loc && pixel_x<520-x_loc && pixel_y>423-y1_loc && pixel_y<426-y1_loc)?1:0;          
            e <= (pixel_x>500-x_loc && pixel_x<503-x_loc && pixel_y>426-y1_loc &&pixel_y<441-y1_loc)?1:0;          
            f <= (pixel_x>522-x_loc && pixel_x<525-x_loc && pixel_y>426-y1_loc && pixel_y<441-y1_loc)?1:0;          
            g <= (pixel_x>505-x_loc && pixel_x<520-x_loc && pixel_y>441-y1_loc && pixel_y<444-y1_loc)?1:0;
            
            a1 <= (pixel_x>505+30-x_loc && pixel_x<505+30+15-x_loc && pixel_y>405-y1_loc && pixel_y<408-y1_loc)?1:0;               
            b1 <= (pixel_x>500+30-x_loc && pixel_x<500+30+3-x_loc && pixel_y>408-y1_loc && pixel_y<423-y1_loc)?1:0;         
            c1 <= (pixel_x>522+28-x_loc && pixel_x<522+28+3-x_loc && pixel_y>408-y1_loc && pixel_y<423-y1_loc)?1:0;         
            d1 <= (pixel_x> 505+30-x_loc && pixel_x<505+30+15-x_loc && pixel_y>423-y1_loc && pixel_y<426-y1_loc)?1:0;          
            e1 <= (pixel_x>500+30-x_loc && pixel_x<500+30+3-x_loc && pixel_y>426-y1_loc &&pixel_y<441-y1_loc)?1:0;          
            f1 <= (pixel_x>522+28-x_loc && pixel_x<522+28+3-x_loc && pixel_y>426-y1_loc && pixel_y<441-y1_loc)?1:0;          
            g1 <= (pixel_x>505+30-x_loc && pixel_x<505+30+15-x_loc && pixel_y>441-y1_loc && pixel_y<444-y1_loc)?1:0;

            
            a2 <= (pixel_x>505+30+30-x_loc && pixel_x<505+30+30+15-x_loc && pixel_y>405-y1_loc && pixel_y<408-y1_loc)?1:0;               
            b2 <= (pixel_x>500+30+30-x_loc && pixel_x<500+30+30+3-x_loc && pixel_y>408-y1_loc && pixel_y<423-y1_loc)?1:0;         
            c2 <= (pixel_x>522+28+28-x_loc && pixel_x<522+28+28+3-x_loc && pixel_y>408-y1_loc && pixel_y<423-y1_loc)?1:0;         
            d2 <= (pixel_x> 505+30+30-x_loc && pixel_x<505+30+30+15-x_loc && pixel_y>423-y1_loc && pixel_y<426-y1_loc)?1:0;          
            e2 <= (pixel_x>500+30+30-x_loc && pixel_x<500+30+30+3-x_loc && pixel_y>426-y1_loc &&pixel_y<441-y1_loc)?1:0;          
            f2 <= (pixel_x>522+28+28-x_loc && pixel_x<522+28+28+3-x_loc && pixel_y>426-y1_loc && pixel_y<441-y1_loc)?1:0;          
            g2 <= (pixel_x>505+30+30-x_loc && pixel_x<505+30+30+15-x_loc && pixel_y>441-y1_loc && pixel_y<444-y1_loc)?1:0;
            
    end
    
    
    
    reg l1,l2, os1,os2,os3,os4,  s1,s2,s3,s4,s5,  t1,t2, w1,w2,w3,w4,o1,o2,o3,o4,n1,n2,n3;
always @ (posedge clk_d)
    begin
        l1 <=  (pixel_x>10 && pixel_x<60 && pixel_y >10 && pixel_y<310)?1:0;
        l2 <=  (pixel_x>59 && pixel_x<160 && pixel_y >260 && pixel_y<310)?1:0;
        
        os1 <=  (pixel_x>170 && pixel_x<260 && pixel_y >10 && pixel_y<60)?1:0;
        os2 <=  (pixel_x>170 && pixel_x<190 && pixel_y >10 && pixel_y<310)?1:0;
        os3 <=  (pixel_x>250 && pixel_x<270 && pixel_y >10 && pixel_y<310)?1:0;
        os4 <=  (pixel_x>170 && pixel_x<270 && pixel_y >260 && pixel_y<310)?1:0;
        
        s1 <=  (pixel_x>280 && pixel_x<380 && pixel_y >10 && pixel_y<60)?1:0;
        s2 <=  (pixel_x>280 && pixel_x<300 && pixel_y >59 && pixel_y<140)?1:0;
        s3 <=  (pixel_x>280 && pixel_x<380 && pixel_y >139 && pixel_y<190)?1:0;
        s4 <=  (pixel_x>360 && pixel_x<380 && pixel_y >189 && pixel_y<270)?1:0;
        s5 <=  (pixel_x>280 && pixel_x<380 && pixel_y >269 && pixel_y<310)?1:0;
        
        t1 <=  (pixel_x>390 && pixel_x<490 && pixel_y >10 && pixel_y<60)?1:0;
        t2 <=  (pixel_x>430 && pixel_x<450 && pixel_y >10 && pixel_y<310)?1:0;
        
        
        
        w1 <=  (pixel_x>10 && pixel_x<60 && pixel_y >10 && pixel_y<310)?1:0;
        w2 <=  (pixel_x>80 && pixel_x<130 && pixel_y >10 && pixel_y<310)?1:0;
        w3 <=  (pixel_x>150 && pixel_x<200 && pixel_y >10 && pixel_y<310)?1:0;
        w4 <=  (pixel_x>10 && pixel_x<200 && pixel_y >260 && pixel_y<310)?1:0;
        
        
        o1 <=  (pixel_x>230 && pixel_x<280 && pixel_y >10 && pixel_y<310)?1:0;
        o2 <=  (pixel_x>230 && pixel_x<380 && pixel_y >10 && pixel_y<60)?1:0;
        o3 <=  (pixel_x>330 && pixel_x<380 && pixel_y >10 && pixel_y<310)?1:0;
        o4 <=  (pixel_x>230 && pixel_x<380 && pixel_y >260 && pixel_y<310)?1:0;
        
        
        n1 <=  (pixel_x>410 && pixel_x<460 && pixel_y >10 && pixel_y<310)?1:0;
        n2 <=  (pixel_x>410 && pixel_x<560 && pixel_y >10 && pixel_y<60)?1:0;
        n3 <=  (pixel_x>510 && pixel_x<560 && pixel_y >10 && pixel_y<310)?1:0;
        
    end
   
   
   
    always @(posedge clk_d) 
        begin 
              
          if ( (pixel_x == -1)|| (pixel_x == 640) || (pixel_y == -1) || (pixel_x == 641) ||(pixel_y == 481) || (pixel_y == 480)|| pixel_x == 0 || pixel_y == 0  ) 
              begin
                if (pixel_x == 0 && pixel_y == 0) 
                    begin
                    
                        if (flag == 0)
                            begin
                                counter = 0;
                                x_mover = 5;
                                y1_loc = 10;
                                change = 0;
                                collision_led = 0;
                                flag = 1;

                            end  
                            
                        if (x_loc < 640)
                                begin                                     
                                    x_loc = x_loc + x_mover;                                   
                                end
                        else 
                            begin                    
                                x_loc = 0;
                                change = change +1;
                                if(counter%1 == 0)
                                   begin
                                        x_mover = x_mover +1 ; 
                                   end
                                counter = counter +1 ; 
                                
                                y1_loc = (3*y1_loc)  + 7;  
                                
                                if (y1_loc >=220)
                                    begin
                                    y1_loc = y1_loc%100;
                                    end                                          
                            end
                            
                        if(mySW1 == 1 && y_loc < 200)
                            begin
                                 y_loc = y_loc + 3;                                
                             end
                                                     
                        if(mySW1==0 && y_loc > 0)
                            begin
                                 y_loc = y_loc - 3;                                
                             end                                                                                  
                    end
                red <= 4'hF;
                green <= 4'hF;
                blue <= 4'hF;
                end                         
         
          else 
              begin
              if (btn == 1) //RESET CONDITION
                  begin  
                  score_stop_signal <= 0;
                  flag <= 0;
                  y_loc <= 0;
                  y1_loc <= 10;
                  x_loc <= 0;
                  end
              if (collision_led ==0 && btn == 0&& win_signal == 0)
              begin
                if (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc &&pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320) 
                        begin
                        collision_led <= 1; //COLLISION DETECTION
                        score_stop_signal <= 1; 
                        end
                //dld        
               if (change > 5)begin
                red <= video_on?(pixel_y < 200? 4'h0 : (a||b||c||e||f||g  || b1||e1||g1  || a2||b2||c2||e2||f2||g2)?4'hF : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0) )):(4'h0);
                green = video_on?(pixel_y < 200? 4'h0 : (a||b||c||e||f||g  || b1||e1||g1  || a2||b2||c2||e2||f2||g2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'hF))):(4'h0);
                blue <= video_on?(pixel_y > 200? (a||b||c||e||f||g  || b1||e1||g1  || a2||b2||c2||e2||f2||g2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0)) : 4'hF):(4'h0);
                end
               // oop 
               if (change == 3)begin
                red <= video_on?(pixel_y < 200? 4'h0 : (a||b||c||e||f||g  || a1||b1||c1||e1||f1||g1   || a2||b2||c2||e2 || d2)?4'hF : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0) )):(4'h0);
                green = video_on?(pixel_y < 200? 4'h0 : (a||b||c||e||f||g  || a1||b1||c1||e1||f1||g1  || a2||b2||c2||e2 || d2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'hF))):(4'h0);
                blue <= video_on?(pixel_y > 200? (a||b||c||e||f||g  || a1||b1||c1||e1||f1||g1  || a2||b2||c2||e2 || d2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0)) : 4'hF):(4'h0);
                end
               //pfun 
               if (change == 1)begin
                red <= video_on?(pixel_y < 200? 4'h0 : (a||b||c|e||d || a1||b1||e1||d1  || a2||b2||c2||e2 || f2)?4'hF : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0) )):(4'h0);
                green = video_on?(pixel_y < 200? 4'h0 : (a||b||c|e||d  || a1||b1||e1||d1  || a2||b2||c2||e2 || f2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'hF))):(4'h0);
                blue <= video_on?(pixel_y > 200? (a||b||c|e||d || a1||b1||e1||d1  ||a2||b2||c2||e2 || f2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0)) : 4'hF):(4'h0);
                end   
                
              end 
              //DSA
              if (change == 2)begin
                red <= video_on?(pixel_y < 200? 4'h0 : (a||b||c||e||f||g || a1||b1||d1||f1||g1  || a2||b2||c2||d2||e2||f2)?4'hF : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0) )):(4'h0);
                green = video_on?(pixel_y < 200? 4'h0 : (a||b||c||e||f||g  || a1||b1||d1||f1||g1  || a2||b2||c2||d2||e2||f2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'hF))):(4'h0);
                blue <= video_on?(pixel_y > 200? (a||b||c||e||f||g || a1||b1||d1||f1||g1  ||a2||b2||c2||d2||e2||f2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0)) : 4'hF):(4'h0);
                end 
              // CAL  
              if (change == 4)begin
                red <= video_on?(pixel_y < 200? 4'h0 : (a||b||e||g || a1||b1||c1||d1||e1||f1  || b2||e2||g2)?4'hF : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0) )):(4'h0);
                green = video_on?(pixel_y < 200? 4'h0 : (a||b||e||g  || a1||b1||c1||d1||e1||f1  || b2||e2||g2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'hF))):(4'h0);
                blue <= video_on?(pixel_y > 200? (a||b||e||g || a1||b1||c1||d1||e1||f1  ||b2||e2||g2)?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0)) : 4'hF):(4'h0);
                end  
              //LA
              if (change ==5)begin
                red <= video_on?(pixel_y < 200? 4'h0 : ( b||e||g || a1||b1||c1||d1||e1||f1 )?4'hF : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0) )):(4'h0);
                green = video_on?(pixel_y < 200? 4'h0 : (b||e||g  || a1||b1||c1||d1||e1||f1 )?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'hF))):(4'h0);
                blue <= video_on?(pixel_y > 200? (b||e||g  || a1||b1||c1||d1||e1||f1 )?4'h0 : (pixel_y>400-y1_loc && pixel_y<450-y1_loc && pixel_x>500-x_loc && pixel_x<585-x_loc  ? 4'hF: (pixel_y>400-y_loc && pixel_y<460-y_loc && pixel_x>300 && pixel_x<320 ? 4'h0 : 4'h0)) : 4'hF):(4'h0);
                end     
                
             
              
              //GAMEOVER SCREEN DISPLAY
              if (collision_led == 1 && btn == 0 && win_signal == 0)
              begin
              red <= video_on? (l1||l2||os1||os2||os3||os4||s1||s2||s3||s4||s5||t1||t2)? 4'h0:4'hF : 4'h0;
              blue <= video_on? (l1||l2||os1||os2||os3||os4||s1||s2||s3||s4||s5||t1||t2)? 4'h0:4'h0 : 4'h0;
              green <= video_on? (l1||l2||os1||os2||os3||os4||s1||s2||s3||s4||s5||t1||t2)? 4'h0:4'h0 : 4'h0;
              end
              
              //WIN GAME SCREEN DISPLAY
              if (collision_led == 0 && btn == 0 && win_signal == 1)
              begin
              red <= video_on?(w1||w2||w3||w4||o1||o2||o3||o4||n1||n2||n3)? 4'h0:4'hF : 4'h0;
              green <= video_on?(w1||w2||w3||w4||o1||o2||o3||o4||n1||n2||n3)? 4'h0:4'hF : 4'h0;
              blue <= video_on?(w1||w2||w3||w4||o1||o2||o3||o4||n1||n2||n3)? 4'h0:4'hF : 4'h0;
              
    
              end
              end   
        end

    


   

           
endmodule
    
 

