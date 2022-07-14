import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/auth/bloc/auth_bloc.dart';
import 'package:vaultapp/core/di/locator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthBloc authBloc = locator<AuthBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      authBloc.add(
          SignInRequested(_usernameController.text, _passwordController.text));
    } else {
      setState(() {
        _autovalidate = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, homeScreen);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login screen"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Bonjour"),
              SizedBox(height: 7.h),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Username',
                    suffixIcon: Icon(Icons.email_outlined)),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock_outline)),
                controller: _passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                  onPressed: _onSubmit, child: const Text('Valider')),
            ],
          ),
        ),
      ),
    );
  }
}