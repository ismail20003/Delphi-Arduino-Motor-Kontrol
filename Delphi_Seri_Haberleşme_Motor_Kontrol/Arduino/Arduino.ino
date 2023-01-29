//motor pinleri belirleniyor
const int m_p = 8;
const int m_p1 = 9;
const int m_h = 3;
//Dögüyü tek sefer yapmak için degişkenler sıfır olarak tanımlanıyor
int g = 0;
int d = 0;
int i = 0;
int s = 0;
// parseInt komutu ile gelen strinn tipindeki veriyi integer tipine çevrildi
int veri;
int hiz;

void setup() {
  //Seri haberleşme başlatıldı
  Serial.begin(9600);
  pinMode(m_p, OUTPUT);
  pinMode(m_p1, OUTPUT);
  pinMode(hiz, OUTPUT);
}

void loop() {
  // Seri portdan gelen string veriyi 'parseInt' komutu ile okuyup ınteger tipinde çevirip 'veri' değişkenine yazdık
  while (Serial.available()) {
    veri = Serial.parseInt();
    delay(10);
  }
  // 'veri' değişkeninin değeri eğer 1 ise çalışır;
  if (veri == 1) {
    // 'veri' eğer 1 ise while dögüsüne geçer ve tek sefer çalıştırmak için tanımladıgımız değişken '0' ise çalışır
    while (g == 0) {
      // Seri ekrana motor durumunu yazıyoruz
      Serial.println("Motor geri calisior");
      // Motor pinleri ileri veya geri şeklinde çalışması için 'diğitalWrite' komutu ile çıkış veririz
      digitalWrite(m_p, 0);
      digitalWrite(m_p1, 1);
      while (hiz <= 254) {
        hiz++;
        analogWrite(3, hiz);
        delay(50);
      }

      // 'veri=1' ise g değişkeni '1' olur ve '0' olana kadar çalışmaz
      g = 1;
      // Motor çalıştıgı zamanki while değişkenini bir daha durdurmak için değişkeni '0' yapar
      d = 0;
      s = 0;
    }
  }
  // 'veri' değişkeninin değeri eğer 2 ise çalışır
  else if (veri == 2) {
    // 'veri' eğer '2' ise while dögüsüne geçer ve tek sefer çalıştırmak için tanımladıgımız değişken '0' ise çalışır
    while (i == 0) {
      // Seri ekrana motor durumunu yazıyoruz
      Serial.println("Motor ileri calisior");
      // Motor pinleri ileri veya geri şeklinde çalışması için 'diğitalWrite' komutu ile çıkış veririz
      digitalWrite(m_p, 1);
      digitalWrite(m_p1, 0);
      while (hiz <= 254) {
        hiz++;
        analogWrite(3, hiz);
        delay(50);
      }
      // 'veri=2' ise i değişkeni '1' olur ve '0' olana kadar çalışmaz
      i = 1;
      // Motor çalıştıgı zamanki while değişkenini bir daha durdurmak için değişkeni '0' yapar
      d = 0;
      s = 0;
    }
  }
  // 'veri' değişkeninin değeri eğer 0 ise çalışır
  else if (veri == 0) {
    // 'veri' eğer '0' ise while dögüsüne geçer ve tek sefer çalıştırmak için tanımladıgımız değişken '0' ise çalışır
    while (d == 0) {
      // Motor pinleri ileri veya geri şeklinde çalışması için 'diğitalWrite' komutu ile çıkış veririz
      digitalWrite(m_p, 0);
      digitalWrite(m_p1, 0);
      hiz = 0;
      // Seri ekrana motor durumunu yazıyoruz
      Serial.println("Motor durdu");
      // 'veri=0' ise i değişkeni '1' olur ve '0' olana kadar çalışmaz
      d = 1;
      // Motor durduğu zamanki while değişkenini bir daha çalıştırmak için değişkeni '0' yapar
      g = 0;
      i = 0;
      s = 0;
    }
  } else if (veri == 4) {
    // 'veri' eğer '4' ise while dögüsüne geçer ve tek sefer çalıştırmak için tanımladıgımız değişken '0' ise çalışır
    while (s == 0) {
      // Motor pinlerini kapatıyor
      digitalWrite(m_p, 0);
      digitalWrite(m_p1, 0);
      // 'veri=4' ise s değişkeni '1' olur ve '0' olana kadar çalışmaz
      s = 1;
      // Motor durduğu zamanki while değişkenini bir daha çalıştırmak için değişkeni '0' yapar
      g = 0;
      i = 0;
      d = 0;
    }
  }
}