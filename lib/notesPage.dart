import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          children:<Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(12.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Notes",style: TextStyle(color:Colors.white,fontSize:20),),
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
                  hintText: 'Search Notes',

                ),
              )
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(12.0),
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(8),
                  color:Colors.grey,
              ),
              child: const Text('Task'),
            ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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



