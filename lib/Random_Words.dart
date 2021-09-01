import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() {
    return RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords> {
  final _randomPairs = <WordPair>[];
  final _savedPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),

        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return Divider();
          }

          if (index >= _randomPairs.length) {
            _randomPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomPairs[index]);

          /*return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          ); */
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedPairs.contains(pair);
    return ListTile(title: Text(pair.asPascalCase, style: TextStyle(
        fontSize: 18.0)
    ), trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: (alreadySaved) ? Colors.red : null,

    ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _savedPairs.remove(pair);
            }
            else {
              _savedPairs.add(pair);
            }
          }
          );
        }
    );
  }

    void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        final Iterable<ListTile> tiles = _savedPairs.map((WordPair pair){
          return ListTile(
              title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)
    ));

    });

        final List<Widget> divided =
            ListTile.divideTiles(tiles: tiles, context: context).toList();

        return Scaffold(
          appBar: AppBar(title: Text("Favourites")),
          body: ListView(children: divided)
        );

    }
    ));
    }

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("SID's App"), actions: <Widget>
        [ IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))


        ],),
        body: _buildList(),


      );
    }
  }

