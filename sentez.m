note; %note.m çağrılır. parse değişkeni burada

LoP = length(mxml); %mxml'in uzunluğu alınır
midiChannel = mxml(:,3); % İlgili sütun, değişkene atanır
midiPitch = mxml(:,4); % İlgili sütun, değişkene atanır
midiVelocity = mxml(:,5); % İlgili sütun, değişkene atanır
noteOnset = mxml(:,6); % İlgili sütun, değişkene atanır
noteDuration = mxml(:,7); % İlgili sütun, değişkene atanır
timeSigniture = mxml(:,10); % İlgili sütun, değişkene atanır

freq=(440/32)*2.^((midiPitch-9)/12); % midi Pitch den frekans çevirme hesaplaması. Şarkının bütün notaların frekansları bu değişkene atanır


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
Fs=44100;
Ts=1/Fs;
t=0:Ts:.4;
x = cos(2*pi*freq*t); 
sig = reshape(x',length(freq)*length(t),1);
sound(sig,Fs)
