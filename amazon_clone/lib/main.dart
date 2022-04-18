import 'package:amazon_clone/widgets/drawerTab.dart';
import 'package:amazon_clone/widgets/topBar.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/widgets/productList.dart';
// import 'package:amazon_clone/widgets/tab_drawer.dart';
import 'package:amazon_clone/widgets/topBar.dart';
import 'package:amazon_clone/models/global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTab(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: dark_blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Image(
                      image: AssetImage("assets/amazon-logo-white.png"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.mic, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.grey,
        child: Column(
          children: [
            TopBar(),
            Expanded(
              child: ProductList(),
            )
          ],
        ),
      ),
    );
  }
}
