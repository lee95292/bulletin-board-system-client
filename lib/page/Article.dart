import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../model/Comment.dart';

class Article extends StatefulWidget {
  Article({super.key});
  @override
  State<Article> createState() => _ArticleState();
  List<Comment> comments = [
    Comment('1', 'marco', 'How do i Learn Flutter?'),
    Comment('2', '졸려', '대한민국 직장인 평균 수면시간은??'),
    Comment('3', '퇴근시켜줘', '주식 대박 가즈앗'),
    Comment('4', '플러터 귀찮', '플러터 공부법 추천좀?'),
    Comment('1', 'marco', 'How do i Learn Flutter?'),
    Comment('2', '졸려', '대한민국 직장인 평균 수면시간은??'),
    Comment('3', '퇴근시켜줘', '주식 대박 가즈앗'),
    Comment('4', '플러터 귀찮', '플러터 공부법 추천좀?'),
    Comment('1', 'marco', 'How do i Learn Flutter?'),
    Comment('2', '졸려', '대한민국 직장인 평균 수면시간은??'),
    Comment('3', '퇴근시켜줘', '주식 대박 가즈앗'),
    Comment('4', '플러터 귀찮', '플러터 공부법 추천좀?'),
    Comment('1', 'marco', 'How do i Learn Flutter?'),
    Comment('2', '졸려', '대한민국 직장인 평균 수면시간은??'),
    Comment('3', '퇴근시켜줘', '주식 대박 가즈앗'),
    Comment('4', '플러터 귀찮', '플러터 공부법 추천좀?')
  ];
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topLeft,
        width: _mediaSize.width,
        color: _colorScheme.secondaryContainer,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: _colorScheme.background,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "It's title",
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: _colorScheme.primary,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          constraints: BoxConstraints(
                            minHeight: _mediaSize.height * 0.2,
                          ),
                          child: FittedBox(
                            child: Text(
                              "It's body\n \n\nt\nes\n\n\n\n\n\ntestR\nes\n\n\n\n\n\ntestR\nes\n\n\n\n\n\ntestR",
                              style: TextStyle(
                                  color: _colorScheme.primary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ]),
              ),
              //Comment
              Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: widget.comments
                        .map((comment) => Card(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(comment.content),
                                    Text(comment.author)
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        // margin: EdgeInsets.only(left: 10, right: 3), // TODO 적용안됨
        child: Row(
          children: [
            Flexible(
              child: TextField(),
              flex: 5,
            ),
            Flexible(
              child: TextButton(onPressed: () => {}, child: Text("등록")),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
