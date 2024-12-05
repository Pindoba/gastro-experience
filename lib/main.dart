import 'package:flutter/material.dart';
import 'package:gastro_experience/pages/home_page.dart';
import 'package:gastro_experience/store/auth_store.dart';
import 'package:gastro_experience/store/restaurants_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RestaurantStore()),
      ChangeNotifierProvider(create: (_) => AuthStore())
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Degusta!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
