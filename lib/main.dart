import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/ui/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PaymentMethodsModel(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "Metropolis",
            primarySwatch: Colors.blue,
          ),
          home: const PaymentMethodScreen(),
        ));
  }
}
