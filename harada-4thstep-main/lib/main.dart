import 'package:flutter/material.dart';
import 'RegistrationPage.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'barcode_scan.dart';
import 'firebase_options.dart';
import 'item_registration.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        const Color.fromARGB(255, 230, 80, 228).withOpacity(1.0);
    const fabColor = Colors.white; // FloatingActionButtonの背景色を白色に設定

    return MaterialApp(
      title: 'Parts Finder App',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 20,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: fabColor,
          foregroundColor:
              primaryColor, // FloatingActionButtonのアイコンの色を背景と同じ淡い紫色に設定
        ),
      ),
      home: const MyHomePage(title: 'parts Finder'),
      routes: {
        '/new_registration': (context) =>
            const NewRegistrationPage(), // 新規登録ページへのルートを設定
        '/login': (context) => const LoginPage(), // ログイン画面へのルートを設定
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80), // 上部の間隔を調整
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Parts Finder', // パーツファインダーテキスト
                  style: TextStyle(
                    fontFamily: 'Magneto',
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 100),
                Text(
                  'パーツファインダー', // 「パーツファインダー」テキスト
                  style: TextStyle(
                    fontFamily: 'BIZUDGothic',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3),
                Text(
                  'へようこそ', // 「へようこそ」テキスト
                  style: TextStyle(
                    fontFamily: 'BIZUDGothic',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100),
                Text(
                  '「いま」お探しの物を見つける\nサポートをいたします',
                  // 「「いま」お探しの物を見つける\nサポートをいたします」テキスト
                  style: TextStyle(
                    fontFamily: 'BIZUDGothic',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/login',
              ); // ログインページに遷移
            },
            elevation: 2.0,
            fillColor: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            constraints: const BoxConstraints(minWidth: 200),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                'ログイン',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/new_registration',
              ); // 新規登録ページに遷移
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '新規登録', // 新規登録ボタンのテキスト
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  ' こちら', // "こちら"のテキスト
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
