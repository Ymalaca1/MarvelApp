import 'package:academy_quiz/src/model/export_model.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:academy_quiz/src/controller/export_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizController>(builder:
        (BuildContext context, QuizController controller, Widget? widget) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.x2),
        child: Column(
          children: [
            _utteranceContainer(controller),
            _containerAlternatives(controller),
            _button(controller, context),
          ],
        ),
      );
    });
  }

  //main container with "questões", x/10 and utterance
  Container _utteranceContainer(QuizController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: Border.all(width: 1.3, color: Colors.black38),
        color: (ColorPalette.primary),
      ),
      height: 20.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.x1_half, vertical: Spacing.x1_half),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //container QUESTÕES
                Container(
                  width: 10.h,
                  height: 3.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.elliptical(50, 40),
                    ),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'QUESTÕES',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                          fontSize: Spacing.x1_half, color: Colors.white),
                    ),
                  ),
                ),
                //container x/10
                Container(
                  width: 8.h,
                  height: 3.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.elliptical(50, 40),
                    ),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '${(controller.index + 1).toString()} / ${(controller.list.length).toString()} ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                          fontSize: Spacing.x1_half, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: Spacing.x3),
              child: Center(
                child: Text(
                  controller.list[controller.index].utterance,
                  style: GoogleFonts.anton(
                      fontSize: Spacing.x3_half, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _containerAlternatives(QuizController controller) {
    return Padding(
      padding: EdgeInsets.only(top: Spacing.x2),
      child: Container(
        height: 39.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.3,
            color: Colors.black38,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: (ColorPalette.primary),
        ),
        child: _alternativesList(controller),
      ),
    );
  }

  //creating a widget for alternative list
  Widget _alternativesList(QuizController controller) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Spacing.x2, horizontal: Spacing.x2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          controller.list[controller.index].list.length,
          (index) => _alternative(
              controller.list[controller.index].list[index], index, controller),
        ),
      ),
    );
  }

  // individual alternatives container (velocidade, força...)
  Widget _alternative(AlternativesListModel alternatives, int index,
      QuizController controller) {
    return GestureDetector(
      onTap: () {
        controller.setSelect(alternatives);
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.x1, vertical: Spacing.x2_half),
            margin: EdgeInsets.only(top: Spacing.x1),
            child: Center(
              child: Text(
                alternatives.alternative,
                style: GoogleFonts.anton(
                  fontSize: Spacing.x1_half,
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: alternatives.activate ? Colors.red : Colors.grey,
              ),
              borderRadius: const BorderRadius.all(Radius.elliptical(60, 50)),
              color: const Color(0xfffaf7f7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.7.h, left: Spacing.x1_half),
            child: Container(
              height: Spacing.x4,
              width: Spacing.x4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/png/${_getIcon(index)}.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //confirm alternative button
  Widget _button(QuizController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Spacing.x5),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.3, color: Colors.black38),
            borderRadius: BorderRadius.circular(30),
            color: (controller.validateButton
                ? ColorPalette.secondary
                : ColorPalette.primary),
          ),
          height: 6.h,
          width: 40.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CONFIRMAR',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.anton(
                      color: Colors.white, fontSize: Spacing.x2_half)),
            ],
          ),
        ),
        onTap: () {
          if (controller.index + 1 == controller.list.length) {
            controller.lastQuestion(context);
          } else {
            controller.nextQuestion();
          }
        },
      ),
    );
  }

  String _getIcon(int index) {
    switch (index) {
      case 0:
        return 'A';
      case 1:
        return 'B';
      case 2:
        return 'C';
      case 3:
        return 'D';
      default:
        return '.';
    }
  }
}
