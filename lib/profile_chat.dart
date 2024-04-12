import 'package:flutter/material.dart';

class Profile_chat_page extends StatefulWidget {
  const Profile_chat_page({super.key});

  @override
  State<Profile_chat_page> createState() => _Profile_chat_pageState();
}

class _Profile_chat_pageState extends State<Profile_chat_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
            Container(padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width/2),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: const Color.fromARGB(31, 139, 138, 138),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Text(' hi this is akshith'),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right:  MediaQuery.of(context).size.width/2),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: const Color.fromARGB(31, 139, 138, 138),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Text(' hi how are you'),
            ),
            Spacer(),
            Container(
              child: 
              Row(
                children: [
                  Expanded(
                    child: TextField(  
                      // obscureText: true,  
                      decoration: InputDecoration(  
                        border: InputBorder.none,  
                        // labelText: 'Password',  
                        hintText: 'Enter message',  
                      ),  
                    ),
                  ),
                  Icon(Icons.send,color: const Color.fromARGB(255, 203, 154, 154),)
                ],
              ),
            )
        ],
      ),
    );
  }
}