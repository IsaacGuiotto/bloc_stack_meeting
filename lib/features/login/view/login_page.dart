import 'package:flutter/material.dart';

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
                  hintText: "Email",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
                validator: (value) => null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passTextController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  hintText: "Password",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
                validator: (value) => null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
