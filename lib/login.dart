import 'package:axisforu/chat_profiles.dart';
import 'package:axisforu/constant.dart';
import 'package:axisforu/forgotpassword.dart';
import 'package:axisforu/registration.dart';
import 'package:axisforu/service/database.dart';
import 'package:axisforu/service/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '',
  password = '',
  name = '',
  username = '',
  id = '';

  TextEditingController  useremailcontoller= TextEditingController();
  TextEditingController  userpasswordcontoller= TextEditingController();
  userLogin() async{ 
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  
  QuerySnapshot querySnapshot = await Databsemethods().getUserByEmail(email);
  name = "${querySnapshot.docs[0]["name"]}";
  email = "${querySnapshot.docs[0]["e-mail"]}";
  username ="${querySnapshot.docs[0]["username"]}";
  id = querySnapshot.docs[0].id;
  await SharedpreferenceHelper().saveUserName(name);
  await SharedpreferenceHelper().saveUserDisplayName(username);
  await SharedpreferenceHelper().saveUserId(id);
  await SharedpreferenceHelper().saveUserEmail(email);
    Get.to(const Chat_profile_page());

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
   ScaffoldMessenger.of(context).showSnackBar(
   const SnackBar(
    backgroundColor: Colors.orange,
    content: Text('No user found for that email.',style: TextStyle(fontSize: 18.0),)));
  } else if (e.code == 'wrong-password') {
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
    backgroundColor: Colors.orange,
    content: Text('Wrong password provided for that user.',style: TextStyle(fontSize: 18.0),)));
  }
}
  }
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2A4A32),
      appBar: AppBar(
        backgroundColor: const Color(0xff2A4A32),
        centerTitle: true,
        title: const Text(
          "ChatApp",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: _formkey,
                child: Container(
                  height: 380,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: useremailcontoller,
                              validator: (Value){
                                if(Value==null || Value.isEmpty){
                                  return 'Please enter email';
                                }
                                return null;
                                  }, // assuming you have a TextEditingController named emailController
                              decoration: InputDecoration(
                                labelText: 'Your Email*',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: 'Your Email*',
                              ),
                            ),
                           const SizedBox(
                              height: 25,
                            ),
                                TextFormField(
                              controller: userpasswordcontoller, // Assuming you have a TextEditingController named passwordController
                              validator: ( Value){
                                if(Value==null || Value.isEmpty){
                                  return 'Please enter password';
                                }
                                return null;
                                  },
                              obscureText: true, // Hides the entered text for password input
                              decoration: InputDecoration(
                                labelText: 'Enter Password*',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: 'Enter Password*',
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const ForgotPasswordPage());
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    child: const Text('Forgot Password?',
                                        style: TextStyle(
                                          color: Color(0xff0f3cc9),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ))),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff2A4A32)
                                  // color:  const Color(0xffF6c8656)
                                  ),
                              child: InkWell(
                                onTap: () {
                                  if(_formkey.currentState!.validate()){
                            setState(() {
                              email= useremailcontoller.text;
                            password = userpasswordcontoller.text;
                            });
                            userLogin();
                          }
                                },
                                child: const Text(
                                  'Login',
                                  style: buttonsizes,
                                ),
                              ),
                            ),
                           const  SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("If haven't account?",
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(const  Registration_page());
                                  },
                                  child: const Text("Register here",
                                      style: TextStyle(
                                        color: Color(0xff0f3cc9),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
