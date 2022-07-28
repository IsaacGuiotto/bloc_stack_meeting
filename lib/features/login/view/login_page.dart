import 'package:bloc_stack_meeting/features/login/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                  child: Text("Welcome to Bloc",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
              const SizedBox(height: 40),
              TextFormField(
                controller: _emailTextController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  hintText: "email: user@bloc.com",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
                onChanged: (value) => BlocProvider.of<LoginCubit>(context)
                    .onEmailChanged(_emailTextController.text),
                validator: (value) => null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passTextController,
                cursorColor: Colors.green,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "pass: bloc123",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
                onChanged: (value) => BlocProvider.of<LoginCubit>(context)
                    .onPassChanged(_passTextController.text),
                validator: (value) => null,
              ),
              const SizedBox(height: 24),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.success) {
                    Navigator.pushNamed(context, "/home");
                  }
                },
                buildWhen: (oldS, newS) => oldS.isLoading != newS.isLoading,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginCubit>(context).onLogin();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : const Text("Sign In"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
