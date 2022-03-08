import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/questions.dart';
import 'package:academy_quiz/src/controller/export_controller.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizController>(builder:
        (BuildContext context, QuizController controller, Widget? widget) {
      return Scaffold(
        appBar: _appBar(controller),
        body: Stack(
          children: <Widget>[
            SvgPicture.asset(
              'images/svg/background.svg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: _handleBody(controller),
                )
              ],
            ),
          ],
        ),
      );
    });
  }

  PreferredSizeWidget _appBar(QuizController controller) {
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
          _onBackPressed(controller);
        },
      ),
    );
  }

  Widget _handleBody(QuizController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _progressionBar(controller),
          const Questions(),
        ],
      ),
    );
  }

  Widget _progressionBar(QuizController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Spacing.x2, vertical: Spacing.x3),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.red,
                minHeight: 15,
                value: (controller.index + 1) / 10),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _onBackPressed(QuizController controller) {
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
}
