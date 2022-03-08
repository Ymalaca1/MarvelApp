// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:academy_quiz/academy_quiz.dart';
import 'package:dio/dio.dart';
import 'package:academy_quiz/src/model/characters_model.dart';
import 'package:academy_quiz/src/controller/character_controller.dart';

void main() async {
  runApp(MarvelApp());
}

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizController()),
        ChangeNotifierProvider(create: (_) => CharacterController()),
        ChangeNotifierProvider(create: (_) => UserController()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: UserName(),
          routes: {
            Routes.quiz_page: (BuildContext context) => QuizzPage(),
            Routes.character_page: (BuildContext context) => CharacterPage(),
            Routes.name_page: (BuildContext context) => UserName(),
            Routes.character_page: (BuildContext context) => CharacterPage(),
            Routes.result_page: (BuildContext context) => ResultPage(),
          },
        );
      }),
    );
  }
}
