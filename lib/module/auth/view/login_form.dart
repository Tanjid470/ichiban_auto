import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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
  String role = '';
  bool login = false;
  List<String> roleItem = ['Admin','Mechanic'];
  String? assignedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResponsiveScale.of(context).verticalGap(context, 3),
              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(image: DecorationImage(
                    image: AssetImage("assets/images/car_admin.png"),
                fit: BoxFit.contain)),
              ),
              ResponsiveScale.of(context).verticalGap(context, 3),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      login
                          ? const SizedBox()
                          : Column(
                            children: [
                              TextFormField(
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
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Your\'s role',
                                  labelStyle: TextStyle(color: Colors.grey),
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
                                items: roleItem.map((String mechanic) {
                                  return DropdownMenuItem<String>(
                                    value: mechanic,
                                    child: Text(mechanic),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    assignedRole = value;
                                  });
                                },
                              ),
                              ResponsiveScale.of(context).verticalGap(context, 1),
                            ],
                          ),


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
                                InkWell(
                                  onTap: () {
                                    SmartDialog.showToast("Upcoming feature....");
                                  },
                                  child: Text(
                                    "Forget password?",
                                    style: customSizeWithoutLetterSpacing(15, Colors.black87),
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
                            style: customSizeWithoutLetterSpacing(16, Colors.black87),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                login = !login;
                              });
                            },
                            child: Text(
                              login ? " Signup" : " Login",
                              style: customSizeWithoutLetterSpacing(16, Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
