import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  static final pageName = "avatar";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: [
          Container(
            padding: EdgeInsets.all(7),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pinimg.com/originals/bb/d3/f1/bbd3f101733f1a7d8bdc9c6b5aed7776.png"),
              radius: 21.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("LP"),
              backgroundColor: Colors.brown,
            ),
          ),
        ],

      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://i.pinimg.com/originals/bb/d3/f1/bbd3f101733f1a7d8bdc9c6b5aed7776.png"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}