import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
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

  Widget _getList() {
    return Container(
      child: ListView(
        children: <Widget>[
          for (int i = 0; i < 10; i++) new Text("Hello"),
        ],
      ),
    );
  }

  var data = [
    {
      'name': 'iphone',
      'des': 'description',
      'price': 101,
      'image': 'iphone.jpg',
    },
    {
      'name': 'laptop',
      'des': 'dess description',
      'price': 200,
      'image': 'laptop.jpg',
    },
    {
      'name': 'iphone',
      'des': 'description',
      'price': 100,
      'image': 'iphone.jpg',
    },
    {
      'name': 'laptop',
      'des': 'dess description',
      'price': 200,
      'image': 'laptop.jpg',
    },
    {
      'name': 'iphone',
      'des': 'description',
      'price': 100,
      'image': 'iphone.jpg',
    },
    {
      'name': 'laptop',
      'des': 'dess description',
      'price': 200,
      'image': 'laptop.jpg',
    },
    {
      'name': 'iphone',
      'des': 'description',
      'price': 100,
      'image': 'iphone.jpg',
    },
    {
      'name': 'laptop',
      'des': 'dess description',
      'price': 200,
      'image': 'laptop.jpg',
    },
    {
      'name': 'iphone',
      'des': 'description',
      'price': 100,
      'image': 'iphone.jpg',
    },
    {
      'name': 'laptop',
      'des': 'dess description',
      'price': 200,
      'image': 'laptop.jpg',
    },
  ];

  int choice = 0;

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
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        // body: _buildSuggestion(),
        // body: _getList(),
        // body: ListView(
        //   children: <Widget>[
        //     for (var i = 0; i < data.length; i++)
        //       ProductBox(
        //         name: data[i]['name'],
        //         description: data[i]['des'],
        //         price: data[i]['price'],
        //         image: data[i]['image'],
        //       )
        //   ],
        // ),
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
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              "assets/appimages/placeholder.120.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          margin: EdgeInsets.all(30.0),
                          elevation: 5.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                ],
              ),
              elevation: 16.0,
            ),
            Container(
              child: Padding(
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Attribute :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Value",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Attribute :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Value",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Attribute :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Value",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Attribute :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Value",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Attribute :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Value",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Attribute :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Value",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Image.asset("assets/appimages/" + image),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
