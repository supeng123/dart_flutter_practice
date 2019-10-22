import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: Padding(
                  padding: EdgeInsets.all(8),
                  child:
                      FittedBox(child: CircleAvatar(child: Text('\$$price')))),
              title: Text(title),
              subtitle: Text('Total:\$${(price * quantity)}'),
              trailing: Text('$quantity X'),
            ),
          )),
    );
  }
}
