import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'barcode_scan.dart';
import 'categorydetail.dart';
import 'item_registration.dart';

import 'login_page.dart';
import 'map_screen.dart';
import 'search_categorypage.dart';
import 'search_history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ホーム';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  TextEditingController searchTextController = TextEditingController();
  String searchText = '';
  List<Map<String, String>> searchResults = [];
  List<String> searchHistory = [];
  bool isCompleteSearch = false;
  List<String> recentSearches = [];

  String getImagePathForItem(String item) {
    final Map<String, String> itemImageMap = {
      '近接センサー': 'assets/images/近接スイッチ300.jpeg',
    };
    return itemImageMap[item] ?? '';
  }

  Future<List<String>> fetchSearchSuggestions(String pattern) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('history')
        .where('word', isGreaterThanOrEqualTo: pattern)
        .where('word', isLessThan: pattern + 'z')
        .limit(5)
        .get();

    final List<String> historySuggestions =
        snapshot.docs.map((doc) => doc['word'] as String).toList();

    return historySuggestions;
  }

  void fetchSearchHistory() {
    FirebaseFirestore.instance
        .collection('history')
        .orderBy('searchTime', descending: true)
        .limit(5)
        .get()
        .then((querySnapshot) {
      setState(() {
        searchHistory =
            querySnapshot.docs.map((doc) => doc['word'] as String).toList();
        recentSearches = searchHistory; // 最新の検索履歴を recentSearches に格納
      });
    }).catchError((error) {
      print('Failed to fetch search history: $error');
    });
  }

  void onSuggestionSelected(String suggestion) {
    setState(() {
      searchText = suggestion;
      isCompleteSearch = false;
    });
  }

  void search() {
    if (searchText.isNotEmpty) {
      if (isCompleteSearch) {
        // 検索履歴の更新を行わないように、検索済みの場合は履歴に追加しないようにします
        if (!searchHistory.contains(searchText)) {
          FirebaseFirestore.instance.collection('history').add({
            'searchTime': DateTime.now(),
            'word': searchText,
          }).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryDetailPage(
                  category: searchText,
                  title: '部品詳細',
                ),
              ),
            );
          }).catchError((error) {
            print('Failed to write search history: $error');
          });
        } else {
          // 検索履歴にすでに存在する場合は直接カテゴリー画面に遷移します
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailPage(
                category: searchText,
                title: '部品詳細',
              ),
            ),
          );
        }
      }
    }

    // 検索の実際の処理を実装する
    // 必要な操作を行ってください

    // 例: 検索結果を更新する
    searchResults = fetchSearchResults(searchText);

    isCompleteSearch = true;
    fetchSearchHistory();
  }

  List<Map<String, String>> fetchSearchResults(String searchText) {
    // 検索結果の取得と返却の実装を行う
    // 必要に応じてFirestoreのデータベースクエリなどを使用して検索結果を取得する
    List<Map<String, String>> results = [];

    // 例: 検索結果をダミーデータから生成する
    List<String> dummyData = [
      '近接スイッチ',
      '光電管スイッチ',
      'リミットスイッチ',
      'オートスイッチ',
      'サーボアンプ',
      'スナップリング',
      'エンコーダ',
      '押しボタン',
      'ベアリング',
      'サーボモーター',
    ];

    for (String item in dummyData) {
      if (item.toLowerCase().contains(searchText.toLowerCase())) {
        String imagePath = getImagePathForItem(item);
        results.add({
          'category': searchText,
          'title': item,
          'image': imagePath,
        });
      }
    }

    return results;
  }

  List<String> getSuggestions(String searchText) {
    List<String> suggestions = [];
    List<String> historySuggestions = [];
    List<String> recentSearches = [];

    for (String historyWord in searchHistory) {
      if (historyWord.toLowerCase().startsWith(searchText.toLowerCase())) {
        historySuggestions.add(historyWord);
      }
    }

    suggestions.addAll(historySuggestions);

    String partialWord = '';

    for (int i = 0; i < searchText.length; i++) {
      partialWord += searchText[i];
      suggestions.add(partialWord);
    }

    return suggestions;
  }

  void navigateToBarcodeScan() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BarcodeScanScreen()),
    );
  }

  void navigateToSearch() {
    setState(() {
      search();
    });
  }

  // ログアウトの処理を行う関数
  void logout() {
    // ログアウト時に必要な処理をここに記述します（例：ユーザーセッションデータのクリアなど）。

    // main.dart画面に戻るための処理
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
    fetchSearchHistory(); // 検索履歴を取得
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('ホーム'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.library_add),
            onPressed: () {
              // ライブラリーアイコンがタップされた時にアイテム追加画面に遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemRegistrationScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  style: const TextStyle(color: Colors.black),
                  controller: searchTextController,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: '検索',
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: searchText.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                searchTextController.clear();
                                searchText = '';
                              });
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                suggestionsCallback: (pattern) => getSuggestions(pattern),
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    searchText = suggestion;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                backgroundColor: Colors.blue,
                minimumSize: const Size(150, 48),
              ),
              onPressed: navigateToSearch,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  const Text(
                    'テキスト検索',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const SizedBox(width: 16.0), // 左側の余白
                Expanded(
                  child: Container(
                    width: 395.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView.builder(
                      itemCount: recentSearches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(recentSearches[index]),
                          onTap: () {
                            setState(() {
                              searchText = recentSearches[index];
                              searchTextController.text = recentSearches[index];
                            });
                            // searchText を設定した後、search() 関数を呼び出して検索を実行します
                            search();
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16.0), // 右側の余白
              ],
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.pink,
                    minimumSize: const Size(150, 48),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategorySearchPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'カテゴリー検索',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                backgroundColor: Colors.orange,
                minimumSize: const Size(150, 48),
              ),
              onPressed: navigateToBarcodeScan,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.qr_code),
                  const SizedBox(width: 8),
                  const Text(
                    'QR Code',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // ログアウトボタン
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                backgroundColor: Colors.red,
                minimumSize: const Size(150, 48),
              ),
              onPressed: logout, // ボタンを押した時にlogout関数を実行する
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(width: 8),
                  const Text(
                    'ログアウト',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // マップアイコンを選択済みにするためのインデックス
        //  currentIndex: currentIndex,
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
          setState(() {
            currentIndex = index;
          });

          if (index == 0) {
            // ホームアイコンがタップされた時の処理
            // 必要な操作をここに追加
          } else if (index == 1) {
            // マップアイコンがタップされた時の処理
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MapScreen(),
            //   ),
            // );
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
