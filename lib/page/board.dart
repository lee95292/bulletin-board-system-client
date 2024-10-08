import 'package:bulltin_board_system/page/Article.dart';
import 'package:bulltin_board_system/page/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../model/Post.dart';

class Board extends StatefulWidget {
  const Board({super.key, title, required this.posts});
  final List<Post> posts;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
                  onTap: () => Get.toNamed(Routes.Article,
                      arguments: {'id': widget.posts[index].id}),
                  child: Padding(
                      // height: 60,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 3, child: Text(widget.posts[index].title)),
                          Expanded(
                              flex: 1, child: Text(widget.posts[index].author)),
                        ],
                      ))));
        });
  }
}
