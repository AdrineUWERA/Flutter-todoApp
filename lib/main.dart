import 'package:flutter/material.dart';

// importing material design library
void main() {
  runApp(MaterialApp(
    // runApp method
    home: HomePage(),
  )); //MaterialApp
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Todo {
  String title;
  dynamic isCompleted;
  String description;
  int priority;
  Todo(this.title, this.isCompleted, this.description, this.priority);
}

class _HomePageState extends State<HomePage> {
// value set to false

  // List<String> todos = [ 'Take out the trash' 'Buy groceries' 'Do laundry' ];
  List<Todo> todos = [
    Todo('Take out the trash', false, 'I will take out the trash', 4),
    Todo('Buy groceries', false, 'I will but groceries', 2),
    Todo('Do laundry', true, 'I will do the laundry', 1),
  ];

// App widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Todo App"),
          titleSpacing: 85,
        ), //AppBar
        body: Container(
          color: Colors.grey[250],
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: CheckboxListTile(
                                  contentPadding: const EdgeInsets.all(20),
                                  autofocus: false,
                                  secondary: Text(
                                    todos[index].priority.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF476EBE),
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: todos[index].isCompleted,
                                  title: Text(
                                    todos[index].title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    todos[index].description,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  activeColor: Color(0xFF476EBE),
                                  checkColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      todos[index].isCompleted = value;
                                    });
                                  },
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    },
                  ),
                )), //Padding
          ), //Center
        ), //SizedBox
      ), //Scaffold
    ); //MaterialApp
  }
}
