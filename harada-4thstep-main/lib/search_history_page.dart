import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partsfinder_app/home_page.dart';
import 'package:partsfinder_app/map_screen.dart';

class SearchHistoryPage extends StatefulWidget {
  @override
  _SearchHistoryPageState createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  List<String> searchHistory = []; // 検索履歴を保持するリスト

  // Firestoreから検索履歴を取得する関数
  Future<void> fetchSearchHistory() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('history')
          .orderBy('searchTime', descending: true)
          .limit(5)
          .get();

      setState(() {
        searchHistory =
            snapshot.docs.map((doc) => doc['word'] as String).toList();
      });
    } catch (error) {
      print('Failed to fetch search history: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSearchHistory(); // Firestoreから検索履歴を取得
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索履歴'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: searchHistory.length,
              itemBuilder: (context, index) {
                final historyWord = searchHistory[index];
                return ListTile(
                  title: Text(historyWord),
                  onTap: () {
                    // 検索履歴がタップされた時の処理を記述
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // 検索履歴アイコンに対応するインデックス番号
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
                builder: (context) => HomePage(), // ホームページに遷移
              ),
            );
          } else if (index == 1) {
            // マップアイコンがタップされた時の処理
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MapScreen(),
            //   ),
            // );
          }
        },
      ),
    );
  }
}
