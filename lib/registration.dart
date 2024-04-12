import 'package:axisforu/constant.dart';
import 'package:axisforu/login.dart';
import 'package:axisforu/service/database.dart';
import 'package:axisforu/service/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration_page extends StatefulWidget {
  const Registration_page({super.key});

  @override
  State<Registration_page> createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  String email = '',
  password = '',
  name = '',
  conformpassword = '',
  phonenumber ='';
  
TextEditingController namecontoller =  new TextEditingController();
TextEditingController emailcontroller = new TextEditingController();
TextEditingController passwordcontller = new TextEditingController();
TextEditingController conformpasswordcontroller  = new TextEditingController();
TextEditingController phonenumbercontoller  = new TextEditingController();

registration() async{
if(password!=null && password ==conformpassword){
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  String Id = randomAlphaNumeric(10);
  

  // stroing the information 
  Map<String , dynamic> userInfoMap = {
    "name" : namecontoller.text,
    "e-mail": emailcontroller.text,
    "phone": phonenumbercontoller.text,
    "username": emailcontroller.text.replaceAll("@gmail.com", ""),
    "id": Id,
  };
  //Database.dart page and this function store the user information into the firestore 
  await Databsemethods().adduserDetails(userInfoMap,Id);
  //shared preference functi calling 
  await SharedpreferenceHelper().saveUserId(Id);
  await SharedpreferenceHelper().saveUserName(emailcontroller.text.replaceAll("@gmail.com", ""),);
  await SharedpreferenceHelper().saveUserEmail(emailcontroller.text);
  await SharedpreferenceHelper().saveUserDisplayName(namecontoller.text);
  await SharedpreferenceHelper().saveUserPhoneNumber(phonenumbercontoller.text);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    backgroundColor: Colors.red,
    content: Text('Registor successfully',style: TextStyle(fontSize: 20),)));
    Get.to(LoginPage());
}on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.orange,
    content: Text('The password provided is too weak.',style: TextStyle(fontSize: 18.0),)));
}else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.orange,
    content: Text('The account already exists for that email.',style: TextStyle(fontSize: 18.0),)));
  }
}}}
final _formkey = GlobalKey<FormState>();
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xff2A4A32),
      appBar: AppBar(
        backgroundColor:const Color(0xff2A4A32) ,
       centerTitle: true,
       title:  const Text("ChatApp",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 28,fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Form(
              key: _formkey,
              child: Container(
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                children: [
                   const SizedBox(height: 40,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 30),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                   const SizedBox(height: 12,),
                        TextFormField(
                            controller: namecontoller,
                            validator: (Value){
                          if(Value==null || Value.isEmpty){
                            return 'Please enter name';
                          }
                          return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Your name*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: 'Your name*',
                            ),
                          ),
                       const SizedBox(height: 25,),
                     TextFormField(
                        controller: emailcontroller,
                        validator: (Value){
                      if(Value==null || Value.isEmpty){
                        return 'Please enter email';
                      }
                      return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter email address*',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Enter email address*',
                        ),
                      ),
                       const SizedBox(height: 25,),
                     TextFormField(
                            controller: phonenumbercontoller,
                            validator: (Value){
                          if(Value==null || Value.isEmpty){
                            return 'Please enter number';
                          }
                          return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Your contact number*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: 'Your contact number*',
                            ),
                          ),

                       const SizedBox(height: 25,),
                     TextFormField(
                          controller: passwordcontller,
                          validator: (Value){
                        if(Value==null || Value.isEmpty){
                          return 'Please enter password';
                        }
                        return null;
                          },
                          obscureText: true, // Setting obscureText to true to hide the password
                          decoration: InputDecoration(
                            labelText: 'New password*',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'New password*',
                          ),
                        ),
                       const SizedBox(height: 25,),
                      TextFormField(
                        controller: conformpasswordcontroller,
                            obscureText: true, // Setting obscureText to true to hide the password
                            decoration: InputDecoration(
                              labelText: 'Confirm New password*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: 'Confirm New password*',
                            ),
                          ),
                           Row(
                        children: <Widget>[
                          Checkbox( 
                                  //only check box
                                  value: check1, //unchecked
                                  onChanged: (bool? value){
                                      //value returned when checkbox is clicked
                                      setState(() {
                                          check1 = value;
                                      });
                                  }
                                ),
                              const  Text('I agree to the',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                              const  Text('Terms&Condition',style: TextStyle(color:  Color.fromARGB(255, 2, 90, 241),fontSize: 14,fontWeight: FontWeight.bold),)
              
                        ],
                      ),
                     const SizedBox(height: 10,),
                       Container(
                      alignment: Alignment.center,
                      width:double.infinity,
                      height: 46,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color:  const Color(0xff2A4A32)
                      // color:  const Color(0xffF6c8656)
                      ),
                      child: InkWell(
                        onTap: () {
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email= emailcontroller.text;
                            name = namecontoller.text;
                            password = passwordcontller.text;
                            phonenumber = phonenumbercontoller.text;
                            conformpassword = conformpasswordcontroller.text;

                            });
                            registration();
                          }
                        },
                        child: const Text('Register',style: buttonsizes,
                         ),
                      ),
                      ),
                     const SizedBox(height: 25,),
                      ],
                     ),
                   ),
                ],
              ),
              ),
            )
          ),
        ),
      ),
          );
  }
}