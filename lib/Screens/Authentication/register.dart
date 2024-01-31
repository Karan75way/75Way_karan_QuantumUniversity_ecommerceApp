// Screens/Authentication/register.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/registrationProvider.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textField.dart';
import '../Products/productsList.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    _name.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Register ')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    title: 'First Name',
                    controller: _name,
                    hint: 'Enter your first name',
                  ),
                  customTextField(
                    title: 'Email',
                    controller: _email,
                    hint: 'Enter you valid email address',
                  ),
                  customTextField(
                    title: 'Password',
                    controller: _password,
                    hint: 'Enter your secured password',
                  ),
                  customButton(
                    text: 'Register',
                    tap: () async {
                      if (_name.text != '' ||
                          _email.text != '' ||
                          _password.text != '') {
                        try {
                          await registrationProvider.registerUser(
                              _name.text, _email.text, _password.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('User Registered Successfully'),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Registration failed'),
                            ),
                          );
                          print("Error while User Registration $e");
                        }

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
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
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text('Login instead'),
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
