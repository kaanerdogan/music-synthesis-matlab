<strong>Ad Soyad:</strong> İsa Kaan Erdoğan <br/> <strong>Öğrenci Numarası:</strong> 030114028 <br/> <strong>Ders Adı:</strong> BIM - 311 Sinyal İşleme <br/> <strong>Proje:</strong> MATLAB ile Sentezleme<br/>
<div align="center">
![alt text](muzik/nota.png "DDA")
</div> <br/>
<h2>Sentezleme İçin Gerekli Sütunlar</h2>
Müziği sentezleyebilmek için verinin ~~1.~~ 2. 4. 6. ve 7. sütunlara ihtiyaç olduğunu düşünüyorum.
~~1.Sütun notanın başlangıcını belirtiyor. Bu sütunun 1. değerinden itibaren aldığımız bir döngü ile bütün notaları çaldırabiliriz.~~<br/>
(1.Sütun gereksiz kaldı. Yanlış algoritma length(parse) fonksiyonu ile düzeltildi.)<br/>
2.sütun tempo cinsinden süreyi belirtiyor. Notaların hızlı veya yavaş olarak çalınması gerektiği burada belirtiliyor. Harmonik olarak güzel bir müzik deneyimi yaşatmaz ancak aksatmadan da müziği çalabilmemizi sağlar.<br/>
4.sütun notaların değerlerini gösteriyor. Ufak bir hesaplama ile bu değerlerden o notaların frekanslarını çıkartıp frekanslar üzerinde işlem yapmamız gerekiyor. <br/>
6.sütun ilk notadan başlayarak o notanın kaçıncı saniyede çalındığını gösteriyor.<br/>
7.sütun ise notanın kaç saniye çalınacağını saniye cinsinden söylüyor. Yani 6. sütundaki değere 7. sütundaki değer her seferinde ekleniyor. <br/>
Başlangıç olarak bu sütunlar işimize yarayacak olan sütunlardır.<br/>

<h2>Kodlar Hakkında Açıklamalar</h2>

> note.m dosyası

```
parse=parseMusicXML('muzik/nota.musicxml');
```



> sentez.m dosyası


```
note; %note.m çağrılır. parse değişkeni burada

LoP = length(parse); %parse'ın uzunluğu alınır
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
Fs=44100;
Ts=1/Fs;
t=0:Ts:.4;
x = cos(2*pi*freq*t); 
sig = reshape(x',length(freq)*length(t),1);
sound(sig,Fs)
```

<br/>

