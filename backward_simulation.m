ckward asimtime = 10.89             % m/s^2
Speed = 22.22    
Acce = Speed/(time) % m/s
Angle = 0                       % degrees
Mass = 1470             % kg
Frontal_Area = 2.67             % m^2
WindSpeed = 0    
Wheel_Radius = 0.46052          % meters1
Rolling_Coefficient = 0.01
Drag_Coefficient = 0.3
Air_Density = 1.2

g = 9.81; % acceleration dus to gravity
DEG2RAD = pi / 180;
RAD2DEG = 180 / pi;
RADPERSEC_TO_RPM = 60 / (2*pi)

Traction_Force = (Mass * Acce) + (Mass * g * sin(Angle * DEG2RAD)) + (sign(Speed) * Mass * g * cos(Angle * DEG2RAD) * Rolling_Coefficient) + (sign(Speed + WindSpeed) * 0.5 * Air_Density * Drag_Coefficient * Frontal_Area * (Speed + WindSpeed)^2)
Traction_Torque = Traction_Force * Wheel_Radius
Traction_Power = Traction_Force * Speed 

Wheel_omega = Speed / Wheel_Radius
Wheels_RPM = Wheel_omega * RADPERSEC_TO_RPM

Transmission_Efficiency = 1
Transmission_GearRatio = 5.4
% gear ratio = motorspeed*radius of wheel * pi/(30*vmax)

% Electric machine performance
Motor_Shaft_Torque = Traction_Torque / (Transmission_Efficiency * Transmission_GearRatio) 
Motor_Power = Motor_Shaft_Torque * Wheel_omega
Motor_RPM = Wheels_RPM * Transmission_GearRatio
Motor_Angular_Velocity = Motor_RPM / RADPERSEC_TO_RPM