import 'package:bolc_trial/src/model/post-model.dart';
import 'package:flutter/material.dart';
import 'package:bolc_trial/src/blocs/post-bloc.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    postBloc.fetchALlPost();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Bloc Patter Post !'),
        ),
      ),
      body: StreamBuilder(
        stream: postBloc.allPosts,
        builder: (context, AsyncSnapshot<PostListModel> snapshot) {
          print('${snapshot.data}');
          return snapshot.data != null
              ? buildPostList(snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  buildPostList(data) {
    return ListView.builder(
      itemCount: data.posts.length,
      itemBuilder: (constext, index) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: Center(child: Image.network(data.posts[index].image)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
