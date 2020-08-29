import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  Map<String,bool> filters;
  final Function changeFilters;
  FilterScreen(this.filters,this.changeFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SwitchListTile _buildSwitches(String title, String subtitle, bool curr, Function updateCurr) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: curr,
      onChanged: updateCurr
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Recipies',),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext ctx) {
          return FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () {
              Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text("Saved successfully!"),
                backgroundColor: Colors.green,
                duration: Duration(milliseconds: 500),
                action: SnackBarAction(
                  label: "OK", 
                  onPressed: () {},
                  textColor: Colors.white,
                ),
              ));
              widget.changeFilters(widget.filters);
            }
          );
        },
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust meals according to your choice",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          _buildSwitches(
            'Contains Egg', 
            'Can show items that contains eggs.', 
            widget.filters['hasegg'], 
            (val) {
              setState(() {
                widget.filters['hasegg'] = val;
              });
            },
          ),
          _buildSwitches(
            'Only Vegan', 
            'Only show items that are vegan.', 
            widget.filters['isvegan'], 
            (val) {
              setState(() {
                widget.filters['isvegan'] = val;
              });
            },
          ),
          _buildSwitches(
            'Only Vegetarian', 
            'Only show items that are vegetarian.', 
            widget.filters['isveg'], 
            (val) {
              setState(() {
                widget.filters['isveg'] = val;
              });
            },
          ),
          _buildSwitches(
            'Sugar-free', 
            'Only show items that are sugar-free.', 
            widget.filters['issugarfree'], 
            (val) {
              setState(() {
                widget.filters['issugarfree'] = val;
              });
            },
          ),
        ],
      ),
    );
  }
}