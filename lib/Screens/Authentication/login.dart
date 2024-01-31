// Screens/Authentication/login.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Authentication/register.dart';
import 'package:provider/provider.dart';
import '../../Provider/loginProvider.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textField.dart';
import '../Products/productsList.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Login ')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    title: 'Email',
                    controller: _email,
                    hint: 'Enter your valid email address',
                  ),
                  customTextField(
                    title: 'Password',
                    controller: _password,
                    hint: 'Enter your secured password',
                  ),
                  customButton(
                    text: 'Login',
                    tap: () async {
                      if (_email.text != '' || _password.text != '') {
                        try {
                          await loginProvider.login(
                            _email.text,
                            _password.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Login Successfully"),
                            ),
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductsList()));
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(error.toString()),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('All fields are required'),
                          ),
                        );
                      }
                    },
                    status: false,
                    context: context,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text('Register instead'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
