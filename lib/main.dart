import 'package:flutter/material.dart';
import 'package:gastro_experience/pages/home_page.dart';
import 'package:gastro_experience/store/restaurants_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RestaurantStore()),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});
  final fff = 'ddd';

  @override
  Widget build(BuildContext context) {
    final RestaurantStore restaurant = Provider.of<RestaurantStore>(context);
    restaurant.getrestaurant().length == 0 ? restaurant.restaurant(): null;
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
