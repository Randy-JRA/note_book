import 'package:flutter/material.dart';
import 'package:note_book/todosPage.dart';

class NotesPage2 extends StatefulWidget {
  const NotesPage2({Key? key}) : super(key: key);

  @override
  State<NotesPage2> createState() => _NotesPage2State();
}

class _NotesPage2State extends State<NotesPage2> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children:<Widget>[
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.brown,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('time',style: TextStyle(color:Colors.white,fontSize:20),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.brown,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Date",style: TextStyle(color:Colors.white,fontSize:20),),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.fromLTRB(8, 3, 3, 3),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(5),
                color:Colors.brown,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note something down',

                ),
              )
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
          if (index == 1) {
            //navigate to todos page.
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodosPage()));
          }
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.brown,
            icon: Icon(Icons.album),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audio_file),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'To-do List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Reminder',
          ),
        ],
        iconSize: 30,
        fixedColor: Colors.blue,
      ),
    );
  }
}