note; %note.m çağrılır. parse değişkeni burada

LoP = length(parse); %parse değişkeninin uzunluğu alınır

midiChannel=parse(:,3); % İlgili sütun değişkene atanır
midiPitch=parse(:,4); % İlgili sütun değişkene atanır
midiVelocity=parse(:,5); % İlgili sütun değişkene atanır
noteOnset = parse(:,6); % İlgili sütun değişkene atanır
noteDuration = parse(:,7); % İlgili sütun değişkene atanır
timeSigniture=parse(:,10); % İlgili sütun değişkene atanır

freq=(440/32)*2.^((midiPitch-9)/12); % midi Pitch den frekans çevirme hesaplaması şarkının bütün notaların frekansları bu değişkene atanır

VoFF=freq(1,:); %İlk değer seçilir
VoFL=freq(end); %Son değer seçilir.
VoNF=noteDuration(1,:); %İlk değer seçilir
VoNL=noteDuration(end); %Son değer seçilir
%
%freq değişkeninin ilk değeri bir değişkene atanır. Amaç döngüde i'nin ilk
%değerini belirlemek. 
%
%Başka bir değişkene ise freq değişkeninin son değeri
%atanır. Amaç i'nin son değerini belirlemek
%
%tt değişkeni içerisinde kullanacağımız notaların süreleri olan
%noteDuration için ise ilk değeri VoNF'ye son değeri VoNL'ye olmak
%koşuluyla atandı.
%
%
Fs = 44100; %44100 Hz seçilir
T=1/Fs; 
% tt = 0:T:(noteDuration);

%Son olarak gerekli döngü hazırlanır.
for i=VoNF:VoNL
    tt = 0:T:i;
    for j=VoFF:VoFL
        y=cos(2*pi*j*tt);
    end
    sound(y, Fs)
end
% FoF=freq(1,:);
% FoS=freq(2,:);
% FoT=freq(3,:);
% FoF2=freq(4,:);

% y = cos(2*pi*FoF*tt);


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

