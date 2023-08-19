import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 70, 8, 8),
              child: Row(
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                 decoration: BoxDecoration(
                  color: Colors.grey,
                   shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.circular(30),
                ),
                 child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search notes',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            hoverColor: Colors.grey,
            elevation: 12,
            mouseCursor: MaterialStateMouseCursor.clickable,
            child: Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        iconSize: 30,
        mouseCursor: SystemMouseCursors.grab,
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: 'To-dos'
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
