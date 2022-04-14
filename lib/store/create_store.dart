import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/service/http_service.dart';

part 'create_store.g.dart';
class CreateStore = _CreateStore with _$CreateStore;
abstract class _CreateStore with Store{

  @observable bool isLoading = false;
  @observable TextEditingController titleController = TextEditingController();
  @observable TextEditingController bodyController = TextEditingController();

  void createPost(context)async{
    isLoading = true;
    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body:body);
    if(title.isNotEmpty && body.isNotEmpty){
      await Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value) =>
      getResponse(context));
    }else{
      isLoading =false;
    }
  }

  void getResponse(context){
    isLoading = false;
    Navigator.pop(context, "done");
  }
}