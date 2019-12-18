note;

LoP = length(parse);

midiChannel=parse(:,3);
midiPitch=parse(:,4);
midiVelocity=parse(:,5);
noteOnset = parse(:,6);
noteDuration = parse(:,7);
timeSigniture=parse(:,10);

freq=(440/32)*2.^((midiPitch-9)/12);

FoF=freq(1,:);
FoS=freq(2,:);
FoT=freq(3,:);
FoF2=freq(4,:);

Fs = 44100;
T=1/Fs;
tt = 0:T:(noteDuration);

y = cos(2*pi*FoF*tt);
sound(y, Fs)

% 
% for i=0:LoP
%     for y=0:LoP
%         
%     end
% end
% 
% y = zeros(LoP);
% 
% for c = 1:LoP
%     for r = 1:LoP
%         y(r,c) = cos(2*pi*freq*tt);
%     end
%     sound(y(r,c), Fs);
% end

