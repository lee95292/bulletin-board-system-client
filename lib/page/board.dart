import 'package:flutter/material.dart';
import '../model/Post.dart';

class Board extends StatefulWidget {
  const Board({super.key, title, required this.posts});
  final List<Post> posts;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  //
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, index) {
      return Card(child: Text(widget.posts[index].title));
    });
  }
}
