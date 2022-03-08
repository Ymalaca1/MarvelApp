import 'package:academy_quiz/src/model/export_model.dart';
import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class QuizController with ChangeNotifier {
  //creating variables to alocate characters id
  final int _bw = 1017109;
  final int _ca = 1009220;
  final int _ga = 1010763;
  final int _hu = 1009351;
  final int _im = 1009368;
  final int _sw = 1009562;
  final int _sm = 1016181;
  final int _st = 1009629;
  final int _th = 1009664;
  int _index = 0;
  int get index => _index;
  List<QuizModel> _list = [];
  List<QuizModel> get list => _list;
  List<int> _currentResult = [];
  List<int> _results = [];
  Map _map = Map();
  DioMethod _dioMethod = DioMethod();
  Heroes _finalHero = Heroes(
      id: 111111,
      image: 'https://cdn-icons-png.flaticon.com/512/190/190420.png',
      name: 'Carregando...',
      description: 'carregando');
  Heroes get finalHero => _finalHero;

  //constructor for set the questions list
  QuizController() {
    _setController();
  }

  //setting the questions list
  _setController() {
    _list = [
      QuizModel(utterance: 'QUAL É O SEU SUPERPODER:', list: [
        AlternativesListModel(alternative: 'MAGIA', hero: [_sw, _th, _st]),
        AlternativesListModel(alternative: 'INVISIBILIDADE', hero: [_sm, _bw]),
        AlternativesListModel(alternative: 'FORÇA', hero: [_hu, _ca, _ga]),
        AlternativesListModel(alternative: 'DINHEIRO', hero: [_im])
      ]),
      QuizModel(utterance: 'QUAL É A SUA MOTIVAÇÃO DE HERÓI?', list: [
        AlternativesListModel(
            alternative: 'ME TORNAR FAMOSO', hero: [_im, _th]),
        AlternativesListModel(
            alternative: 'SALVAR AS PESSOAS', hero: [_sm, _ca, _st]),
        AlternativesListModel(alternative: 'SE SENTIR VIVO', hero: [_hu]),
        AlternativesListModel(
            alternative: 'FUGIR DO PASSADO', hero: [_bw, _ga, _sw])
      ]),
      QuizModel(utterance: 'SOBRE SUA IDENTIDADE\nDE HERÓI:', list: [
        AlternativesListModel(
            alternative: 'PREFERE O ANONIMATO', hero: [_sm, _bw]),
        AlternativesListModel(
            alternative: 'AMIGOS E FAMÍLIA SABEM', hero: [_hu, _sw]),
        AlternativesListModel(
            alternative: 'APENAS O AMOR DA SUA VIDA SABE', hero: [_ca]),
        AlternativesListModel(
            alternative: 'NÃO SE IMPORTA COM ISSO', hero: [_th, _ga, _st, _im])
      ]),
      QuizModel(
          utterance: 'A CIDADE ESTÁ SENDO ATACADA, QUAL É SUA PRIMEIRA AÇÃO?',
          list: [
            AlternativesListModel(
                alternative: 'EVACUA OS CIVIS', hero: [_sm, _bw]),
            AlternativesListModel(
                alternative: 'ENFRENTA OS INIMIGOS', hero: [_ca, _hu]),
            AlternativesListModel(
                alternative: 'CAÇA O VILÃO RESPONSÁVEL', hero: [_th, _im, _sw]),
            AlternativesListModel(
                alternative: 'ACIONA REFORÇOS', hero: [_ga, _st])
          ]),
      QuizModel(utterance: 'COMO É O SEU UNIFORME?', list: [
        AlternativesListModel(
            alternative: 'FEITO A MÃO E VERSÁTIL', hero: [_sm, _hu, _sw]),
        AlternativesListModel(alternative: 'DISCRETO', hero: [_bw, _ga]),
        AlternativesListModel(
            alternative: 'ORIGINAL E CHAMATIVO', hero: [_ca, _th, _st]),
        AlternativesListModel(alternative: 'TECNOLOGIA DE PONTA', hero: [_im])
      ]),
      QuizModel(utterance: 'SOBRE SUA PERSONALIDADE...', list: [
        AlternativesListModel(
            alternative: 'FRIO E CALCULISTA', hero: [_bw, _sw, _ga]),
        AlternativesListModel(
            alternative: 'OTIMISTA E ESPERANÇOSO', hero: [_sm, _st]),
        AlternativesListModel(
            alternative: 'MOTIVADOR E LÍDER', hero: [_ca, _th]),
        AlternativesListModel(
            alternative: 'REALISTA E COERENTE', hero: [_im, _hu])
      ]),
      QuizModel(utterance: 'VOCÊ PREFERE:', list: [
        AlternativesListModel(
            alternative: 'LIDERAR UM GRUPO', hero: [_ca, _im]),
        AlternativesListModel(
            alternative: 'TRABALHAR SOZINHO', hero: [_sw, _bw]),
        AlternativesListModel(
            alternative: 'FAZER PARTE DE UMA EQUIPE', hero: [_hu, _ga, _st]),
        AlternativesListModel(
            alternative: 'ADAPTAR-SE À SITUAÇÃO', hero: [_sm, _th])
      ]),
      QuizModel(utterance: 'UM VILÃO MATOU O AMOR DA SUA VIDA... VOCÊ:', list: [
        AlternativesListModel(alternative: 'TIRA UM TEMPO', hero: [_sm, _im]),
        AlternativesListModel(
            alternative: 'SE DEDICA AINDA MAIS AO HEROÍSMO', hero: [_ca, _st]),
        AlternativesListModel(
            alternative: 'BUSCA VINGANÇA', hero: [_sw, _th, _ga]),
        AlternativesListModel(
            alternative: 'DESISTE DE SER UM HERÓI', hero: [_hu, _bw])
      ]),
      QuizModel(utterance: 'COMO É O SEU EQUIPAMENTO?', list: [
        AlternativesListModel(
            alternative: 'FUNCIONA MELHOR À DISTÂNCIA', hero: [_sw, _st]),
        AlternativesListModel(
            alternative: 'MEU PUNHO É MINHA ARMA', hero: [_hu, _bw, _sm]),
        AlternativesListModel(
            alternative: 'UTILIZO-O DE FORMA DEFENSIVA', hero: [_ca]),
        AlternativesListModel(
            alternative: 'EXTREMAMENTE AGRESSIVO', hero: [_th, _im, _ga])
      ]),
      QuizModel(
          utterance: 'QUAL É O PRINCIPAL REQUISITO PARA SER UM BOM HERÓI?',
          list: [
            AlternativesListModel(alternative: 'PROTETOR', hero: [_im, _hu]),
            AlternativesListModel(
                alternative: 'AUDACIOSO', hero: [_th, _ga, _sw]),
            AlternativesListModel(alternative: 'CORAJOSO', hero: [_ca, _bw]),
            AlternativesListModel(alternative: 'PERSISTENTE', hero: [_sm, _st])
          ]),
    ];
    notifyListeners();
  }

  //setting selected alternative
  void setSelect(AlternativesListModel data) {
    _cleanActiveList();
    data.activate = true;
    _currentResult = [];
    _currentResult.addAll(data.hero);
    notifyListeners();
  }

  //cleaning selected alternative
  void _cleanActiveList() {
    for (int i = 0; i < _list.length; i++) {
      for (int j = 0; j < _list[i].list.length; j++) {
        _list[i].list[j].activate = false;
      }
    }
    _currentResult = [];
  }

  //cleaning _index, _results, _currentResult and _finalHero when user backs to home_page
  void reset() {
    _index = 0;
    _results = [];
    _currentResult = [];
    _finalHero = Heroes(
        id: 111111,
        image: 'https://cdn-icons-png.flaticon.com/512/190/190420.png',
        name: 'Carregando...',
        description: 'carregando');
    notifyListeners();
  }

  //what to do in the last question before going to the result page
  void lastQuestion(BuildContext context) {
    _addCurrentResult();
    bool _next = false;
    for (int i = 0; i < list[_index].list.length; i++) {
      if (list[_index].list[i].activate) {
        _next = true;
      }
    }
    if (_next) {
      Navigator.of(context).pushNamed(Routes.result_page);
      _getResult();
      notifyListeners();
    }
  }

  //adding _currentResult in _results
  void _addCurrentResult() {
    _results.addAll(_currentResult);
    _currentResult = [];
  }

  //what to do in the current question before going to the next question
  void nextQuestion() {
    _addCurrentResult();
    if ((_index + 1) <= _list.length) {
      bool _next = false;
      for (int i = 0; i < _list[_index].list.length; i++) {
        if (_list[_index].list[i].activate) {
          _next = true;
        }
      }
      if (_next) {
        _index++;
        notifyListeners();
      }
    }
  }

  //getting the result character
  void _getResult() {
    //counting how many times each hero has been chosed
    Map<String, dynamic> _mapResult = {};
    _results.forEach((element) {
      _mapResult['$element'] = (_mapResult['$element'] ?? 0) + 1;
    });
    int _result = 0;
    int _maiorResult = 0;
    //verifying which hero appears the most
    _results.forEach((element) {
      if (_mapResult['$element'] > _maiorResult) {
        _maiorResult = _mapResult['$element'];
        _result = element;
      }
    });
    _loadHero(_result);
  }

  //getting the hero from API
  void _loadHero(_result) async {
    _finalHero = await _dioMethod.loadCharacter(_result);
    notifyListeners();
  }

  //controlling the color of alternatives
  bool get validateButton => _currentResult.isNotEmpty;
}
