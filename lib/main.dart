import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping app',
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromRGBO(245, 255, 1, 1),
                  primary: const Color.fromARGB(255, 220, 228, 1)),
              textTheme: const TextTheme(
                  titleLarge:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  titleMedium:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  bodyMedium:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
              useMaterial3: true), //try removing this and see changes
          home: const Home_page()),
    );
  }
}
