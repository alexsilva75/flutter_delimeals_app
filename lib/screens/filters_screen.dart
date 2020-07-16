import 'package:flutter/material.dart';
import 'package:my_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function setFilters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState() {
    super.initState();

    this._glutenFree = widget.filters['gluten'];
    this._vegetarian = widget.filters['vegetarian'];
    this._vegan = widget.filters['vegan'];
    this._lactoseFree = widget.filters['lactose'];
  }

  Widget _buildSwitchListTile(
    bool value,
    String title,
    String subtitle,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  _glutenFree,
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  _vegetarian,
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  _vegan,
                  'Vegan',
                  'Only include vegan meals.',
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  _lactoseFree,
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
