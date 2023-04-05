module synchronous_decimal_counter(
  input clk,         // clock input
  input rst,         // reset input
  input up_down,     // direction input (0 for down, 1 for up)
  input load,        // load input
  input start,       // start input
  input stop,        // stop input
  output reg [7:0] count  // output count (8-bit binary)
);

reg count_enable;        // enable signal for count mode
reg [7:0] saved_count;   // saved count value when stopped
reg resume_enable;       // enable signal for resuming count

always @(*) begin
  if (load || start || stop) begin   // load, start, or stop mode
    count_enable = 0;                // disable count mode
  end else if (resume_enable) begin  // resume mode
    count_enable = 1;                // enable count mode
  end
end

always @(posedge clk) begin
  if (rst) begin
    if (up_down) begin   // up mode
      count <= 8'b0000_0000;  // set count to 0
    else begin            // down mode
      count <= 8'b1001_1001;  // set count to 99 (decimal)
    end
    saved_count <= count;    // save count value
    resume_enable <= 0;      // disable resume mode
  end else begin
    if (load) begin      // load mode
      if (up_down) begin   // up mode
        count <= 8'b1001_0000;  // load count with 90 (decimal)
      else begin            // down mode
        count <= 8'b0000_1010;  // load count with 10 (decimal)
      end
      saved_count <= count;     // save count value
      resume_enable <= 0;       // disable resume mode
    end else if (start) begin   // start mode
      resume_enable <= 1;       // enable resume mode
    end else if (stop) begin    // stop mode
      saved_count <= count;     // save count value
      resume_enable <= 0;       // disable resume mode
    end else begin       // count mode
      if (count_enable) begin
        if (up_down) begin   // up mode
          count <= count + 1;     // increment count
        else begin             // down mode
          count <= count - 1;     // decrement count
        end
      end
    end
  end
end

always @(posedge clk) begin
  if (resume_enable) begin   // resume mode
    count <= saved_count;    // restore saved count value
  end
end

endmodule
