import 'package:flutter/material.dart';

void main() {
  runApp(DishCount());
}

class DishCount extends StatefulWidget {
  const DishCount({Key? key}) : super(key: key);

  @override
  State<DishCount> createState() => _DishCountState();
}

class _DishCountState extends State<DishCount> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Dish Count'),
          ),
          body: Center(
            child: Text('Hello 🌏! ' + '$count'), 
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          )),
    );
  }

  @override
  void initState() {
    // TODO: fetch data from database
    
    super.initState();
    // print('initState');
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
