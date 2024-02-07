// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print


import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
       appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[300],
      ),
      body: Center(
        child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 50),
                  // Email Input Field
                  TextField(
                    // this is controler
                    controller: EmailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Password Input Field
                  TextField(
                    controller: PasswordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),

                  SizedBox(height: 24),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                    context.read<ValidloginCubit>().validateLoginInformation(Email, password);
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
        
         ),
    );
     
    
}
 

  }

