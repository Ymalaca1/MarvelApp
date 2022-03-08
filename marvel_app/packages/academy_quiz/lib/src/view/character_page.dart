import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academy_quiz/src/controller/export_controller.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.primary,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    // Put consumer on return of the body, getting characters from API by controller construct
    return Consumer(builder: (
      BuildContext context,
      CharacterController characterController,
      Widget? widget,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _appBar(),
          Expanded(
            child: ListView.builder(
              itemCount: characterController.heroesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    color: ColorPalette.secondary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          // Getting the characters name from heroes list on character controller
                          characterController.heroesList[index].name
                              .toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.anton(
                              fontSize: Spacing.x3_half, color: Colors.white),
                        ),
                        // Getting the characters picture from heroes list on character controller
                        Image.network(
                          characterController.heroesList[index].image,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );
    });
  }

  PreferredSizeWidget _appBar() {
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
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
