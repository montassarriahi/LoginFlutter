// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class validationCode extends StatefulWidget {
  const validationCode({super.key});

  @override
  State<validationCode> createState() => _validationCodeState();
}

class _validationCodeState extends State<validationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          child: Center(
              child: Column(
                children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Verif Code',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(7, 48, 100, 1),
            ),
          ),
          Text(
            'Entrez votre code de verificaion',
            style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(7, 48, 100, 1),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  cursorColor: Colors.red,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  cursorColor: Colors.red,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  cursorColor: Colors.red,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  cursorColor: Colors.red,
                  onChanged: (value) {
                    if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
              ),
            ],
          )
                ],
              )),
        ));
  }
}
