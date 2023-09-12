import 'package:flutter/material.dart';

import 'categorydetail.dart';
import 'search_categorypage.dart';
import 'subcategorydetail.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                category.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '(${category.count})', // カウント値を表示
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.0, // サブカテゴリーの高さ
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.subCategories.length,
            itemBuilder: (context, index) {
              final subCategory = category.subCategories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SubCategoryDetailPage(subCategory: subCategory),
                    ),
                  );
                },
                child: Container(
                  width: 150.0, // サブカテゴリーの幅
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(subCategory.image),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        subCategory.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
