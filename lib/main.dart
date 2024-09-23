import 'package:flutter/material.dart';
import './page/board.dart';
import './model/Post.dart';

/*
Min Value Product

- 익명 게시판 with CRUD
- 공유
- SSO 

- 첨부파일 > SSO(email)> 추천 > admin > community?
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Post> posts = [Post('1', 'marco', 'hahaha', 'How do i Learn Flutter?')];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bulletin Board System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Board(
        posts: posts,
      ),
    );
  }
}
