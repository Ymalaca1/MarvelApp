import 'package:api/api.dart';
import 'package:flutter/cupertino.dart';
import '../model/export_model.dart';

class CharacterController with ChangeNotifier {
  final List<int> _idList = [
    1017109, //Black Widow
    1009220, //Captain America
    1010763, //Gamora
    1009351, //Hulk
    1009368, //Iron-man
    1009562, //Scarlet Witch
    1016181, //Spider-man (Miles Morales)
    1009629, //Storm
    1009664, //Thor
  ];
  List<int> get idList => _idList;
  List<Heroes> _heroesList = [];
  List<Heroes> get heroesList => _heroesList;
  //creating an instance of DioMethod()
  DioMethod _dioMethod = DioMethod();

  // Constructor for get the Character list
  CharacterController() {
    getCharacterList();
  }

  //getting the character list
  void getCharacterList() {
    //for each id, get it's hero on API
    _idList.forEach((element) async {
      final _result = await _dioMethod.loadCharacter(element); //result from API
      heroesList.add(_result); // Adding characters on list
      notifyListeners(); // Notify consumer
    });
  }
}
