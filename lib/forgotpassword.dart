import 'package:axisforu/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String email = '';
  resetpassword()async{
   
      try {
             await FirebaseAuth.instance
    .sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('password rest Email has  been sent',style: TextStyle(fontSize: 20),)));
          } on FirebaseAuthException catch (e) {
             if(e.code=="user-not-found"){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('No user found  for that email.',style: TextStyle(fontSize: 20),)));
             }
          }
      
  }
  TextEditingController mailcontroller = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container( 
                  height: 400,
                  width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50,),
                                  Text('Reset',style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Text('Password?',style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text('Enter the mail address\nassociated with your account.',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                                  SizedBox(height: 30,),
                                  TextFormField(
                                    controller: mailcontroller,
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
                                  SizedBox(height: 30,),
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
                                  email= mailcontroller.text;
                                });
                                resetpassword();
                              }
                                    },
                                    child: const Text(
                                      'Send',
                                      style: buttonsizes,
                                    ),
                                  ),
                                ),
                                ],
                              ),
                            ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}