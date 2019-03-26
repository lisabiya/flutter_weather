import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final List<ListItem> items = new List<ListItem>.generate(1000,
        (i) =>
    i % 6 == 0 ? HeadingItem("Heading $i")
        : MessageItem("Sender $i", "Message body $i"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("标题列表")),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is HeadingItem) {
            return ListTile(
              leading: Icon(Icons.schedule),
              title: Text(
                item.heading,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline,
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.body),
            );
          }
        },
      ),
    );
  }
}

class Grids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Grid")),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(1000, (index) {
          return MButton();
        }),
      ),
    );
  }

}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("点击事件")),
      ),
      body: MButton(),
    );
  }
}

class MButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      borderRadius: BorderRadius.circular(8.0),
      highlightColor: Colors.blue,
      splashColor: Colors.amber,
      child: Container(
        padding: new EdgeInsets.all(12.0),
        child: Center(child: new Text('Flat Button')),
      ),
    );
  }

}


abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}