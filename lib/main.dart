import 'package:bulltin_board_system/controller/UserController.dart';
import 'package:bulltin_board_system/page/Article.dart';
import 'package:bulltin_board_system/page/Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './model/Post.dart';
import 'page/Board.dart';
import 'page/WritePost.dart';
import 'page/Routes.dart';

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
  final userController = Get.put(UserController());
  List<Post> posts = [
    Post.fromJson({
      'id': '1',
      'author': 'marco',
      'content': 'hahaha',
      'title': 'How do i Learn Flutter?'
    }),
  ];
  int _selectedIndex = 0;

  void _onBotNavItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addPost(String title, String content) {
    var id = 'test_id'; // @TODO UUID
    var author = 'anonymous'; // @TODO nickname(SSO)
    setState(() {
      posts.add(Post.fromJson(
          {'id': id, 'author': author, 'title': title, 'content': content}));
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
      Auth()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Bulletin Board System',
        getPages: [
          GetPage(name: Routes.Auth, page: () => Auth()),
          GetPage(name: Routes.Article, page: () => Article()),
          GetPage(name: Routes.Board, page: () => Board(posts: posts)),
          GetPage(
              name: Routes.WritePost, page: () => WritePost(addPost: addPost))
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(userController.isLoggin.toString())),
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
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "My Page",
              )
            ],
            onTap: _onBotNavItemTap,
          ),
          body: _listBottomNav.elementAt(_selectedIndex),
          floatingActionButton:
              FloatingActionButton(onPressed: userController.login),
        ));
  }
}
