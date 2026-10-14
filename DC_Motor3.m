% Vehicle and Motor Parameters
m_tram = 15000; % [kg]
m_passengers = 130 * 80; % [kg]
m_total = m_tram + m_passengers;

rho = 13/74; % Gearbox ratio
d = 0.68; % Wheel diameter [m]
beta = 0.81; % Friction [Nms]

% Electrical Parameters
Ra = 0.39; % [Ohm]
tau_a = 10e-3; % [s]
La = tau_a * Ra; % [H]
Kt = 1.06; % [Nm/A]

Re = 12; % [Ohm]
tau_e = 0.1; % [s]
Le = tau_e * Re; % [H]
I_en = 5;
V_en = 60;

% Inertia calculation
Jeq = m_total * (rho^2 * d^2) / 4;

% Nominal values for Field Weakening logic
Omega_b = 970 * (2*pi/60); % Base speed in rad/s

V_r = Omega_b * rho * d/2; %Rated speed [m/s]
V_max = 42 * 1000/3600; %[m/s]
Ia_max = 156;
En = 600-Ra*156;
%% PI tuning frequencies
wc_i_a = 100;   % armature current loop crossover [rad/s]
wc_i_e = 10;    % excitation current loop crossover [rad/s]
wc_w   = 1;     % speed loop crossover [rad/s]

s = tf('s');

%% Plants
Ga = 1/(La*s + Ra);          % armature current plant
Ge = 1/(Le*s + Re);          % excitation current plant
Gw = 1/(Jeq*s + beta);       % speed mechanical plant
%%
opt_a = pidtuneOptions('CrossoverFrequency', wc_i_a, 'PhaseMargin', 80);
opt_e = pidtuneOptions('CrossoverFrequency', wc_i_e, 'PhaseMargin', 80);
opt_M = pidtuneOptions('CrossoverFrequency', wc_w, 'PhaseMargin', 80);
%% PID tuner / pidtune
Ca = pidtune(Ga,'PI',opt_a);
Ce = pidtune(Ge,'PI',opt_e);
Cw = pidtune(Gw,'PI',opt_M);

%% 
Kp_a = Ca.Kp;
Ki_a = Ca.Ki;

Kp_e = Ce.Kp;
Ki_e = Ce.Ki;

Kp_w = Cw.Kp;
Ki_w = Cw.Ki;


