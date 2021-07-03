import 'package:flutter/material.dart';
import 'package:sample/next_page.dart';

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
      home: MyHomePage(title: 'firstpage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  final myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),


      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'
              ),
            ),
            TextField(
              focusNode: myFocusNode,
            ),
            OutlinedButton(
                child: Text("フォーカス"),
            onPressed: (){
            // ここにフォーカス
              myFocusNode.requestFocus();
            },
            ),
          ],
        ),
        ),
    );
  }
}
