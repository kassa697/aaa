import 'package:flutter/material.dart';

import 'home_page.dart';
import 'overall_map.dart';
import 'search_history_page.dart';

class ShelfMap {
  final int rows;
  final int columns;
  final List<Shelf> shelves;

  ShelfMap({required this.rows, required this.columns, required this.shelves});
}

class Shelf {
  final int row;
  final int column;
  final String name;
  final String partsname;

  Shelf({
    required this.row,
    required this.column,
    required this.name,
    required this.partsname,
  });
}

class MapScreen extends StatelessWidget {
  final String PartsName;
  final String PartsModel;
  final String PartsShelfNumber;

  MapScreen({
    this.PartsName = '',
    this.PartsModel = '',
    this.PartsShelfNumber = '',
  });

  final ShelfMap shelfMap = ShelfMap(
    rows: 9,
    columns: 10,
    shelves: [
      Shelf(row: 0, column: 0, name: 'A01', partsname: '押しボタン'),
      Shelf(row: 0, column: 1, name: 'A02', partsname: '近接スイッチ'),
      Shelf(row: 0, column: 2, name: 'A03', partsname: 'パイロットランプ'),
      Shelf(row: 0, column: 3, name: 'A04', partsname: 'ガラス管ヒューズ'),
      // Shelf(row: 0, column: 4, name: 'A05'),
      // Shelf(row: 0, column: 5, name: 'A06'),
      // Shelf(row: 0, column: 6, name: 'A07'),
      // Shelf(row: 0, column: 7, name: 'A08'),
      // Shelf(row: 0, column: 8, name: 'A09'),
      // Shelf(row: 0, column: 9, name: 'AA'),
      // Shelf(row: 1, column: 0, name: 'B01'),
      Shelf(row: 1, column: 1, name: 'B02', partsname: 'マグネット'),
      Shelf(row: 1, column: 2, name: 'B03', partsname: 'リミットスイッチ'),
      Shelf(row: 1, column: 3, name: 'B04', partsname: '三菱'),
      // Shelf(row: 1, column: 4, name: 'B05'),
      // Shelf(row: 1, column: 5, name: 'B06'),
      Shelf(row: 1, column: 6, name: 'B07', partsname: '基板'),
      Shelf(row: 1, column: 7, name: 'B08', partsname: 'サーボモーター'),
      Shelf(row: 1, column: 8, name: 'B09', partsname: 'ブレーカー'),
      Shelf(row: 1, column: 9, name: 'B1', partsname: 'サーボアンプ'),
      // Shelf(row: 2, column: 0, name: 'C01'),
      Shelf(row: 2, column: 1, name: 'C02', partsname: 'カウンター'),
      // Shelf(row: 2, column: 2, name: 'C03'),
      // Shelf(row: 2, column: 3, name: 'C04'),
      Shelf(row: 2, column: 4, name: 'C05', partsname: 'ミニチュアリレー'),
      // Shelf(row: 2, column: 5, name: 'C06'),
      Shelf(row: 2, column: 6, name: 'C07', partsname: 'エンコーダ'),
      Shelf(row: 2, column: 7, name: 'C08', partsname: '光電管センサー'),
      Shelf(row: 2, column: 8, name: 'C09', partsname: 'オートスイッチ'),
      // Shelf(row: 2, column: 9, name: 'CA'),
      Shelf(row: 3, column: 0, name: 'D01', partsname: 'フレキシブルホース'),
      // Shelf(row: 3, column: 1, name: 'D02'),
      // Shelf(row: 3, column: 2, name: 'D03'),
      // Shelf(row: 3, column: 3, name: 'D04'),
      Shelf(row: 3, column: 4, name: 'D05', partsname: 'ストップバルブ'),
      Shelf(row: 3, column: 5, name: 'D06', partsname: 'スプリング'),
      // Shelf(row: 3, column: 6, name: 'D07'),
      // Shelf(row: 3, column: 7, name: 'D08'),
      Shelf(row: 3, column: 8, name: 'D09', partsname: '圧力計'),
      Shelf(row: 3, column: 9, name: 'DA', partsname: '六角'),
      // Shelf(row: 4, column: 0, name: 'E01'),
      Shelf(row: 4, column: 1, name: 'E02', partsname: 'ソケット'),
      // Shelf(row: 4, column: 2, name: 'E03'),
      Shelf(row: 4, column: 3, name: 'E04', partsname: '電源ケーブル'),
      Shelf(row: 4, column: 4, name: 'E05', partsname: 'モーター'),
      // Shelf(row: 4, column: 5, name: 'E06'),
      // Shelf(row: 4, column: 6, name: 'E07'),
      Shelf(row: 4, column: 7, name: 'E08', partsname: '油圧口金具'),
      // Shelf(row: 4, column: 8, name: 'E09'),
      Shelf(row: 4, column: 9, name: 'E10', partsname: 'ポンプ'),
      Shelf(row: 5, column: 0, name: 'F01', partsname: 'チューブ'),
      // Shelf(row: 5, column: 1, name: 'F02'),
      Shelf(row: 5, column: 2, name: 'F03', partsname: 'パイプ'),
      // Shelf(row: 5, column: 3, name: 'F04'),
      // Shelf(row: 5, column: 4, name: 'F05'),
      Shelf(row: 5, column: 5, name: 'F06', partsname: 'ジョイント'),
      // Shelf(row: 5, column: 6, name: 'F07'),
      Shelf(row: 5, column: 7, name: 'F08', partsname: 'ベアリング'),
      Shelf(row: 5, column: 8, name: 'F09', partsname: '油圧ホース'),
      Shelf(row: 5, column: 9, name: 'F10', partsname: 'スナップリング'),
      // Shelf(row: 6, column: 0, name: 'G01'),
      // Shelf(row: 6, column: 1, name: 'G02'),
      // Shelf(row: 6, column: 2, name: 'G03'),
      // Shelf(row: 6, column: 3, name: 'G04'),
      // Shelf(row: 6, column: 4, name: 'G05'),
      // Shelf(row: 6, column: 5, name: 'G06'),
      // Shelf(row: 6, column: 6, name: 'G07'),
      // Shelf(row: 6, column: 7, name: 'G08'),
      // Shelf(row: 6, column: 8, name: 'G09'),
      // Shelf(row: 6, column: 9, name: 'G10'),
      // Shelf(row: 7, column: 0, name: 'H01'),
      // Shelf(row: 7, column: 1, name: 'H02'),
      // Shelf(row: 7, column: 2, name: 'H03'),
      // Shelf(row: 7, column: 3, name: 'H04'),
      // Shelf(row: 7, column: 4, name: 'H05'),
      // Shelf(row: 7, column: 5, name: 'H06'),
      // Shelf(row: 7, column: 6, name: 'H07'),
      // Shelf(row: 7, column: 7, name: 'H08'),
      // Shelf(row: 7, column: 8, name: 'H09'),
      // Shelf(row: 7, column: 9, name: 'H10'),
      // Shelf(row: 8, column: 0, name: 'I01'),
      // Shelf(row: 8, column: 1, name: 'I02'),
      // Shelf(row: 8, column: 2, name: 'I03'),
      // Shelf(row: 8, column: 3, name: 'I04'),
      // Shelf(row: 8, column: 4, name: 'I05'),
      // Shelf(row: 8, column: 5, name: 'I06'),
      // Shelf(row: 8, column: 6, name: 'I07'),
      // Shelf(row: 8, column: 7, name: 'I08'),
      // Shelf(row: 8, column: 8, name: 'I09'),
      // Shelf(row: 8, column: 9, name: 'I10'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('部品管理マップ'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          itemCount: shelfMap.rows * shelfMap.columns,
          itemBuilder: (context, index) {
            final row = index ~/ shelfMap.columns;
            final column = index % shelfMap.columns;
            final shelf = shelfMap.shelves.firstWhere(
              (s) => s.row == row && s.column == column,
              orElse: () =>
                  Shelf(row: row, column: column, name: '', partsname: ''),
            );

            // ShelfのnameとPartsShelfNumberが一致する場合に赤いボーダーを持つContainerを返す
            if (shelf.name == PartsShelfNumber) {
              return GestureDetector(
                onTap: () {
                  if (shelf.name.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Column(
                            children: [
                              Text(
                                shelf.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          content: Text('品名: ${PartsName}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('閉じる'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 6.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  height: 200,
                  width: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          shelf.name,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '棚番：${shelf.name}, ${shelf.column}',
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              // 一致しない場合は通常のContainerを返す
              return GestureDetector(
                onTap: () {
                  if (shelf.name.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            shelf.name,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          content: Text('棚番: ${shelf.name}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('閉じる'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  height: 200,
                  width: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          shelf.name,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '棚番：${shelf.name}',
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OverallMapScreen(),
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


// Widget buildMap() {
//   // 部品管理マップを構築するためのウィジェットを返すメソッド
//   // 必要なウィジェットやレイアウトを自由に作成してください

//   return Container(
//     child: Text('部品管理マップ'),
//   );
// }


//   Widget buildPlaid() {
//     double size = 160;

//     List<Widget> _list = [];
//     List<Widget> _listCache = [];

//     for (int i = 0; i < 5; i++) {
//       for (int j = 0; j < 5; j++) {
//         _listCache.add(Container(
//           width: size,
//           height: size,
//           color: blackOrWhite(i, j),
//         ));
//       }
//       _list.add(Row(
//         children: _listCache,
//       ));
//       _listCache = [];
//     }

//     return Column(
//       children: _list,
//     );
//   }

//   Color blackOrWhite(i, j) {
//     if ((i % 2 == 0 && j % 2 == 0) || (i % 2 == 1 && j % 2 == 1)) {
//       return Colors.black;
//     } else {
//       return Colors.white;
//     }
  // }
// }



// import 'package:flutter/material.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   double scaleFactor = 1.0;

//   void handleDoubleTap() {
//     setState(() {
//       scaleFactor = (scaleFactor == 1.0) ? 2.0 : 1.0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final double scaledWidth = screenSize.width * scaleFactor;
//     final double scaledHeight = screenSize.height * scaleFactor;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('マップ'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onDoubleTap: handleDoubleTap,
//           child: Container(
//             width: scaledWidth,
//             height: scaledHeight,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/map_image.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

