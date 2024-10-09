import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

// Kakao / Naver / Google

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          margin: EdgeInsets.only(left: 40, right: 40, top: 5),
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Email을 입력해주세요", border: OutlineInputBorder()),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Password를 입력해주세요", border: OutlineInputBorder()),
                obscureText: true,
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextButton(onPressed: () => {}, child: Text("로그인")))
            ],
          ),
        ),
      ),
    );
  }
}
