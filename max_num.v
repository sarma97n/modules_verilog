module max_num;
integer a[0:4];
integer num,i,idx;

initial begin
    a[0]=2; a[1]=5; a[2]=7; a[3]=11; a[4]=1;
    num=a[0];
    idx=0;

    for(i=1; i<5; i=i+1)
    begin
        if (a[i] >num) begin
            num = a[i];
            idx = i;
        end
    end
    $display("the maximum number in the array is %d and is in the index %d",num,idx);

    $finish;
end
endmodule