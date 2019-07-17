import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName= '/filters';
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    String currentValue,
    String updateVaue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateVaue
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('Adjust your meal selection.', style: Theme.of(context).textTheme.title),
            padding: EdgeInsets.all(20)
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                'Gluten-free', 
                'only include gluten meals'
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  })
                }),

                _buildSwitchListTile(
                'vegan', 
                'only include vegan meals'
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  })
                }),
                
              ]
            )
          )
        ]

      ),
    );
  }
}