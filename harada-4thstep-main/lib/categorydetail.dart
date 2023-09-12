import 'package:flutter/material.dart';
import 'categoryitem.dart';
import 'home_page.dart';
import 'map_screen.dart';
import 'search_history_page.dart';
import 'subcategorydetail.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;
  final String title;

  const CategoryDetailPage({
    Key? key,
    required this.category,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'カテゴリー: $category',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'タイトル: $title',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              // 他の詳細情報を追加する
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // マップアイコンを選択済みにするためのインデックス
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '検索履歴',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey, // 選択されていないアイコンの色
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapScreen(
                  PartsModel: '近接スイッチ',
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchHistoryPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
