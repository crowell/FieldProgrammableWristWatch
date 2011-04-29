module debounceIndex (clock, noisy, clean);
   parameter DELAY = 500000;   // .01 sec with a 50MHz clock
   input clock, noisy;
   output clean;

   reg [18:0] count;
   reg new, clean;

   always @(posedge clock)
     if (noisy != new) begin new <= noisy; count <= 0; end
     else if (count == DELAY) clean <= new;
     else count <= count+1;
      
endmodule // debounce
