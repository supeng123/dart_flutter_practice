import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';
  final arguments;

  ProductDetailScreen(this.arguments);

  @override
  _ProductDetailScreenState createState() =>
      _ProductDetailScreenState(this.arguments);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final arguments;
  _ProductDetailScreenState(this.arguments);

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(arguments.id);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      //   elevation: 0.0,
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  // child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
                  child: Hero(
                    tag: loadedProduct.id,
                    child: Image.network(loadedProduct.imageUrl,
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${loadedProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                )
              ]),
            ]),
          ),
        ],
      ),
    );
  }
}
