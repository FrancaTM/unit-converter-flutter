import 'package:flutter/material.dart';

import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryPage extends StatefulWidget {
  const CategoryPage();

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  final _categories = <Category>[];

  _buildCategoryWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _categories[index],
      itemCount: _categories.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < _categoryNames.length; i++) {
      _categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        icon: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(),
    );

    final appBar = AppBar(
      backgroundColor: _backgroundColor,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
