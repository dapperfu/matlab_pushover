matlab_pushover
===============
% PUSHOVER - Push notifications to the <a href="http://pushover.net">Pushover</a> service.
% 
% pushover
%   Prints this help, the available options for the 'sound' setting and the
%   currently saved (or default) preferences.
%
% OPTS=pushover
%   Returns a structure OPTS with the current default options.
%
% pushover(OPTS)
%   Saves the structure options as defaults.
%
% [retrStr,status]=pushover(TITLE,MESSAGE,OPTS)
%                 =pushover(TITLE,MESSAGE)
%                 =pushover(MESSAGE,OPTS)
%   OPTS - settings to send a message.
%   MESSAGE - Message to send. Limited to 512 characters.
%
% OPTS - Default Options.
%           token: 'DogErTJffntjvzbNXMVn3EoycDOWdN'
%            user: ''
%         message: ''
%          device: ''
%           title: ''
%             url: ''
%       url_title: ''
%        priority: ''
%       timestamp: ''
%           sound: 'pushover'
% For full description of options see the <a href="https://pushover.net/api">Pushover REST API</a>
%
% timestamp is in Matlab serial date instead of Unix timestamp. This allows
%   for better integration with Matlab. If timestamp is a string 'datenum'
%   is run to turn it into a serial date.
%
% By default 'title' defaults to the calling function if empty. If pushover is
%   called within myApp.m the title is set to 'myApp'. If called from the
%   command line it defaults to empty.
%
% If API token is empty (opts.token='') then the falls back to sendmail.
%   (sendmail must be configured: <a href="http://www.mathworks.com/support/solutions/en/data/1-3PRRDV/">sendmail setup</a>)
%
% Pushover apps are limited to 7,500. If you plan on using pushover.m,
%   please create your own application at <a href="https://pushover.net/apps/build">https://pushover.net/apps/build</a> (<a href="http://www.mathworks.com/matlabcentral/fileexchange/24085">Matlab Icon</a>)
%
% Pushover Clients: <a href="https://pushover.net/clients/android">Android</a> & <a href="https://pushover.net/clients/ios">iOS</a>
%
% See also urlread, sendmail, pushoverExamples
%
% Examples:
% % Minimum required to send message.
% opts.user='ohterejqucyumllhnnvuqjvnjywoqp'; % From your <a href="https://pushover.net/login">Dashboard</a>
% pushover('Hello World!',opts);
%
% % Set default device to phone and sound to 'Piano Bar'.
% opts.sound='pianobar';
% opts.device='phone';
% pushover(opts);
%
% % Send message via e-mail gateway with title FooBar
% opts.token='';
% pushover('Hello World','FooBar',opts);
%
% To clear all preferences:
% rmpref('pushover');
