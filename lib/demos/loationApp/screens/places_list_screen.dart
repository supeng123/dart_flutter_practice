
import 'package:flutter/material.dart';
import 'package:my_first_app/demos/loationApp/providers/greate_places.dart';
import 'package:my_first_app/demos/loationApp/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatePlaces>(
        child: const Center(child: Text('Got no place'),),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0 ? ch : ListView.builder(
          itemCount: greatPlaces.items.length ,
          itemBuilder: (ctx, i) => ListTile(
            leading: CircleAvatar(backgroundImage: FileImage(greatPlaces.items[i].image),),
            title: Text(greatPlaces.items[i].title),
          ),
        ),),
    );
  }
}