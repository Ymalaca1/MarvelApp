import 'dart:convert';
import 'package:common/common.dart';
import 'package:academy_quiz/academy_quiz.dart';

class DioMethod {
  //gustavo's public key
  final String _guPuKey = 'b80c324226e18079345025f1f47ff581';
  //gustavo's private key
  final String _guPriKey = '1675c45d5ccdb7ae6ccfd305e00d2f8bbdea63dc';
  //dezembro's public key
  final String _dePubKey = '5cf3b2cb25f6ce3a9ec57bc935e2656a';
  //dezembro's private key
  final String _dePriKey = '5980ec0ede11f00399fee7bf4cf4a0edaa5c2e4f';
  //getting a timestamp that changes
  late String _timestamp;
  late String _hash;

  //creating a hash from timestamp + privateKey + publicKey converted into utf8
  Future<void> _createHash() async {
    _timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    _hash =
        md5.convert(utf8.encode(_timestamp + _guPriKey + _guPuKey)).toString();
  }

  //loading character from API from it's id
  Future<Heroes> loadCharacter(int id) async {
    _createHash();
    final BaseOptions _options =
        BaseOptions(baseUrl: "http://gateway.marvel.com");

    final Dio _dio = Dio(_options);

    //getting characters from API
    final _response = await _dio.get(
        '/v1/public/characters?apikey=$_guPuKey&ts=$_timestamp&hash=$_hash&id=$id');

    //putting the response.data(json) into a variable
    final _map = _response.data;

    late Heroes _result;

    //creating an instance of Heroes for each API character
    _map["data"]["results"].forEach((element) {
      _result = Heroes.fromMap(element);
    });

    return _result;
  }
}
