<strong>Ad Soyad:</strong> İsa Kaan Erdoğan <br/> <strong>Öğrenci Numarası:</strong> 030114028 <br/> <strong>Ders Adı:</strong> BIM - 311 Sinyal İşleme <br/> <strong>Proje:</strong> MATLAB ile Sentezleme<br/>
<div align="center">
![alt text](/muzik/nota.png "DDA")
</div> <br/>
<h2>Sentezleme İçin Gerekli Sütunlar</h2>
Müziği sentezleyebilmek için verinin <ins>1.</ins> 2. 4. 6. ve 7. sütunlara ihtiyaç olduğunu düşünüyorum.
<ins>1.Sütun notanın başlangıcını belirtiyor. Bu sütunun 1. değerinden itibaren aldığımız bir döngü ile bütün notaları çaldırabiliriz.</ins><br/>
(1.Sütun gereksiz kaldı. Yanlış algoritma length(parse) fonksiyonu ile düzeltildi.)<br/>
2.sütun tempo cinsinden süreyi belirtiyor. Notaların hızlı veya yavaş olarak çalınması gerektiği burada belirtiliyor. Harmonik olarak güzel bir müzik deneyimi yaşatmaz ancak aksatmadan da müziği çalabilmemizi sağlar.<br/>
4.sütun notaların değerlerini gösteriyor. Ufak bir hesaplama ile bu değerlerden o notaların frekanslarını çıkartıp frekanslar üzerinde işlem yapmamız gerekiyor. <br/>
6.sütun ilk notadan başlayarak o notanın kaçıncı saniyede çalındığını gösteriyor.<br/>
7.sütun ise notanın kaç saniye çalınacağını saniye cinsinden söylüyor. Yani 6. sütundaki değere 7. sütundaki değer her seferinde ekleniyor. <br/>
Başlangıç olarak bu sütunlar işimize yarayacak olan sütunlardır.<br/>

<h2>Kodlar Hakkında Açıklamalar</h2>

> note.m dosyası

```parse=parseMusicXML('muzik/nota.musicxml');



> sentez.m dosyası

```note;

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
```

<br/>
Şimdilik tek ses çalınıyor. For döngüsü üzerinde çalışıyorum.
