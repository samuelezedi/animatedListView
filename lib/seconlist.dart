import 'package:animatedlistview/models/list_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalList extends StatefulWidget {
  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  var listData = youtubeData;
  GlobalKey<AnimatedListState> key = GlobalKey();
  var list = <YoutubeModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var index = 0; index < listData.length;index++)
    {
      list.add(listData[index]);
      key.currentState.insertItem(index);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Vertical List'),
        elevation: 0,
      ),
      body: AnimatedList(
        key: key,
        initialItemCount: list.length,
        itemBuilder: (context, index, Animation animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Card(
              elevation: 2,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(list[index].thumbNail),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Text(list[index].title)
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
