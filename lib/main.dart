import 'package:flutter/material.dart';
import 'src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Article> _article = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new ListView(
        children: _article.map(_build).toList(),
      )  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _build(thisArticle){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new ListTile(
        title: new Text(
          thisArticle.text,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: new Text('${thisArticle.commentsCount} comments'),

        onTap: () async {
          final fakeUrl = "http://${thisArticle.domain}";
          if(await canLaunch(fakeUrl))
            await launch(fakeUrl);

        },
      ),
    );
  }
}
