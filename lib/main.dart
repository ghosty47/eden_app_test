import 'package:eden_app_test/controllers/ably_controller.dart';
import 'package:eden_app_test/firebase_options.dart';
import 'package:eden_app_test/routes.dart';
import 'package:eden_app_test/services/navigation_service.dart';
import 'package:eden_app_test/utils/constants.dart';
import 'package:eden_app_test/views/onboarding/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (env == Env.kProd) {
    await dotenv.load(fileName: ".env.prod");
  } else {
    await dotenv.load(fileName: ".env");
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AblyTracker>(create: (_) => AblyTracker()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EdenLife',
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreenView.routeName,
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: const [],
      supportedLocales: const <Locale>[
        Locale('en', '')
      ],
    );
  }
}
