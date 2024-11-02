import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ödeme Sayfası',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCreditCardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ödeme Sayfası",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            const Color.fromARGB(255, 17, 140, 197), // AppBar rengi
      ),
      body: SingleChildScrollView(
        // Ekranın kaydırılabilir olmasını sağlar
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kullanıcı Bilgileri
              Text("Kullanıcı Bilgileri",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: "Ad Soyad", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: "Telefon Numarası",
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),

              // Ödeme Yöntemi Seçimi
              Text("Ödeme Yöntemi Seçin",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isCreditCardSelected
                            ? Colors.green
                            : Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          isCreditCardSelected = false;
                        });
                      },
                      child: Text(
                        "Nakit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isCreditCardSelected ? Colors.green : Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          isCreditCardSelected = true;
                        });
                      },
                      child: Text(
                        "Kredi Kartı",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Kredi Kartı Bilgileri
              if (isCreditCardSelected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kredi Kartı Bilgileri",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Kredi kartı arka plan rengi
                        borderRadius:
                            BorderRadius.circular(10), // Kenar yuvarlama
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Gölge rengi
                            offset: Offset(0, 2), // Gölgenin kayma miktarı
                            blurRadius: 4, // Gölgenin bulanıklığı
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Kart Numarası",
                              hintText:
                                  "XXXX XXXX XXXX XXXX", // Kart numarası için örnek
                              border:
                                  InputBorder.none, // Kenar çizgilerini kaldır
                              filled: true,
                              fillColor: Colors.white, // İçerik arka planı
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Kart Üzerindeki İsim",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Son Kullanma Tarihi (AA/YY)",
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "CVV",
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20),

              // Sipariş Özeti
              Text("Sipariş Özeti",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ürün 1 - 50 TL"),
                    SizedBox(height: 5),
                    Text("Ürün 2 - 30 TL"),
                    Divider(),
                    Text("Toplam: 80 TL",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Ödeme Tamamlama Butonu
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor:
                const Color.fromARGB(255, 236, 149, 26), // Alt bar rengi
          ),
          onPressed: () {
            // Ödeme Tamamlama İşlemleri
          },
          child: Text("Ödemeyi Tamamla",
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
