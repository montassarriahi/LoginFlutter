// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logincubit/cubit/validlogin_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logincubit/ui/validationCode.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(7, 48, 100, 1),
      ),
      body: Form(
        key: context.read<ValidloginCubit>().formKey,
        child: BlocConsumer<ValidloginCubit, ValidloginState>(
          listener: (context, state) {
            if (state is Validlogins) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => validationCode()));

              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text(
              //         'Your email is ${state.Email} and you password is ${state.Password}'),
              //     backgroundColor: Colors.green,
              //   ),
              // );
            } else {
              return null;
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content: Text("please fill the input"),
              //   backgroundColor: Colors.red,
              // ),
              // );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Login To Your Account",
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(7, 48, 100, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Great to see you, enter your details below to continue ",
                          style: GoogleFonts.poppins(
                            color: Color.fromRGBO(7, 48, 100, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50),
                    // Email Input Field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Email";
                        } else if (isValidEmail(value)) {
                          return null;
                        } else {
                          return "please enter a valid email adress";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      // this is controler
                      controller: EmailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Password Input Field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
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
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 100)),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(7, 48, 100, 1),
                        ),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                      ),
                      onPressed: () {
                        String email = EmailController.text;
                        String password = PasswordController.text;
                        context
                            .read<ValidloginCubit>()
                            .Information(email, password);

                        // if (state is Validlogins) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => validationCode()));
                        // }

                        // context.read<ValidloginCubit>().formKey.currentState!.validate();
                        // context.read<ValidloginCubit>().Information(
                        //     EmailController.text, PasswordController.text);
                      },
                      child: Text(
                        'Login',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
