import 'package:gastro_experience/api/api.dart';
import 'package:gastro_experience/dto/auth_dto.dart';

class AuthRepository {
  Future<AuthDTO> login(String username, String password) async {
    Map<String, String> payload = {
      "email": username,
      "password": password
    };

    try {
      var response = await api.post("/login", data: payload);

      return AuthDTO.fromMap(response.data);
    } catch (e) {
      print(e);
    }

    return AuthDTO(token: "");
  }
}