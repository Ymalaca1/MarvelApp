import 'package:academy_quiz/academy_quiz.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:academy_quiz/src/controller/export_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2(builder: (
      BuildContext context,
      QuizController quizController,
      UserController userController,
      Widget? widget,
    ) {
      return Scaffold(
        appBar: _appBar(quizController),
        body: _handleBody(quizController, userController),
      );
    });
  }

  PreferredSizeWidget _appBar(QuizController quizController) {
    return AppBar(
      toolbarHeight: Spacing.x8,
      elevation: 0,
      backgroundColor: (ColorPalette.primary),
      centerTitle: true,
      title: SvgPicture.asset(
        "images/svg/logo.svg",
        height: Spacing.x6,
      ),
      leading: IconButton(
        color: Colors.red,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          _onBackPressed(quizController);
        },
      ),
    );
  }

  Future<dynamic> _onBackPressed(QuizController quizController) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorPalette.primary,
        title: Text(
          'Você tem certeza?',
          textAlign: TextAlign.start,
          style: GoogleFonts.anton(fontSize: Spacing.x3, color: Colors.white),
        ),
        content: Text(
          'Você voltará para tela inicial e o progresso será perdido',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: Spacing.x2, color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Não',
              style: GoogleFonts.anton(
                  fontSize: Spacing.x2_half, color: ColorPalette.secondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              quizController.reset();
            },
            child: Text(
              'Sim',
              style: GoogleFonts.anton(
                  fontSize: Spacing.x2_half, color: ColorPalette.secondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _handleBody(
      QuizController quizController, UserController userController) {
    return Container(
      color: ColorPalette.primary,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Parabéns ${userController.currentUser.userName}! Você terminou o quiz! \nVocê é...',
            textAlign: TextAlign.center,
            style: GoogleFonts.anton(
                fontSize: Spacing.x2_half, color: Colors.white),
          ),
          Text(
            quizController.finalHero.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.anton(
                fontSize: Spacing.x5, color: ColorPalette.secondary),
          ),
          SizedBox(
            height: 50.h,
            child: Image.network(
              quizController.finalHero.image,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 15.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  quizController.finalHero.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.anton(
                      fontSize: Spacing.x2_half, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
