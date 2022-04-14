import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/pages/edit_page.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  bool isLoading = false;

  @observable
  List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
  }

  Future apiPostDelete(Post post) async {
    isLoading = true;
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
    isLoading = false;
    return response != null;
  }

  Future apiEditNote(Post post, context) async {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> EditPage()));
    isLoading = true;
    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if (response != null) {
      return apiPostList();
    }
  }
}
