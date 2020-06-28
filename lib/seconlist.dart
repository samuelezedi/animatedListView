import 'package:animatedlistview/models/list_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalList extends StatefulWidget {
  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> with SingleTickerProviderStateMixin  {
  var listData = youtubeData;
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2,), vsync: this);
    animationController = Tween(begin: 0.0, end: 1.0)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Vertical List'),
        elevation: 0,
      ),
      body: NotificationListener(
        onNotification: (notification){

        },
        child: ListView.builder(
          itemCount: listData.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  color: Colors.white
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
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
              );
            }
        ),
      ),
    );
  }
}
