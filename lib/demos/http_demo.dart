// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts()
    .then((onValue) => print(onValue));

    // final post = {
    //   'title': 'hello',
    //   'description': 'nice to meet you.'
    // };

    // final postJson = json.encode(post);
    // print(postJson);
    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted is Map);

    // final postModel = Post.fromJson(postJsonConverted);
    // print('title:${postModel.title}, description:${postModel.description}');
    // print('${json.encode(postModel)}');

  }

  Future<List<Post>>fetchPosts() async {
    final response = await http.get('http://resource.ninghao.net/demo/posts.json');
    if (response.statusCode == 200) {
      final repsonseBody = json.decode(response.body);
      List<Post> posts = repsonseBody['posts']
      .map<Post>((item) => Post.fromJson(item))
      .toList();
      return posts;
    } else {
      throw Exception('failed to get the json file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        // print('${snapshot.data}')
        // return Container(child: Text('data'),);
        if (snapshot.connectionState ==  ConnectionState.waiting) {
          return Center(
            child: Text('Loading ...')
          );
        }

        return ListView(children: snapshot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
        }).toList(),
        );
      },
      );
  }
}


class Post {
  final int id;
  final String author;
  final String imageUrl;
  final String title;
  final String description;

  Post(
    this.id,
    this.author,
    this.imageUrl,
    this.title,
    this.description
  );

  Post.fromJson(Map json)
    : title = json['title'],
      description = json['description'],
      id = json['id'],
      author = json['author'],
      imageUrl = json['imageUrl'];

  Map toJson() => {
    'title': title,
    'description': description
  };
}