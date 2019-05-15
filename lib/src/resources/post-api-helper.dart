import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bolc_trial/src/model/post-model.dart';
import 'package:http/http.dart' show Client;

class PostApiHelper {
  Client client = Client();
  final baseUrl = 'http://5c9db1fd3be4e30014a7d3da.mockapi.io/post';
  // final baseUrl = 'http://5c9db1fd3be4e30014a7d3da.mockapi.io/post';

  var headers = {'Content-Type': 'application/json'};

  Future<PostListModel> fetchPosts() async {
    print('::: Entered :::');

    final response = await client.get(baseUrl, headers: headers);

    print('::: ${response.body} :::');
    return PostListModel.fromJson(json.decode(response.body));
  }
}
