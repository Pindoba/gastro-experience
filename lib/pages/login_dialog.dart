import 'package:flutter/material.dart';
import 'package:gastro_experience/pages/register_page.dart';
import 'package:gastro_experience/store/auth_store.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/button.dart';
import 'package:gastro_experience/widgets/text.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class LoginDialogController extends ChangeNotifier {
  final AuthStore authStore;
  String username = "";
  String password = "";

  bool hasError = false;
  bool hasToClose = false;

  LoginDialogController({required this.authStore});

  Future<void> login() async {
    hasError = false;
    notifyListeners();

    if (await authStore.login(username, password)) {
      hasToClose = true;
    } else {
      print("ERRO");
      hasError = true;
    }

    notifyListeners();
  }

  setUsername(String? newUsername) {
    username = newUsername ?? "";
    hasError = false;

    notifyListeners();
  }

  setPassword(String? newPassword) {
    password = newPassword ?? "";
    hasError = false;

    notifyListeners();
  }
}

class LoginDialog extends StatefulWidget {
  final LoginDialogController controller;

  const LoginDialog(
    this.controller, {
    super.key,
  });

  static show(BuildContext context) {
    AuthStore authStore = Provider.of<AuthStore>(context, listen: false);
    LoginDialogController controller =
        LoginDialogController(authStore: authStore);

    Widget registrerButton = DefaultButton.secondary(
      'Registre-se',
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
    );
    Widget loginButton = DefaultButton.primary("Entrar", controller.login);

    AlertDialog alert = AlertDialog(
      title: const TextWidget(text: "Login"),
      content: LoginDialog(controller),
      actions: [registrerButton, loginButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    LoginDialogController controller = widget.controller;

    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          if (controller.hasToClose) Navigator.of(context).pop();

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget(text: 'E-mail'),
              SizedBox(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    onChanged: controller.setUsername,
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      fillColor: Color(0xffDFE4EA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDFE4EA),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDFE4EA),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDFE4EA),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 24),
              const TextWidget(text: 'Senha'),
              SizedBox(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    obscureText: !_passwordVisible,
                    onChanged: controller.setPassword,
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: DefaultColors.card,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      fillColor: const Color(0xffDFE4EA),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xffDFE4EA),
                          )),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDFE4EA),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDFE4EA),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 12),
              DefaultText.normal(
                controller.hasError ? "Ocorreu um erro" : "",
                isInverted: true,
              )
            ],
          );
        });
  }
}
