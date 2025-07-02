import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // First page
    );
  }
}

// First Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo list App"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      

      body: Center(
        child: ElevatedButton(
          child: const Text("Welcome"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodoListPage(),),
            );
          },
        ),
      ),
    );
  }
}

// Todo List Page (your existing code wrapped in a new class)
class TodoListPage extends StatefulWidget {
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  String displayText = "no Text";
  List<String> taskList = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter a task"),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.white,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  setState(() {
                    taskList.add(textEditingController.text);
                    textEditingController.clear();
                  });
                },
                child: Text("CLICK"),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(taskList[index]),
                      ),
                    ),
                    MaterialButton(
                      child: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
