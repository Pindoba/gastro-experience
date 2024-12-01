import 'package:flutter/material.dart';
import 'package:gastro_experience/pages/register_page.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/button.dart';
import 'package:gastro_experience/widgets/text_widget.dart';


class LoginDialog extends StatefulWidget {
  const LoginDialog({
    super.key,
  });

    static show(BuildContext context){
    Widget registrerButton = DefaultButton.secondary(
      'Registre-se', 
      (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const RegisterPage())
        );
      }
    );
    Widget loginButton = DefaultButton.primary("Entrar", ()=>{});

    AlertDialog alert = AlertDialog(
      title: const TextWidget(text: "Cadastre-se"),
      content: LoginDialog(),
      actions: [
        registrerButton,
        loginButton
      ],
    );

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alert;
      }
    );
  }

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextWidget(text: 'E-mail'),
        SizedBox(
          height: 50,
          width: 500,
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              contentPadding:EdgeInsets.symmetric(horizontal: 8),
              fillColor: Color(0xffDFE4EA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xffDFE4EA))
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xffDFE4EA))
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xffDFE4EA))
              ),
            ),
          )
        ),
        const SizedBox(height: 24),
        const TextWidget(text: 'Senha'),
        SizedBox(
          height: 50,
          width: 500,
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              filled: true,
              suffixIcon: IconButton(
                onPressed: (){
                  setState((){
                    _passwordVisible = !_passwordVisible;
                  });
                }, 
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: DefaultColors.card,
                )
              ),
              contentPadding:const EdgeInsets.symmetric(horizontal: 8),
              fillColor: const Color(0xffDFE4EA),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xffDFE4EA))
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xffDFE4EA))
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xffDFE4EA))
              ),
            ),
          )
        ),
      ],
    );
  }
}