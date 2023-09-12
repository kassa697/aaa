import 'package:flutter/material.dart';

import 'home_page.dart';
import 'map_screen.dart';
import 'search_history_page.dart';

class OverallMapScreen extends StatefulWidget {
  @override
  _OverallMapScreenState createState() => _OverallMapScreenState();
}

class _OverallMapScreenState extends State<OverallMapScreen> {
  bool _isMapExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全体マップ'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 230, 80, 228),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isMapExpanded = !_isMapExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            width: _isMapExpanded ? 750 : 350,
            height: _isMapExpanded ? 750 : 350,
            child: _isMapExpanded
                ? Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Image.asset('assets/images/map0725.png'),
                      ),
                    ),
                  )
                : Transform.scale(
                    scale: 0.9, // 縮小する比率を調整 (0.9 は 90% の大きさ)
                    child: Image.asset('assets/images/map0725.png'),
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
