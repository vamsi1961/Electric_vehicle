clear  RMSE  out;
n=size(currentUDDS,1);

out=udds_drive_cycle_second_order_varying_parameter(voltageUDDS,currentUDDS,n,ocv_slope,ocv_inter,dt_D,R0_slope,R1_slope,R2_slope,R0_inter,R1_inter,R2_inter,C1_slope,C2_slope,C1_inter,C2_inter);
hold on
plot(tt_D,out,'r')
hold on
plot(tt_D,SOCUDDS/100,'b')
legend('SOC Estimated','True SOC');
ylabel('soc');
xlabel('time');
out=out';
error=(SOCUDDS/100)-out; 
%why dividing with 100? Because true soc 
%is in the range of 0-100, but the estimated soc
% in 0-1 range, for that divided with the factor
RMSE = sqrt(mean(error.^2))

