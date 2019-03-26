import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//序章 自定义名称推荐

class RandomWords extends StatefulWidget {
  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Startup Name Generator')),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved,)
          ],
        ),
        body: _buildSuggestions()
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          final tiles = _saved.map(
                  (pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              }
          );

          final divided = ListTile
              .divideTiles(
              context: context,
              tiles: tiles).toList();

          return Scaffold(
              appBar: AppBar(
                title: Text("Saved Suggestions"),
              ),
              body: ListView(children: divided)
          );
        })
    );
  }


  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(height: 2.0);
        final index = i ~/ 2;
        if (index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

}