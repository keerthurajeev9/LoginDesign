import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Registration1.dart';
class Login1 extends StatefulWidget {
  static const id = "login1";

  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  String email;
  String pass;
  final clearController = TextEditingController();
  final clearpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                ),
                Container(
                  height: 70.0,
                  width: 40.0,
                  child: Placeholder(
                    color: Colors.black,
                  ),
                ),
                SizedBox( height: 20.0,),
                TextField(
                  controller: clearController,
                  onChanged: (value){
                    email = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      size: 20.0,
                      color: Colors.black,
                    ),
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width:3,color: Colors.white)
                    ),
                  ) ,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.grey,

                ),
                SizedBox( height: 20.0,),
                TextField(
                  controller: clearpassController,
                  onChanged: (value){
                    pass = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_open,
                      size: 20.0,
                      color: Colors.black,
                    ),
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width:3,color: Colors.white)
                    ),
                  ) ,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.grey,
                ),
               SizedBox(
                 height: 20.0,
               ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Forgot Password?');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                FlatButton(
                  onPressed: (){
                    clearController.clear();
                    clearpassController.clear();
                  },
                  color: Colors.pink[50],
                  child: Text('Log In',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                ),
                SizedBox(height:20.0),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Dont have an account? ',
                      style: TextStyle(color: Colors.black, fontSize: 18.0
                      ),
                      children: <TextSpan>  [
                        TextSpan(
                          recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Registration1.id),
                          text: 'Register.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],

                  ),
                ),
                ),


              ],
            ),
          ),
      ],

        ),
      ),

    ),
    );
  }
}
