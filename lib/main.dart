import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/ui/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  await GlobalConfiguration().loadFromAsset("app_settings");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change statusBarColor
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PaymentMethodsModel(),
          ),
        ],
        child: MaterialApp(
          title: 'Ejara',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Metropolis",
            primarySwatch: Colors.blue,
          ),
          home: const PaymentMethodScreen(),
        ));
  }
}
