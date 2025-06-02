%script for setting parameters of the model of LED 2022


%% PWM
%fsw: switching frequency [Hz]
fsw=10000

%% motor parameter
% r: motor phase resistance [Ohm]
winding_resistance = 0.12; % [Ohm] %
%l: motor phase inductance [H]
winding_inductance = 0.0245 * 10^(-3); % [Henry] %

%kt: torque constant [Nm/A]
kt=16.7*10^(-3);
tau=winding_inductance/winding_resistance;
s = tf('s');
Gc = 1/(winding_inductance*s + winding_resistance); % Motor Eq Circuit Transfer Function. %

supply_voltage = 18  ; % [Volt] %
rotor_inertia = 139; % [g⋅cm2] %
load_inertia = 174; % [g⋅cm2] %
total_inertia = (rotor_inertia + load_inertia) * 10^(-7); % [kg⋅m2] %

load_torque_slope = 6.409*10^(-5); % [Nm/(rad/s)] ≡ [Nm⋅s] %

kt=16.7*10^(-3)

%% source circuit parameters
%rs: source  resistance [Ohm]
rs=0.18;
%ls: source inductance [H]
ls=10e-6;

%%% SPEED REFERENCE of the duty cycle for the repeating sequence%%%
%time, speed value pairs 
time=[0 0.2 0.4 0.6 0.8 1];
value=[0 100 125 -50 -50 0];
%plot(time,value)
period_duty=max(time);
%ki =0.0025;

ki=1

tau_cl = winding_resistance/ki;

kload=6.409*10^(-5);
Ki_w =kload/(4*tau_cl);
tau_mec=total_inertia/kload;

kp_w =tau_mec*Ki_w




