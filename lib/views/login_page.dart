import 'package:dog_flutter_application/components/form_text_field_component.dart';
import 'package:dog_flutter_application/components/main_button_component.dart';
import 'package:dog_flutter_application/controllers/access_controller.dart';
import 'package:dog_flutter_application/views/dog_page.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if(_formKey.currentState!.validate()) {
      bool login = await AccessController.instance.login(_usernameController.text, _passwordController.text);

      if(login) {
        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DogPage(),
          )
        );
      } else {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Usuário ou senha inválidos'),
            backgroundColor: Colors.red,
          )
        );
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 228, 247),
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(36.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "RANDOM DOG",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _gap(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Digite seu nome de usuário e senha!",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _gap(),
                    FormTextField(
                      textController: _usernameController,
                      inputValidator: (username) {
                        if (username == null || username.isEmpty) {
                          return 'Preencha o campo usuário';
                        }
                        return null;
                      },
                      iconInput: const Icon(Icons.email_outlined),
                      labelText: 'Nome de usuário',
                      hintText: 'Digite seu nome de usuário',
                    ),
                    _gap(),
                    FormTextField(
                      textController: _passwordController,
                      inputValidator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Preencha o campo senha';
                        }
                        return null;
                      },
                      iconInput: const Icon(Icons.lock_outline_rounded),
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                      obscureText: true,
                    ),
                    _gap(),
                    SizedBox(
                      width: double.infinity,
                      child: mainButton(
                      buttonText: 'Entrar',
                      buttonFunction: () async {
                        await _login();
                      }
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
