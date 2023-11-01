function out=udds_drive_cycle_second_order_varying_parameter(voltageUDDS,currentUDDS,n,ocv_slope,ocv_inter,dt_D,R0_slope,R1_slope,R2_slope,R0_inter,R1_inter,R2_inter,C1_slope,C2_slope,C1_inter,C2_inter)
clear X P C s   soc_updated gain

P=[0 0 0;0 0 0;0 0 10];  %covariance matrix of estimation initiallization
soc_updated = zeros(1,n);
X=[0;0;0.1];  % state initialization
X_update=X;
Q=[0 0 0;0 0 0;0 0 0.001];  %process noise
I=[1 0 0;0 1 0;0 0 1]; % identity matrix of 3x3 size
s=X(3);
C=[0 0 0];  % output transition matrix, will discuss later
R=300; % covariance matrix of measurement, 
%get from the sensor datasheet ,actually when taking gaussian 
%ditribution of the measurement,it is the square root of the spead
%(standard deviationa concept)

for i=2:n
 
    if(s>=0.95)
       
      OCV_slp=ocv_slope(1);
      OCV_int=ocv_inter(1);
      R0= R0_slope(1)*s+R0_inter(1);  
      R1= R1_slope(1)*s+R1_inter(1);  
      R2= R2_slope(1)*s+R2_inter(1);  
      C1= C1_slope(1)*s+C1_inter(1);  
      C2= C2_slope(1)*s+C2_inter(1);
      
      
    elseif(s<0.95 && s>=0.90)
    
     
      R0= R0_slope(2)*s+R0_inter(2);  
      R1= R1_slope(2)*s+R1_inter(2);  
      R2= R2_slope(2)*s+R2_inter(2);  
      C1= C1_slope(2)*s+C1_inter(2);  
      C2= C2_slope(2)*s+C2_inter(2);   
      OCV_slp=ocv_slope(2);
      OCV_int=ocv_inter(2);
      
              
    elseif(s<0.90 && s>=0.80)
      
      R0= R0_slope(3)*s+R0_inter(3);  
      R1= R1_slope(3)*s+R1_inter(3);  
      R2= R2_slope(3)*s+R2_inter(3);  
      C1= C1_slope(3)*s+C1_inter(3);  
      C2= C2_slope(3)*s+C2_inter(3);   
      OCV_slp=ocv_slope(3);
      OCV_int=ocv_inter(3);
      
    elseif(s<0.80 && s>=0.70)
  
      R0= R0_slope(4)*s+R0_inter(4);  
      R1= R1_slope(4)*s+R1_inter(4);  
      R2= R2_slope(4)*s+R2_inter(4);  
      C1= C1_slope(4)*s+C1_inter(4);  
      C2= C2_slope(4)*s+C2_inter(4);   
      OCV_slp=ocv_slope(4);
      OCV_int=ocv_inter(4);
      
    elseif(s<0.70 && s>=0.60)
     
      R0= R0_slope(5)*s+R0_inter(5);  
      R1= R1_slope(5)*s+R1_inter(5);  
      R2= R2_slope(5)*s+R2_inter(5);  
      C1= C1_slope(5)*s+C1_inter(5);  
      C2= C2_slope(5)*s+C2_inter(5);   
      OCV_slp=ocv_slope(5);
      OCV_int=ocv_inter(5);
     
      
    elseif(s<0.60 && s>=0.50)
    
      R0= R0_slope(6)*s+R0_inter(6);  
      R1= R1_slope(6)*s+R1_inter(6);  
      R2= R2_slope(6)*s+R2_inter(6);  
      C1= C1_slope(6)*s+C1_inter(6);  
      C2= C2_slope(6)*s+C2_inter(6);  
      OCV_slp=ocv_slope(6);
      OCV_int=ocv_inter(6);
     
      
    elseif(s<0.50 && s>=0.40)
   
      R0= R0_slope(7)*s+R0_inter(7);  
      R1= R1_slope(7)*s+R1_inter(7);  
      R2= R2_slope(7)*s+R2_inter(7);  
      C1= C1_slope(7)*s+C1_inter(7);  
      C2= C2_slope(7)*s+C2_inter(7);   
      OCV_slp=ocv_slope(7);
      OCV_int=ocv_inter(7);
     
           
    elseif(s<0.40 && s>=0.30)
       
      R0= R0_slope(8)*s+R0_inter(8);  
      R1= R1_slope(8)*s+R1_inter(8);  
      R2= R2_slope(8)*s+R2_inter(8);  
      C1= C1_slope(8)*s+C1_inter(8);  
      C2= C2_slope(8)*s+C2_inter(8);   
      OCV_slp=ocv_slope(8);
      OCV_int=ocv_inter(8);
      
    elseif(s<0.30 && s>=0.25)
    
      R0= R0_slope(9)*s+R0_inter(9);  
      R1= R1_slope(9)*s+R1_inter(9);  
      R2= R2_slope(9)*s+R2_inter(9);  
      C1= C1_slope(9)*s+C1_inter(9);  
      C2= C2_slope(9)*s+C2_inter(9);   
      OCV_slp=ocv_slope(9);
      OCV_int=ocv_inter(9);
    
    elseif(s<0.25 && s>=0.20)
         
      R0= R0_slope(10)*s+R0_inter(10);  
      R1= R1_slope(10)*s+R1_inter(10);  
      R2= R2_slope(10)*s+R2_inter(10);  
      C1= C1_slope(10)*s+C1_inter(10);  
      C2= C2_slope(10)*s+C2_inter(10);   
      OCV_slp=ocv_slope(10);
      OCV_int=ocv_inter(10);
    
      
    elseif(s<0.20 && s>=0.15)
      s1=0.20;
      R0= R0_slope(10)*s1+R0_inter(10);  
      R1= R1_slope(10)*s1+R1_inter(10);  
      R2= R2_slope(10)*s1+R2_inter(10);  
      C1= C1_slope(10)*s1+C1_inter(10);  
      C2= C2_slope(10)*s1+C2_inter(10);   
      OCV_slp=ocv_slope(11);
      OCV_int=ocv_inter(11);
    
    elseif(s<0.15 && s>=0.10)
    
      s1=0.20;    
      R0= R0_slope(10)*s1+R0_inter(10);  
      R1= R1_slope(10)*s1+R1_inter(10);  
      R2= R2_slope(10)*s1+R2_inter(10);  
      C1= C1_slope(10)*s1+C1_inter(10);  
      C2= C2_slope(10)*s1+C2_inter(10);   
      OCV_slp=ocv_slope(12);
      OCV_int=ocv_inter(12);
      
    elseif(s<0.10 && s>=0.05)
          
      s1=0.20;    
      R0= R0_slope(10)*s1+R0_inter(10);  
      R1= R1_slope(10)*s1+R1_inter(10);  
      R2= R2_slope(10)*s1+R2_inter(10);  
      C1= C1_slope(10)*s1+C1_inter(10);  
      C2= C2_slope(10)*s1+C2_inter(10);   
      OCV_slp=ocv_slope(13);
      OCV_int=ocv_inter(13);
      
    elseif(s<0.05 && s>=0)
    
      s1=0.20;    
      R0= R0_slope(10)*s1+R0_inter(10);  
      R1= R1_slope(10)*s1+R1_inter(10);  
      R2= R2_slope(10)*s1+R2_inter(10);  
      C1= C1_slope(10)*s1+C1_inter(10);  
      C2= C2_slope(10)*s1+C2_inter(10);   
      OCV_slp=ocv_slope(14);
      OCV_int=ocv_inter(14);              
       
    end

    %above loop is for correctly extracting R1,R2,R0,C1,C2 parameters 
    A=[(-1*dt_D(i-1)/(R1*C1))+1 0 0;0 (-1*dt_D(i-1)/(R2*C2))+1 0;0 0 1]; 
    % state transition matrix (part of state space)
    B=[dt_D(i-1)/C1;dt_D(i-1)/C2;dt_D(i-1)/(3600*3)];
    X_prediction=A*X+B*currentUDDS(i-1);  
    %state prediction step same as the basic state space equation
    P=A*P*A'+Q; 
    %covariance matrx of estimation (P) ,its prediction
    C=[1 1 OCV_slp]; 
    %The need of the C matrix is clear from the next line.
    y=C*X+R0*currentUDDS(i)+OCV_int;  
    %C matrix convert the state X to the output(voltage) 
    L=(P*C')/(C*P*C'+R); 
    % L is the Kalman gain ,it is obtained in such a way that 
    %it minimize the P vlaue(estimation error)
    X= X_prediction;
    X_update=X+L*(voltageUDDS(i)-y); 
    % state updation, with voltage measurement from sensor(voltageUDDS)
    % and predicted voltage based on the state space(y) 
    % also using Kalman gain L
    soc_updated(i)=X_update(3);   
    %just to get output soc for demonstration purpose
    P=(I-(L*C))*P;  
    %covariance matrix updation, it is part of Kalman filter algorithm
    X=X_update;
    s=X(3);
    
end
  out=soc_updated;
   
 
  
   
   
 



