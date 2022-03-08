class QuizModel {
  String _utterance;
  String get utterance => _utterance;
  List<AlternativesListModel> _list;
  List<AlternativesListModel> get list => _list;
  QuizModel({
    required utterance,
    required list,
  })  : _utterance = utterance,
        _list = list;
}

class AlternativesListModel {
  String _alternative;
  String get alternative => _alternative;
  List<int> _hero;
  List<int> get hero => _hero;
  bool _activate;
  bool get activate => _activate;
  set activate(value) => _activate = value;
  AlternativesListModel({
    required hero,
    required alternative,
    activate = false,
  })  : _hero = hero,
        _alternative = alternative,
        _activate = activate;
}
