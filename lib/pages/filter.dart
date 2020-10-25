import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFliters;

  Filter(this.saveFliters);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              widget.saveFliters({
                'glutenFree': _glutenFree,
                'lactoseFree': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildFilterSwitch('Gluten Free', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildFilterSwitch('Lactose Free', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildFilterSwitch('Vegetarian', _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildFilterSwitch('Vegan', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile _buildFilterSwitch(String title, bool curentValue, Function update) {
    return SwitchListTile(title: Text(title), value: curentValue, onChanged: update);
  }
}
