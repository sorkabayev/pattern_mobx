
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_mobx/store/home_store.dart';
import '../pages/edit_page.dart';
Widget itemOfPost(store,  post, context) {
  HomeStore store  = HomeStore();
  return Slidable(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(post.body!),
        ],
      ),
    ),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          label: 'Update',
          backgroundColor: Colors.indigo,
          icon: Icons.edit,
          onPressed: (context) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(post: post,))).then((value){
            });
          },
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (context) {
            store.apiPostDelete(post);
          },
        ),
      ],
    ),
  );
}