import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:introduction_flutter/firebase_options.dart';
import 'package:introduction_flutter/router/router.dart';

late FirebaseApp firebaseApp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  firebaseApp = await Firebase.initializeApp(
    name: "IntroductionFlutter",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Introduction Flutter',
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
