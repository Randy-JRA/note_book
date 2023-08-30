import 'package:flutter/material.dart';

import 'notesPage.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  int myIndex = 0;
  bool isInputFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(
            itemBuilder: (context){
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Sort by alert time'),
                ),
              ];
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children:<Widget>[
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(12.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("To-dos",style: TextStyle(color:Colors.white,fontSize:20),),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.fromLTRB(8, 3, 3, 3),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(50),
                color:Colors.brown,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  hintText: 'Search Todos',

                ),
              )
          ),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.fromLTRB(8, 3, 3, 3),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:Colors.brown,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add a to-do item',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                            ),
                            icon: const Icon(Icons.alarm, size: 15,),
                            label: const Text("Set Alerts"),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            child: const Text("Save"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          );
          },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
          if (index == 0) {
            //navigate to Notes page.
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotesPage()));
          }
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'To-dos',
          )
        ],
        iconSize: 30,
        fixedColor: Colors.blue,
      ),
    );
  }
}