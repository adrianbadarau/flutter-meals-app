import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFliters;
  final Map<String, bool> filters;

  Filter(this.saveFliters, this.filters);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFliters(widget.filters);
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
                _buildFilterSwitch('Gluten Free', widget.filters['glutenFree'], (newValue) {
                  setState(() {
                    widget.filters['glutenFree'] = newValue;
                  });
                }),
                _buildFilterSwitch('Lactose Free', widget.filters['lactoseFree'], (newValue) {
                  setState(() {
                    widget.filters['lactoseFree'] = newValue;
                  });
                }),
                _buildFilterSwitch('Vegetarian', widget.filters['vegetarian'], (newValue) {
                  setState(() {
                    widget.filters['vegetarian'] = newValue;
                  });
                }),
                _buildFilterSwitch('Vegan', widget.filters['vegan'], (newValue) {
                  setState(() {
                    widget.filters['vegan'] = newValue;
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
