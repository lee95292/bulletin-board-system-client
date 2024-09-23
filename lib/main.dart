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
  runApp(BBS());
}

class BBS extends StatefulWidget {
  BBS({super.key});

  @override
  State<BBS> createState() => _BBSState();
}

class _BBSState extends State<BBS> {
  List<Post> posts = [Post('1', 'marco', 'hahaha', 'How do i Learn Flutter?')];
  bool isWriting = false;
  void toggleWriting() {
    setState(() {
      this.isWriting = !this.isWriting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bulletin Board System',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("title"),
          ),
          body: Stack(
            children: [
              Board(
                title: 'BBS',
                posts: posts,
              ),
              if (isWriting)
                Container(
                  child: Text('write'),
                )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'add a post',
            onPressed: toggleWriting,
          ),
        ));
  }
}
