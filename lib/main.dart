import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './profile.dart';
import './productbox.dart';
import './data.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final wordPair = WordPair.random();
  Widget _buildSuggestion() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd && i != 0) {
          return Divider();
        } else {
          return Text("Hudai");
        }
      },
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("This is App bar"),
    );
  }

  int choice = 0;
  int index = 0;

  Widget _buildChildForDrawer(index) {
    print("This is index");
    print(index);
    if (index == 1) {
      return Container(
        child: Center(
          child: Text(
            'Trouble no 1',
            style: TextStyle(fontSize: 28),
          ),
        ),
      );
    }
    if (index == 2) {
      return Container(
        child: Center(
          child: Text(
            'Trouble no 2',
            style: TextStyle(fontSize: 28),
          ),
        ),
      );
    }
    if (index == 3) {
      return Container(
        child: Center(
          child: Text(
            'Trouble no 3',
            style: TextStyle(fontSize: 28),
          ),
        ),
      );
    }
    return Container(
      child: Center(
        child: Text(
          'You are in trouble',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }

  Widget _buildChild(choice) {
    if (choice == 0) {
      return ListView(
        children: <Widget>[
          for (var i = 0; i < data.length; i++)
            ProductBox(
              name: data[i]['name'],
              description: data[i]['des'],
              price: data[i]['price'],
              image: data[i]['image'],
            )
        ],
      );
    }
    if (choice == 1) {
      return Scaffold(
        body: _buildChildForDrawer(index),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Drawer Header"),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text("Item 1"),
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
              ListTile(
                title: Text("Item 2"),
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
              ),
              ListTile(
                title: Text("Item 3"),
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
              ),
              ListTile(
                title: Text("Exit Menu"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    }
    if (choice == 3) {
      return ListView(
        children: <Widget>[
          Container(
            child: null,
          )
        ],
      );
    }
    if (choice == 2) {
      return Profile();
    }
    return Container(
      child: Center(
        child: Text(
          'You are in trouble',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }

  void _changeView(int index) {
    setState(() {
      choice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // body: _buildSuggestion(),
      body: _buildChild(choice),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text('Account'),
          ),
        ],
        currentIndex: choice,
        selectedItemColor: Colors.amber,
        onTap: _changeView,
      ),
    );
  }
}
