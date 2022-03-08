import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/export_controller.dart';

class UserName extends StatefulWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  //creating a key for name form
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              'images/png/backgroundUser.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: _body(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //creating a widget for body
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: Spacing.x5),
            child: SvgPicture.asset('images/svg/logo.svg'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Spacing.x3),
            child: Text(
              'Seja bem-vindo ao Academy Quiz!\nEm breve, você poderá abrir o seu coração e responder nossas perguntas. Antes de começarmos, por favor nos informe o seu nome:',
              style:
                  GoogleFonts.roboto(fontSize: Spacing.x2, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Spacing.x5),
            child: _form(),
          ),
        ],
      ),
    );
  }

  //creating a widget for form
  Widget _form() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.x5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _nameInput(),
          _confirmButton(),
          _characterButton(),
        ],
      ),
    );
  }

  //creating a widget for name input
  Widget _nameInput() {
    return Consumer(builder:
        (BuildContext context, UserController userController, Widget? widget) {
      return Container(
        margin: EdgeInsets.only(bottom: Spacing.x1_half),
        child: Form(
          key: _globalKey,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: ColorPalette.secondary,
                ),
              ),
              //changing text form field's background color
              fillColor: Colors.white,
              filled: true,
              hintText: 'Nome',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor insira o seu nome.';
              }
              return null;
            },
            onChanged: (value) {
              userController.setName(value);
            },
            keyboardType: TextInputType.name,
          ),
        ),
      );
    });
  }

  //creating a widget for confirm button
  Widget _confirmButton() {
    return Consumer2(builder: (BuildContext context,
        QuizController quizController,
        UserController userController,
        Widget? widget) {
      return Padding(
        padding: EdgeInsets.only(bottom: 35.h),
        child: SizedBox(
          width: 100.w,
          height: 8.h,
          child: ElevatedButton(
            onPressed: () {
              if (_globalKey.currentState?.validate() == true) {
                userController.setUser();
                quizController.reset();
                Navigator.of(context).pushNamed(Routes.quiz_page);
              }
            },
            child: Text(
              'INICIAR O QUIZ',
              style:
                  GoogleFonts.anton(fontSize: Spacing.x2, color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorPalette.secondary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  //button to view all the quiz characters
  Widget _characterButton() {
    return SizedBox(
      width: 100.w,
      height: 8.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.character_page);
        },
        child: Text(
          'PERSONAGENS DO QUIZ',
          style: GoogleFonts.anton(fontSize: Spacing.x2, color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorPalette.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    );
  }
}
