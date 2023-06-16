import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task.dart';

class Home extends StatefulWidget {
  Home();
  @override
  State<StatefulWidget> createState() {
    return _homepage();
  }
}

class _homepage extends State<Home> {
  String? _newtask;
  Box? _box;
  _homepage();
  late double _width, _height;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _height * 0.15,
        title: const Text(
          "Taskly ",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: _tasksview(),
      floatingActionButton: _floatbutton(),
    );
  }

  Widget _tasksview() {
    return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (BuildContext context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          //to store the data
          _box = _snapshot.data;
          return _tasklist();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _tasklist() {
    /* task _newtask =
        task(content: "Practice DSA", timestamp: DateTime.now(), done: false);
    _box?.add(_newtask.toMap());*/
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var Task = task.frommap(tasks[index]);
        return ListTile(
          title: Text(
            Task.content,
            style: TextStyle(
              decoration: Task.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            Task.timestamp.toString(),
          ),
          trailing: Icon(
            Task.done
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined,
            color: Colors.redAccent,
          ),
          onTap: () {
            setState(() {
              Task.done = !Task.done;
              _box!.putAt(
                index,
                Task.toMap(),
              );
            });
          },
          onLongPress: () {
            _box!.delete(index);
            setState(() {});
          },
        );
      },
    );
  }

  Widget _floatbutton() {
    return FloatingActionButton(
      onPressed: _displaypopup,
      child: const Icon(Icons.add),
    );
  }

  void _displaypopup() {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            title: const Text("Add New Task"),
            content: TextField(
              onSubmitted: (_) {
                if (_newtask != null) {
                  var Task = task(
                      content: _newtask!,
                      timestamp: DateTime.now(),
                      done: false);
                  _box?.add(Task.toMap());
                  setState(() {
                    _newtask = null;
                  });
                  Navigator.pop(context);
                }
              },
              onChanged: (_value) {
                setState(() {
                  _newtask = _value;
                });
              },
            ),
          );
        });
  }
}
