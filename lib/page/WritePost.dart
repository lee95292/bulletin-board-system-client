import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../model/Post.dart';

class WritePost extends StatefulWidget {
  const WritePost({super.key, required this.addPost});
  final Function addPost;

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _contentController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).colorScheme.primary);
    return Container(
      // Outter Box Container
      color: Colors.black.withOpacity(0.2),
      alignment: Alignment(0, 1),

      // Inner Box
      child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.99,
          // color: Theme.of(context).colorScheme.primary, // TODO contenxt 에서 colortheme 못불러옴;;
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(1)),
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                ),
                Container(
                  child: TextField(
                    maxLines: 20,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    controller: _contentController,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () => widget.addPost(
                          _titleController.text, _contentController.text),
                      child: Text('등록')), // TODO 등록 버튼이 화면의 좌하단에 고정되도록
                )
              ],
            ),
          ) // TODO flutter_animate로 up slide animation 추가
          ),
    );
  }
}
