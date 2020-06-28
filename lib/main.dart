import 'package:animatedlistview/models/list_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated ListView',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedListView(),
    );
  }
}

class AnimatedListView extends StatefulWidget {
  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> {

  var listData = youtubeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated ListView'),
        elevation: 0,
      ),
      body: ListView.separated(
          itemBuilder: (context, index){

          },
          separatorBuilder: (context, index){
            return SizedBox(
              width: 15,
            );
          },
          itemCount: listData.length),
    );
  }
}

