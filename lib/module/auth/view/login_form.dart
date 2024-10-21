import 'package:flutter/material.dart';
import 'package:ichiban_auto/config/responsive_scale.dart';
import 'package:ichiban_auto/const/app_text_style.dart';
import 'package:ichiban_auto/module/auth/service/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullName = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.blueAccent),
        ),
        elevation: 0,
        title: const Center(
            child: Text('Authentication',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30))),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              login
                  ? Container()
                  : TextFormField(
                      key: const ValueKey('fullName'),
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Border when not focused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue), // Border when focused
                        ),
                        hintTextDirection: TextDirection.ltr,
                        hintStyle: TextStyle(color: Colors.grey)

                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your name';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          fullName = value!;
                        });
                      },
                    ),

              ResponsiveScale.of(context).verticalGap(context, 1),
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Border when focused
                    ),
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(color: Colors.grey)
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please Enter valid email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              ResponsiveScale.of(context).verticalGap(context, 1),
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter password',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Border when focused
                    ),
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(color: Colors.grey)
                ),
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please, Enter password of min length 6';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),

              !login
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 238, 238),
                                  title: const Text(''),
                                  content: Text(
                                    'This feature not added yet.',
                                    style: customSize(18, Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        // Perform an action when the user taps the button
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Close'),
                                    ),
                                    // Add more buttons or actions as needed
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Forget password?",
                            style: customSize(15, Colors.black87),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(1, 2)
                      )
                    ]
                ),
                child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login
                            ? AuthServices.signinUser(email, password, context)
                            : AuthServices.signupUser(email, password, fullName, context);
                      }
                    },
                    child: Text(
                      login ? 'Login' : 'Signup',
                      style: customSize(20, Colors.white),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    login
                        ? "Don't have an account? "
                        : "Already have an account?",
                    style: customSize(16, Colors.black87),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        login = !login;
                      });
                    },
                    child: Text(
                      login ? " Signup" : " Login",
                      style: customSize(16, Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
