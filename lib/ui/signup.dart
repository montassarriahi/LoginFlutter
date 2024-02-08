import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logincubit/cubit/validlogin_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool passtogglep = true;
  bool passtoggle = true;
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign up',
          ),
          backgroundColor: Color.fromRGBO(7, 48, 100, 1),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Form(
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  SizedBox(height: 50),
                  Text(
                    "Create Your Account !",
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
                      SizedBox(
                        height: 16,
                      ),
                      // password

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
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passtogglep = !passtogglep;
                                  });
                                },
                                child: Icon(passtogglep
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                        obscureText: passtogglep,
                      ),

                      SizedBox(height: 16),

                      // confirm pass
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Your Password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        controller: ConfirmPasswordController,
                        decoration: InputDecoration(
                            labelText: 'Confirm password',
                            border: OutlineInputBorder(),
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passtoggle = !passtoggle;
                                  });
                                },
                                child: Icon(passtoggle
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                        obscureText: passtoggle,
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      // button
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 100)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(7, 48, 100, 1),
                          ),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        onPressed: () {
                          // String email = EmailController.text;
                          // String password = PasswordController.text;
                          // context
                          //     .read<ValidloginCubit>()
                          //     .Information(email, password);

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
                          'Sign up',
                        ),
                      ),
                    ],
                  ),
                ])),
          ),
        )));
  }
}
