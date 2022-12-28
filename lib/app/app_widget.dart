import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FutPerformance',
      darkTheme: ThemeData(
          //useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Colors.orange,
            onSecondary: Colors.white,
            primaryContainer: Colors.orange,
            error: Colors.black,
            onError: Colors.white,
            background: Colors.blue,
            onBackground: Colors.white,
            surface: Colors.pink,
            onSurface: Colors.white,
          ),
        ),

      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.orange, brightness: Brightness.dark, ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension 
  }
}