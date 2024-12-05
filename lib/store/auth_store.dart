import 'package:flutter/material.dart';
import 'package:gastro_experience/dto/auth_dto.dart';
import 'package:gastro_experience/repository/auth_repository.dart';

class AuthStore extends ChangeNotifier {
  String token = "";
  bool get isLogged => token.isNotEmpty;

  final AuthRepository _repository = AuthRepository();

  Future<bool> login(String username, String password) async {
    AuthDTO dto = await _repository.login(username, password);

    token = dto.token;

    if (isLogged){
      notifyListeners();
    }

    return isLogged;
  }

  void logout() {
    token = "";
  }
}