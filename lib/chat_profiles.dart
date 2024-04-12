import 'package:axisforu/constant.dart';
import 'package:axisforu/profile_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat_profile_page extends StatefulWidget {
  const Chat_profile_page({super.key});

  @override
  State<Chat_profile_page> createState() => _Chat_profile_pageState();
}

class _Chat_profile_pageState extends State<Chat_profile_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text("AxisForU",style: TextStyle(color: Color(0xff2A4A32),fontSize: 20,fontWeight: FontWeight.bold),),
              Container(
                height: 800,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(Profile_chat_page());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                  ClipOval(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orange[600],
                                    radius: 20,
                                    child: Image.asset(
                                      "images/r4.png",
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover, // Adjust the fit property as needed
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Akshith',
                                      style: username,
                                    ),
                                     SizedBox(height: 5,),
                                    Text(
                                      'Hey akshith',
                                      style: message
                                    ),
                                  ],
                                ),
                              ],
                            ),
                             const Text(
                              '4:50pm',
                              style: lastseen
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}