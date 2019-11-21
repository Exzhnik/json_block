import 'package:flutter/material.dart';
import 'package:json_block/data/model/result.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  Articles article;

  Detail({this.article});

  _launchURL() async {
    var url = article.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Builder(
        builder: (context) {
          return Material(
              child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text("Test News"),
            ),
            body: ListView(
              padding: EdgeInsets.all(5.0),
              children: <Widget>[
                Hero(
                  tag: article.urlToImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(article.urlToImage)),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    article.title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                 Wrap(
                   alignment: WrapAlignment.center,
                   
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(article.content),
                      ),
                      FlatButton(
                        color: Colors.white,
                        onPressed: _launchURL,
                        child: Text('source', style: TextStyle(color: Colors.blue),),
                      )
                    ],
                  ),
            
              ],
            ),
          ));
        },
      ),
    );
  }
}
