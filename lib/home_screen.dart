import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/add_screen.dart';
// ignore: depend_on_referenced_packages

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> todoList = [
    {
      "title": "task 1",
      "id": "1",
    },
    {
      "title": "task 2",
      "id": "2",
    },
    {
      "title": "task 3",
      "id": "3",
    },
    {
      "title": "task 1",
      "id": "4",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("TODO"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return AddScreen(
                    addFunc: add,
                  );
                }),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...todoList.map(
              (e) {
                return TodoCardWidget(
                  id: e['id'],
                  title: e['title'],
                  fn: remove,
                  key: ValueKey(e['id']),
                );
              },
            ),
            Text("Devloped By Biwash Dahal"),
          ],
        ),
      ),
    );
  }

  void add(Map item) {
    setState(() {
      todoList.add(item);
    });
  }

  void remove(String index) {
    setState(
      () {
        todoList.removeWhere(
          (item) {
            return item['id'] == index;
          },
        );
      },
    );
  }
}

class TodoCardWidget extends StatefulWidget {
  const TodoCardWidget({
    super.key,
    required this.title,
    required this.fn,
    required this.id,
  });

  final String title;
  final Function fn;
  final String id;

  @override
  State<TodoCardWidget> createState() => _TodoCardWidgetState();
}

class _TodoCardWidgetState extends State<TodoCardWidget> {
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.greenAccent,
    Colors.redAccent,
  ];
  late Color coloruse;

  @override
  void initState() {
    super.initState();
    var col = Random().nextInt(4);
    coloruse = colors[col];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: coloruse,
      margin: const EdgeInsets.only(
        right: 7.0,
        left: 7.0,
        bottom: 7.0,
        top: 5.0,
      ),
      padding: const EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          ElevatedButton(
            onPressed: () {
              widget.fn(widget.id);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
