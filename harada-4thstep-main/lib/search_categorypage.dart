import 'package:flutter/material.dart';
import 'categorydetail.dart';
import 'categoryitem.dart';
import 'home_page.dart';
import 'map_screen.dart';
import 'overall_map.dart';
import 'search_history_page.dart';
import 'subcategorydetail.dart';

class CategorySearchPage extends StatelessWidget {
  final List<Category> categories = [
    // カテゴリーリストのデータ
    Category(
      image: 'assets/images/sensor06.jpeg',
      title: 'センサー類',
      count: 4,
      subCategories: [
        SubCategory(
          title: '近接スイッチ',
          image: 'assets/images/近接スイッチ300.jpeg',
          productName: '近接スイッチ',
          model: 'E2E-X10T1 2M',
          description:
              '円柱型（ネジ付き)\n検出距離10mm\n交流・直流2線式\n出力形態 NO\n磁性金属有無検出スタンダード\n相互干渉防止用に異周波タイプ\n標準コードの材質は耐油PVC',
          stockCount: 10,
          shelfNumber: 'A02',
          namebrand: 'omron',
        ),
        SubCategory(
          title: '光電管センサー',
          image: 'assets/images/光電管スイッチ500.jpeg',
          productName: '光電管センサー',
          model: 'XEC-T2102',
          description: '光源方式: レーザー',
          stockCount: 5,
          shelfNumber: 'C08',
          namebrand: 'omron',
        ),
        SubCategory(
          title: 'リミットスイッチ',
          image: 'assets/images/リミットスイッチ300.jpeg',
          productName: 'リミットスイッチ',
          model: 'WLCA2-LD-N',
          description: '使用環境・用途に合わせて選択\n2回路リミットスイッチ基準型',
          stockCount: 12,
          shelfNumber: 'B03',
          namebrand: 'omron',
        ),
        SubCategory(
          title: 'オートスイッチ',
          image: 'assets/images/autoswitch300.jpeg',
          productName: 'オートスイッチ',
          model: '無接点オートスイッチ',
          description: '一般形',
          stockCount: 5,
          shelfNumber: 'C09',
          namebrand: 'omron',
        ),
      ],
    ),
    Category(
      image: 'assets/images/electrical07.jpeg',
      title: '汎用電気部品',
      count: 10,
      subCategories: [
        SubCategory(
          title: '押しボタン',
          image: 'assets/images/押しボタン600.jpeg',
          productName: '押しボタン',
          model: 'モデル123',
          description: '押しボタンスイッチの仕様説明です。',
          stockCount: 5,
          shelfNumber: 'A01',
          namebrand: '富士電機',
        ),
        SubCategory(
          title: 'パイロットランプ',
          image: 'assets/images/パイロットランプ400.jpeg',
          productName: 'パイロットランプ',
          model: 'モデル456',
          description: 'パイロットランプの説明です。',
          stockCount: 10,
          shelfNumber: 'A03',
          namebrand: '竹中電業',
        ),
        SubCategory(
          title: 'マグネットスイッチ',
          image: 'assets/images/マグネットスイッチ350.jpeg',
          productName: 'マグネットスイッチ',
          model: 'モデル789',
          description: 'マグネットスイッチの仕様説明です。',
          stockCount: 8,
          shelfNumber: 'B02',
          namebrand: '富士電機',
        ),
        SubCategory(
          title: 'ミニチュアリレー',
          image: 'assets/images/ミニチュアリレー300.jpeg',
          productName: 'ミニチュアリレー',
          model: 'モデル1011',
          description: 'ミニチュアリレーの仕様説明です。',
          stockCount: 15,
          shelfNumber: 'C05',
          namebrand: 'omron',
        ),
        SubCategory(
          title: 'ブレーカー',
          image: 'assets/images/ブレーカー500.jpeg',
          productName: 'ブレーカー',
          model: 'モデル1213',
          description: 'ブレーカーの仕様説明です。',
          stockCount: 7,
          shelfNumber: 'B09',
          namebrand: '富士電機',
        ),
        SubCategory(
          title: 'ガラス管ヒューズ',
          image: 'assets/images/glasstubefuse250.jpeg',
          productName: 'ガラス管ヒューズ',
          model: 'モデル1415',
          description: 'ガラス管ヒューズの仕様説明です。',
          stockCount: 10,
          shelfNumber: 'A04',
          namebrand: '東洋フューズ',
        ),
        SubCategory(
          title: 'カウンタータイマー',
          image: 'assets/images/タイマーカウンター250.jpeg',
          productName: 'カウンタータイマー',
          model: 'モデル1617',
          description: 'カウンタータイマーの仕様説明です。',
          stockCount: 6,
          shelfNumber: 'C02',
          namebrand: '富士電機',
        ),
        SubCategory(
          title: 'リレー用ソケット',
          image: 'assets/images/relaysocket600.jpeg',
          productName: 'リレー用ソケット',
          model: 'PYFZ-08',
          description:
              'カウンタータイマーの仕様説明です。\nネジ端子8ピン\n連続通電電流10A\n絶縁抵抗1000MΩ以上\nリレー接続方法プラグイン\n最大定格電圧300V\nDINレール取付可能',
          stockCount: 6,
          shelfNumber: 'E02',
          namebrand: 'omron',
        ),
        SubCategory(
          title: '電源ケーブル',
          image: 'assets/images/electricalcable.jpg',
          productName: '電源ケーブル',
          model: 'VVF2x1.6M10',
          description:
              '配線ケーブルの仕様説明です。\n色 カラー\n導体抵抗(20℃)Ω/km:8.92\nVVF ケーブル2芯\n線芯数x導体径(mm):2x1.6\n全長 10メートル\n絶縁抵抗(MΩ・km):50\n許容電流(A):18',
          stockCount: 6,
          shelfNumber: 'E04',
          namebrand: '古河電気',
        ),
        SubCategory(
          title: 'インバータ',
          image: 'assets/images/inberter.jpeg',
          productName: 'インバータ',
          model: 'FR-E720-5.5K',
          description: 'インバータの仕様説明です。',
          stockCount: 6,
          shelfNumber: 'E05',
          namebrand: '古河電気',
        ),
      ],
    ),
    Category(
      image: 'assets/images/machine03.jpeg',
      title: '汎用機械部品',
      count: 8,
      subCategories: [
        SubCategory(
          title: 'ベアリング',
          image: 'assets/images/ベアリング500.jpeg',
          productName: 'ベアリング',
          model: 'モデル1618',
          description: 'ベアリングの仕様説明です。',
          stockCount: 12,
          shelfNumber: 'F08',
          namebrand: 'NSK',
        ),
        SubCategory(
          title: 'スナップリング',
          image: 'assets/images/snapring350.jpeg',
          productName: 'スナップリング',
          model: 'モデル1619',
          description: 'スナップリングの説明',
          stockCount: 3,
          shelfNumber: 'FA',
          namebrand: '磐田電工',
        ),
        SubCategory(
          title: 'モーター',
          image: 'assets/images/orientalmotor250.jpeg',
          productName: 'モーター',
          model: 'モデル1620',
          description: 'モーターの仕様説明',
          stockCount: 5,
          shelfNumber: 'E06',
          namebrand: '三菱電機',
        ),
        SubCategory(
          title: 'ポンプ',
          image: 'assets/images/ポンプ250.jpeg',
          productName: 'ポンプ',
          model: 'モデル1621',
          description: 'ポンプの仕様説明',
          stockCount: 2,
          shelfNumber: 'EA',
          namebrand: 'グルンドフォス',
        ),
        SubCategory(
          title: 'バルブ',
          image: 'assets/images/kizvalve300.jpeg',
          productName: 'バルブ',
          model: '5K 3/8 K-10A',
          description:
              'バルブの仕様説明です。\n油・ガス（可燃性・毒性以外）\n空気・静流水用 \n最高圧力0.7MPa（静流水120℃以下）\nねじ込み型\nグローブ弁青銅（CAC406）',
          stockCount: 12,
          shelfNumber: 'D05',
          namebrand: 'SMC',
        ),
        SubCategory(
          title: 'ソレノイドバルブ',
          image: 'assets/images/sol valve.png',
          productName: 'ソレノイドバルブ',
          model: '4GB210R-08-E2-3',
          description: 'バルブの仕様説明',
          stockCount: 5,
          shelfNumber: 'D01',
          namebrand: 'CKD',
        ),
        SubCategory(
          title: 'スプリング',
          image: 'assets/images/spring300.jpg',
          productName: 'スプリング',
          model: 'S-020',
          description:
              'バルブの仕様説明です。\nステンレス押バネ\n7.0X18X1.0ミリ\n1袋(2個入り)\nSUS304WPB\n基準荷重時の高さ14.24',
          stockCount: 12,
          shelfNumber: 'D06',
          namebrand: '内田スプリング',
        ),
        SubCategory(
          title: '圧力計',
          image: 'assets/images/pressuregauge350.jpg',
          productName: '圧力計',
          model: 'GS501710.6MP',
          description:
              '圧力計の仕様説明です。\n圧力レンジ0.0〜0.60(MPa)\n最小目盛り0.010(MPa)\n精度±1.6%FS\nケース形状A\n大きさ60ミリ\n接続サイズR1/4\nJIS規格ATR1/4',
          stockCount: 12,
          shelfNumber: 'D09',
          namebrand: '長野計器',
        ),
      ],
    ),
    Category(
      image: 'assets/images/hose-01.jpeg',
      title: '配管・ホース類',
      count: 8,
      subCategories: [
        SubCategory(
          title: 'フレキシブルホース',
          image: 'assets/images/フレキシブル500.png',
          productName: 'フレキシブルホース',
          model: 'モデル1622',
          description: 'フレキシブルホースの仕様説明',
          stockCount: 10,
          shelfNumber: 'D01',
          namebrand: '南国フレキ工業',
        ),
        SubCategory(
          title: '六角ニップル',
          image: 'assets/images/hexagonal_nipple700.png',
          productName: '六角ニップル',
          model: '呼び径 3/4 20A',
          description: '六角ニップルの仕様説明',
          stockCount: 10,
          shelfNumber: 'D09',
          namebrand: '吉年',
        ),
        SubCategory(
          title: 'パイプ',
          image: 'assets/images/鋼管250.jpeg',
          productName: 'パイプ',
          model: 'モデル1623',
          description: 'パイプの仕様説明',
          stockCount: 11,
          shelfNumber: 'F03',
          namebrand: '小山鋼材',
        ),
        SubCategory(
          title: 'チューブ',
          image: 'assets/images/テフロンチューブ500.jpeg',
          productName: 'チューブ',
          model: 'モデル1624',
          description: 'チューブの仕様説明',
          stockCount: 15,
          shelfNumber: 'F01',
          namebrand: 'SMC',
        ),
        SubCategory(
          title: 'Yジョイント',
          image: 'assets/images/配管ジョイント500.jpeg',
          productName: 'Yジョイント',
          model: 'モデル1625',
          description: 'ジョイントの仕様説明',
          stockCount: 10,
          shelfNumber: 'F06',
          namebrand: '日本継手',
        ),
        SubCategory(
          title: '油圧ホース',
          image: 'assets/images/hydraulichorse600_.jpg',
          productName: '油圧ホース',
          model: 'モデル1622',
          description: '油圧ホースの仕様説明',
          stockCount: 10,
          shelfNumber: 'F09',
          namebrand: 'ブリジストン',
        ),
        SubCategory(
          title: 'Aジョイント',
          image: 'assets/images/air_joint250.jpeg',
          productName: 'Aジョイント',
          model: 'PACK-MEPOC',
          description: 'ジョイントの仕様説明',
          stockCount: 10,
          shelfNumber: 'F04',
          namebrand: 'ブリジストン',
        ),
        SubCategory(
          title: '油圧口金具',
          image: 'assets/images/metal_fittings350.jpeg',
          productName: '油圧口金具',
          model: 'FT04F',
          description: '油圧ホースの仕様説明',
          stockCount: 20,
          shelfNumber: 'F08',
          namebrand: 'ブリジストン',
        ),
      ],
    ),
    Category(
      image: 'assets/images/servoalphai05.jpeg',
      title: 'サーボ系部品',
      count: 5,
      subCategories: [
        SubCategory(
          title: 'サーボモーター',
          image: 'assets/images/servomotor350.jpg',
          productName: 'サーボモーター',
          model: 'モデル1626',
          description: 'サーボモーターの仕様説明',
          stockCount: 2,
          shelfNumber: 'B08',
          namebrand: 'FANUC',
        ),
        SubCategory(
          title: 'サーボアンプ',
          image: 'assets/images/amp750.jpeg',
          productName: 'サーボアンプ',
          model: 'モデル1627',
          description: 'サーボアンプの仕様説明',
          stockCount: 2,
          shelfNumber: 'BA',
          namebrand: 'FANUC',
        ),
        SubCategory(
          title: 'エンコーダ',
          image: 'assets/images/encoder250.jpeg',
          productName: 'エンコーダ',
          model: 'モデル1628',
          description: 'エンコーダの仕様説明',
          stockCount: 3,
          shelfNumber: 'B07',
          namebrand: 'FANUC',
        ),
        SubCategory(
          title: '基板',
          image: 'assets/images/module basisi350.png',
          productName: '基板',
          model: 'KBC-RFPIC2.4GHz',
          description:
              '基板の仕様説明:NEC製 無線モジュール\nCPUにはMicrochip社の28pin系コントローラ\n搭載する無線モジュールにはコントローラが内蔵\n煩雑になりがちな伝送制御を必要とせずにコマンド形式でデータ伝送制御が行えます。',
          stockCount: 3,
          shelfNumber: 'B07',
          namebrand: 'NEC',
        ),
        SubCategory(
          title: 'ACサーボアンプ',
          image: 'assets/images/m_amp720.png',
          productName: 'ACサーボアンプ',
          model: 'MR-J2S-200B',
          description: 'サーボアンプの仕様説明:',
          stockCount: 3,
          shelfNumber: 'B03',
          namebrand: '三菱',
        ),
      ],
    ),
  ];

  void navigateToCategoryDetail(
      BuildContext context, String category, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CategoryDetailPage(category: category, title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カテゴリー検索'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 230, 80, 228),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              navigateToCategoryDetail(context, category.title, category.title);
            },
            child: CategoryItem(category: category),
          );
        },
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
