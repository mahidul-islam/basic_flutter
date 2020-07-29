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
    return Text('two');
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
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: choice,
          selectedItemColor: Colors.amber,
          // onTap: null,
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
