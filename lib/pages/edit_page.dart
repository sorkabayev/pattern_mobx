import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/store/edit_store.dart';
import '../views/item_edit_post.dart';

class EditPage extends StatefulWidget {
  static const String id = "edit_page";
  Post? post;

  EditPage({Key? key, this.post}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  EditStore store = EditStore();

  void initState() {
    // TODO: implement initState
    super.initState();
    store.titleController = TextEditingController();
    store.bodyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      body: Observer(
        builder: (_) => itemEditPost(store , context,widget.post!),

        // builder: (EditController controller) =>  itemEditPost(controller,context, widget.post),
      ),
    );
  }
}
