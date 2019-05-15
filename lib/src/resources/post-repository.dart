import 'package:bolc_trial/src/model/post-model.dart';
import 'package:bolc_trial/src/resources/post-api-helper.dart';
import 'package:flutter/material.dart';

class PostRepositiry {
  final postApiHelper = PostApiHelper();

  Future<PostListModel> fetchAllPost() => postApiHelper.fetchPosts();


}
