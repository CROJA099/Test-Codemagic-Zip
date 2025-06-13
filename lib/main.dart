import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_codemagic_zip/environment.dart';
import 'firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatefulWidget {  

  const MyApp({super.key,});

  @override
  State<MyApp> createState() => _MyAppState();

 
}

class _MyAppState extends State<MyApp> {

  String version = "";
  String buildNumber = "";

  Future<void> _mostrarVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  setState((){
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  });
  
}

  

  @override
  void initState() {
    super.initState();
    _mostrarVersion();    
  }

  @override
  Widget build(BuildContext context) {
    String image = Environment.appIcon;
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              Image(image: AssetImage(image)),
              Text('Versión: $version, Build: $buildNumber'),
            ],
          ),
        ),
      ),
    );
  }
}

