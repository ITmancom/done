import 'package:flutter/material.dart';
import 'package:loggin_page/screen/create_page.dart';
import 'package:loggin_page/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 218, 218),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 234, 248, 231),
            Color.fromARGB(255, 255, 255, 255)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                enableSuggestions: false,
                controller: _emailTextController ,
                autocorrect: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'Enter your Email',
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: const Color.fromARGB(200, 233, 226, 233),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

             const SizedBox(height: 20),

                             Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: () {
                      // onTap();
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          .then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  LoginPage(),
                            ),
                          );
                        },
                      ).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.blue;
                          }
                          return const Color.fromARGB(255, 160, 159, 152);
                        }),
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    child: const Text(
                      "Get New Password",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Perform sign-in logic here
              //   },
              //   child: const Text('Reset Password' ,
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,

              //   ),),
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Sign  ',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigate to Forgot Password page
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const ForgotPage()),
                  //     );
                  //   },
                  //   child: const Text(
                  //     'Forgot password?',
                  //     style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  //   ),
                  // ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
