import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_tutorial/features/auth/services/auth_serivces.dart';
import 'package:amazon_clone_tutorial/provider/user_provider.dart';
import 'package:amazon_clone_tutorial/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: AppBarTheme(
              elevation: 0.0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AuthScreen(),
    );
  }
}
