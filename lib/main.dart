import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Column(
            children: [
              Image(image: AssetImage(String.fromEnvironment("APP_ICON", defaultValue: ""))),
              Text('Hello World'),
            ],
          ),
        ),
      ),
    );
  }
}