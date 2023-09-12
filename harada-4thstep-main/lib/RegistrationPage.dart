import 'package:flutter/material.dart';
import 'login_page.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);

  @override
  _NewRegistrationPageState createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  bool _passwordVisible = false; // パスワードの可視性を管理するフラグ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'), // 新規登録ページのタイトル
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Center(
        // 修正: Centerで全体を中央に配置
        child: SingleChildScrollView(
          // SingleChildScrollViewを追加
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'ユーザー名またはメール', // ユーザー名またはメールの入力フィールドのラベル
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  obscureText: !_passwordVisible, // パスワードの可視性をフラグで制御
                  decoration: InputDecoration(
                    labelText: 'パスワード', // パスワードの入力フィールドのラベル
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12), // パディングを調整
                      minimumSize: const Size(200, 48) // 最小サイズの設定
                      ),
                  onPressed: () {
                    // 登録ボタンが押された時の処理
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    '登録',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
