import "package:flutter/material.dart";
import "package:unit_converter/route/home.dart";

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() {
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Themes.
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.red,
        fontFamily: "MainFont",
        useMaterial3: true
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.red,
        fontFamily: "MainFont",
        useMaterial3: true
      ),
      themeMode: ThemeMode.light,

      // Properties.
      title: "Unit Converter",

      home: Home()
    );
  }
}
