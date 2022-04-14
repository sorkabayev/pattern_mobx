import 'package:flutter/material.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/store/edit_store.dart';

Widget itemEditPost(EditStore store, BuildContext context, Post post) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: store.titleController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                //   hintText: "Enter your note!",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: store.bodyController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                // hintText: "Enter your note!",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
           store.editPost(post);
          },
          child: const Text(
            "Update",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          minWidth: 300,
          height: 40,
          shape: const StadiumBorder(),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}