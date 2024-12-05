import 'package:flutter/material.dart';
import 'package:gastro_experience/assets.dart';
import 'package:gastro_experience/pages/home_page.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/button.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: DefaultColors.mainBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: DefaultColors.mainBg,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) =>
                                    HomePage(store: context.read()))),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(Assets.logo),
                        ),
                      ),
                    ),
                    widthDevice >= 590
                        ? TextWidget(
                            text: 'Comer Bem!',
                            sizeText: 20,
                            color: DefaultColors.primary,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const TextWidget(
                  text: 'Cadastre-se',
                  sizeText: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(text: 'Nome'),
                    SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            fillColor: Color(0xffDFE4EA),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                          ),
                        )),
                    const SizedBox(height: 24),
                    const TextWidget(text: 'E-mail'),
                    SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            fillColor: Color(0xffDFE4EA),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                          ),
                        )),
                    const SizedBox(height: 24),
                    const TextWidget(text: 'Confirmar e-mail'),
                    SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            fillColor: Color(0xffDFE4EA),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                          ),
                        )),
                    const SizedBox(height: 24),
                    const TextWidget(text: 'Senha'),
                    SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            fillColor: Color(0xffDFE4EA),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                          ),
                        )),
                    const SizedBox(height: 24),
                    const TextWidget(text: 'Confirmar senha'),
                    SizedBox(
                        height: 50,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            fillColor: Color(0xffDFE4EA),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Color(0xffDFE4EA))),
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    DefaultButton.primary('Cadastre-se', () => {})
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
