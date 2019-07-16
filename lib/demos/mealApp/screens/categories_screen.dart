import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';

class CategoryScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((cateData) => CategoryItem(cateData.id, cateData.title, cateData.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      );
  }
}
