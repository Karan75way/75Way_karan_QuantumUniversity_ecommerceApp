import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/cartProvider.dart';
import 'package:flutter_application_1/Provider/loginProvider.dart';
import 'package:provider/provider.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'Provider/orderHistoryProvider.dart';
import 'Provider/productProvider.dart';
import 'Provider/registrationProvider.dart';
import 'Services/apiService.dart';
import 'Styles/colors.dart';
import 'splash.dart';

void main() {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
  dio.httpClientAdapter = DioAdapter(dio: dio);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(
            create: (context) => LoginProvider(
                  Provider.of<RegistrationProvider>(context, listen: false),
                )),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderHistoryProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: primaryColor,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: primaryColor),
        primaryColor: primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
