import 'package:bolc_trial/src/model/post-model.dart';
import 'package:bolc_trial/src/resources/post-repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class PostBlocs {
  final repository = PostRepositiry();
  final postFetcherSubject = PublishSubject<PostListModel>();

  Observable<PostListModel> get allPosts => postFetcherSubject.stream;

  fetchALlPost() async {
    PostListModel post = await repository.fetchAllPost();
    postFetcherSubject.sink.add(post);
  }

  dispose() {
    postFetcherSubject.close();
  }
}

final postBloc = PostBlocs();
