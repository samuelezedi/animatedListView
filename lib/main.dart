import 'package:animatedlistview/bloc.dart';
import 'package:animatedlistview/models/list_data.dart';
import 'package:animatedlistview/seconlist.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart';

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

class AnimatedListView extends StatefulWidget  {
  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> with SingleTickerProviderStateMixin  {

  Animation animation;
  AnimationController animationController;
  var listData = youtubeData;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Animated ListView'),
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context){
          return Bloc();
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification){

          },
          child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        var sp = Provider.of<Bloc>(context);
                        sp.setWidth(100);
                        sp.setHeight(100);
                          return VisibilityDetector(
                            key: Key("unique-key-${index.toString()}"),
                            onVisibilityChanged: (VisibilityInfo info) {

                              if(info.visibleFraction >= 0.5){
                                sp.changeWidth(index, 150);
                                sp.changeHeight(index, 150);
                                print(true);
                              } else {
                                sp.changeWidth(index, 100);
                                sp.changeHeight(index, 100);
                                print(false);
                              }

                              debugPrint("${info.visibleFraction} of my widget is visible ${index.toString()}");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                                    width: sp.getWidth(index),
                                    height: sp.getHeight(index),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11.0),
                                      image: DecorationImage(
                                        image: NetworkImage(listData[index].thumbNail),
                                        fit: BoxFit.cover
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
                              ),
                            ),
                          );
                      },
                      separatorBuilder: (context, index){
                        return SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: listData.length),


          ),
        ),

    );
  }
}

