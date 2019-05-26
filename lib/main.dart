import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as EnglishWord;

void main() => runApp(MyApp());

//
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.word}) : super(key: key);
  final String title;
  final String word;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//
class RandomWordState extends State<RandomWords> {
  final _suggestions = <EnglishWord.WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    final wordPair = EnglishWord.WordPair.random();
//    return Text(wordPair.asUpperCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
      if (i.isOdd) {
        return Divider();
      }

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(EnglishWord.generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(EnglishWord.WordPair pair) {
    return ListTile(
      title: Text(
        pair.asUpperCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lesson4",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: RandomWords(),
    );
  }

//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.yellow,
//      ),
//      home: MyHomePage(
//        title: 'Flutter Demo Home Page',
//      ),
//    );
//  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.q
        child: RandomWords(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
