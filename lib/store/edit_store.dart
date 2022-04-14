import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/service/http_service.dart';

part 'edit_store.g.dart';

class EditStore = _EditStore with _$EditStore;
abstract class _EditStore with Store{

  @observable TextEditingController titleController = TextEditingController();
  @observable TextEditingController bodyController = TextEditingController();

  @observable bool isLoading = false;


void editPost(context)async{
  isLoading = true;
  String title = titleController.text.trim().toString();
  String body = titleController.text.trim().toString();
  Post post = Post(title: title, body: body);
  if(title.isNotEmpty && body.isNotEmpty){
    await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post)).then((value) => getResponse(context));
  }
}

void getResponse(context){
  isLoading = false;
  Navigator.pop(context, "done");
}

}