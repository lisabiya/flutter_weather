import 'package:flutter/material.dart';
import 'Colors.dart';

class ListViews extends StatelessWidget {
  ListViews({this.position = 1});

  final position;

  @override
  Widget build(BuildContext context) {
    switch (position) {
      case 1:
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("第二章")),
          ),
          body: View1(),
        );
      case 2:
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("第二章")),
          ),
          body: View2(),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("第二章")),
          ),
          body: View3(),
        );
    }
  }

}

class View1 extends StatelessWidget {
  final _font = TextStyle(fontSize: 20.0,
      color: green);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.business),
          title: Text("商业", style: _font,),
          subtitle: Text("地点"),
          trailing: Icon(
            Icons.add,
            color: green,
          ),
        ),
        Divider(height: 2.0),
        ListTile(
          leading: Icon(Icons.school),
          title: Text("学校", style: _font,),
          subtitle: Text("地点"),
          trailing: Icon(
            Icons.add,
            color: green,
          ),
        ),
        Divider(height: 2.0),
      ],
    );
  }

}

class View2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 160.0,
            color: Colors.red,
          ),
          new Container(
            width: 160.0,
            color: Colors.blue,
          ),
          new Container(
            width: 160.0,
            color: Colors.green,
          ),
          new Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

}

class View3 extends StatelessWidget {
  final items = new List<String>.generate(100, (i) => "闹钟 $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length * 2,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(height: 1.0);
        final index = i ~/ 2;
        return ListTile(
          leading: Icon(Icons.schedule),
          title: new Text('${items[index]}'),
          subtitle: Text("地点"),
          onTap: (){
            print("$index");
          },
        );
      },
    );
  }
}