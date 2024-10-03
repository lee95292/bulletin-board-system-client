import 'package:bulltin_board_system/page/Article.dart';
import 'package:flutter/material.dart';

import './model/Post.dart';
import './page/board.dart';
import 'page/WritePost.dart';

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
  List<Post> posts = [
    Post('1', 'marco', 'hahaha', 'How do i Learn Flutter?'),
    Post('2', '졸려', 'hahaha', '대한민국 직장인 평균 수면시간은??'),
    Post('3', '퇴근시켜줘', 'hahaha', '주식 대박 가즈앗'),
    Post('4', '플러터 귀찮', 'hahah', '플러터 공부법 추천좀?')
  ];
  var isWriting = false;
  int _selectedIndex = 0;
  void _onBotNavItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void toggleWriting() {
    setState(() {
      this.isWriting = !this.isWriting;
    });
  }

  void addPost(String title, String content) {
    var id = 'test_id'; // @TODO UUID
    var author = 'anonymous'; // @TODO nickname(SSO)
    setState(() {
      posts.add(Post(id, author, title, content));
      isWriting = !this.isWriting;
    });
  }

  List<Widget> _listBottomNav = [];

  _BBSState() {
    this._listBottomNav = [
      Board(
        title: 'BBS',
        posts: posts,
      ),
      WritePost(addPost: this.addPost),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bulletin Board System',
        routes: {'article': (contenxt) => Article()},
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Just a BBS"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: "Write Post",
              )
            ],
            onTap: _onBotNavItemTap,
          ),
          body: _listBottomNav.elementAt(_selectedIndex),
          floatingActionButton: FloatingActionButton(
            child: isWriting ? Icon(Icons.remove) : Icon(Icons.add),
            tooltip: 'add a post',
            onPressed: toggleWriting,
          ),
        ));
  }
}
