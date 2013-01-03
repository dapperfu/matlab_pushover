% Numerous additional exmaples for pushover. 
% All in cell mode to easily test.

%% ReadMe
% If you plan on using this more than once a day, please create your own
% application and API token: https://pushover.net/apps/build or use the
% email gateway.
% Get this from: https://pushover.net/login
userToken='';

%% Initial pushover setup
% Get the default options
opts=pushover;
% Set your user token.
opts.user=userToken;
% Save the user token
% It doesn't have to be entered every time.
pushover(opts);

%% Message priorities
clear opts;
% Ignores Quiet hours.
opts.priority=1;
pushover('High Priority 1',opts);
opts.priority='1';
pushover('High Priority 2',opts);
% Always deliver message quiet.
opts.priority=-1;
pushover('Low Priority 1',opts);
opts.priority='-1';
pushover('Low Priority 2',opts);

%% Message Timestamp
clear opts;
opts.timestamp='September 26, 1975';
pushover('Time Warp','It''s just a jump to the left',opts);
%%
opts.timestamp=datenum(2015,10,21,04,0,0);
pushover('Roads, where we''re going we don''t need roads.',opts);


%% Sound Tests
% Test each of the different notification sounds.
sounds={'bike','bugle','cashregister','classical','cosmic','falling','gamelan','incoming','intermission','magic','mechanical','pianobar','siren','spacealarm','tugboat'};
delay=1; % Delay between testing each sound.
for sound=sounds
    opts.sound=sound{1};
    opts.title='Sound Test';
    pushover(sound{1},opts);
    pause(delay);
end

%% Send through E-mail gateway using gmail
% Instructions from:
%   http://www.mathworks.com/support/solutions/en/data/1-3PRRDV/
% Comment out if you already have SMTP setup
mail='username@gmail.com';
password='password';
%
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
% Test that sendmail works properly first.
sendmail(mail,'Test from MATLAB','Hello! This is a test from MATLAB!');
% Send the message over pushover.
opts.token='';
opts.user=userToken;
pushover('emailSubject','emailTest',opts);
