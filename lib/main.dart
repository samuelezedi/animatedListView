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
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
              return Column(
                children: <Widget>[
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      image: DecorationImage(
                        image: NetworkImage(listData[index].thumbNail)
                      )
                    ),

                  ),
                  Text(
                    listData[index].channelTitle,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xff5927ff),
                      fontWeight: FontWeight.w500,
                      height: 2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              );
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

