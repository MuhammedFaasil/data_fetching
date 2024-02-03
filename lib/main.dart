import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/services/shared.dart';
import 'package:user_app/view/home_page.dart';
import 'package:user_app/view/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Login.getLogged(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return LoginPage();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return HomePage();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
