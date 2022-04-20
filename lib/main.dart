import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isdark = true;
  var input = '';
  var description = '';
  List todos = [];
  List describe = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do App'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              onDismissed: (direction) {
                setState(() {
                  todos.removeAt(index);
                  describe.removeAt(index);
                });
              },
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: Text(describe[index]),
                  subtitle: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.pinkAccent[100]),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                        describe.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[600],
        foregroundColor: Colors.white,
        splashColor: Colors.pink[200],
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              barrierColor: Colors.white38,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  // title: Text('Add todo'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Add to-do description',
                          labelStyle: TextStyle(
                            color: Colors.pink[100],
                          ),
                        ),
                        cursorColor: Colors.pink[200],
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Add to-do description',
                          labelStyle: TextStyle(
                            color: Colors.pink[100],
                          ),
                        ),
                        maxLines: 4,
                        cursorColor: Colors.pink[200],
                        onChanged: (value) {
                          input = value;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[600],
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        if (input != '' && description != '') {
                          setState(() {
                            describe.add(description);
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[300],
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
