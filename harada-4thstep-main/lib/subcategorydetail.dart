import 'package:flutter/material.dart';
import 'home_page.dart';
import 'map_screen.dart';
import 'search_history_page.dart';

class Category {
  final String image;
  final String title;
  final int count;
  final List<SubCategory> subCategories;

  Category({
    required this.image,
    required this.title,
    required this.count,
    required this.subCategories,
  });
}

class SubCategory {
  final String title;
  final String image;
  final String productName;
  final String model;
  final String description;
  final int stockCount;
  final String shelfNumber;
  final String namebrand;

  SubCategory({
    required this.title,
    required this.image,
    required this.productName,
    required this.model,
    required this.description,
    required this.stockCount,
    required this.shelfNumber,
    required this.namebrand,
  });
}

class SubCategoryDetailPage extends StatelessWidget {
  final SubCategory subCategory;

  const SubCategoryDetailPage({Key? key, required this.subCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategory.title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                Center(
                  child: Image.asset(subCategory.image),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '品名: ${subCategory.productName}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '型式: ${subCategory.model}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '仕様: ${subCategory.description}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 6.0),
                Text(
                  '在庫数: ${subCategory.stockCount}個',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '管理棚番号: ${subCategory.shelfNumber}番地',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'メーカー名: ${subCategory.namebrand}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
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
                  PartsName: subCategory.productName,
                  PartsModel: subCategory.model,
                  PartsShelfNumber: subCategory.shelfNumber,
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
