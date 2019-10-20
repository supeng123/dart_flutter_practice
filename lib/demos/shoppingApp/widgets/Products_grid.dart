import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_first_app/demos/shoppingApp/providers/products.dart';
import 'package:my_first_app/demos/shoppingApp/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(
          products[i].id, 
          products[i].title, 
          products[i].imageUrl, 
          ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}