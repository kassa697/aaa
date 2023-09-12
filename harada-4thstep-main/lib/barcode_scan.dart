import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodeScanScreen(),
    );
  }
}

class BarcodeScanScreen extends StatefulWidget {
  @override
  _BarcodeScanScreenState createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  String readData = "";
  String typeData = "";
  String imageUrl = "";

  Future<void> scan() async {
    try {
      var scan = await BarcodeScanner.scan();
      setState(() {
        readData = scan.rawContent;
        typeData = scan.format.name;
        imageUrl = _getImageUrl(scan.rawContent);
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          readData = 'Camera permissions are not valid.';
        });
      } else {
        setState(() {
          readData = 'Unexplained error: $e';
        });
      }
    } on FormatException {
      setState(() {
        readData =
            'Failed to read (I used the back button before starting the scan).';
      });
    } catch (e) {
      setState(() {
        readData = 'Unknown error: $e';
      });
    }
  }

  String _getImageUrl(String barcode) {
    // ここでは仮のURLを返すロジックを実装しています
    // 実際には、バーコードに関連する画像のURLを取得する方法を実装してください
    return 'https://example.com/images/$barcode.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('バーコード'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // テキストをセンターに配置する
            children: [
              Text(
                'バーコードの種類: $typeData',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // テキストをセンターに配置する
              ),
              const SizedBox(height: 8.0),
              Text(
                'スキャン日時: ${DateTime.now().toString().substring(0, 19)}',
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center, // テキストをセンターに配置する
              ),
              const SizedBox(height: 16.0),
              const Text(
                '商品の詳細:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                '詳細情報がここに表示されます。',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                '読み取ったバーコード番号:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                readData,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // 検索処理を実行
                  _performSearch(readData);
                },
                child: const Center(child: Text('検索')),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        child: const Icon(Icons.camera_alt),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _performSearch(String query) {
    // 検索処理を実装
    // ここではGoogleの検索を仮定しています
    // 必要なライブラリやAPIキーなどを使用して実際の検索処理を行ってください
    print('Performing search for: $query');
    // 以下に検索処理のコードを記述します
    // ...
  }
}
