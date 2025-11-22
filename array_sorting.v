module array_sorting;
reg [7:0]a[5:0];
integer i,j;
reg [7:0]temp;

initial begin
    a[0]=8'd25; a[1]=8'd45; a[2]=8'd54; a[3]=8'd12; a[4]=8'd6;
    $display("unsorted array:");
    for (i=0; i<5; i=i+1)
        $display($time, "\t%d",a[i]);
        for (i=0; i<5; i=i+1) begin
            for (j=0; j<5-i; j=j+1) begin
                if (a[j] > a[j+1]) begin
                    temp=a[j];
                    a[j]=a[j+1];
                    a[j+1]=temp;
                end
            end
        end
        $display("Sorted array:");
        for (i=0; i<5; i=i+1)
        $display($time, "\t%d",a[i]);
end
endmodule