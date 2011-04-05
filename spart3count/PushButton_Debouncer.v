module PushButton_Debouncer(clk, PB, PB_state, PB_up, PB_down);
input clk;  // "clk" is the clock
input PB;  // "PB" is the glitched, asynchronous, active low push-button signal

output PB_state;  // 1 while the push-button is active (down)
output PB_down;  // 1 when the push-button goes down (just pushed)
output PB_up;  // 1 when the push-button goes up (just released)

// First use two flipflops to synchronize the PB signal the "clk" clock domain
reg PB_sync_0;  always @(posedge clk) PB_sync_0 <= ~PB;  // invert PB to make PB_sync_0 active high
reg PB_sync_1;  always @(posedge clk) PB_sync_1 <= PB_sync_0;

// Next declare a 16-bits counter
reg [15:0] PB_cnt;

// When the push-button is pushed or released, we increment the counter
// The counter has to be maxed out before we decide that the push-button state has changed

reg PB_state;  // state of the push-button (0 when up, 1 when down)
wire PB_idle = (PB_state==PB_sync_1);
wire PB_cnt_max = &PB_cnt;	// true when all bits of PB_cnt are 1's

always @(posedge clk)
if(PB_idle)
    PB_cnt <= 0;  // nothing's going on
else
begin
    PB_cnt <= PB_cnt + 1;  // something's going on, increment the counter
    if(PB_cnt_max) PB_state <= ~PB_state;  // if the counter is maxed out, PB changed!
end

wire PB_down = ~PB_state & ~PB_idle & PB_cnt_max;  // true for one clock cycle when we detect that PB went down
wire PB_up   =  PB_state & ~PB_idle & PB_cnt_max;  // true for one clock cycle when we detect that PB went up

endmodule
