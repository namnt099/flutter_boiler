import 'package:base/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injection.dart';
import '../../../../utils/utils.dart';
import '../auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.login),
      ),
      body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: const _LoginForm(),
      ),
    );
  }
}



class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
            Login(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: const Key('email_field'),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: Validator.validateEmail,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('password_field'),
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: Validator.validatePassword,
            ),
            const SizedBox(height: 24),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (state.errorMessage != null) {
                  return Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              key: const Key('login_button'),
              onPressed: _onSubmit,
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
