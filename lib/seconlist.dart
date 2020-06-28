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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        initialItemCount: listData.length,
        itemBuilder: (context, index, animation) {

        },
      )
    );
  }
}
