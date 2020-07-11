import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'Registration2.dart';
class Login2 extends StatefulWidget {

  static const id = 'login2';

  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  String animate = 'idle';
  var emailController = TextEditingController();
  var passController = TextEditingController();

   bool visible=false;
  bool emailIcon = false;
  bool passIcon=false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(email);
    passController.addListener(pass);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  void email(){
   if( emailController.value.text.isNotEmpty){
     setState(() {
       emailIcon = true;
     });
   }
   else if(emailController.value.text.isEmpty){
     setState(() {
       emailIcon =false;
     });
   }
  }
  void pass(){
    if(passController.value.text.isEmpty){
      setState(() {
        passIcon = true;
      });
    }
    else if(passController.value.text.isEmpty){
      setState(() {
        passIcon=false;
      });
    }
    else if(passController.value.text.isNotEmpty && emailController.value.text.isNotEmpty){
      setState(() {
        visible = true;
      });

    }
    else if(passController.value.text.isEmpty && emailController.value.text.isEmpty){
      setState(() {
        visible =false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.pink[50],
                      height: MediaQuery.of(context).size.height*0.6,
                      child: Center(
                        child: FlareActor(
                          'animations/Teddy.flr',
                            fit: BoxFit.contain,
                          alignment: Alignment.center,
                          animation:'idle',
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue[100],
                      height: MediaQuery.of(context).size.height*0.45,
                    ),
                  ],
                ),
        Positioned(
          top:MediaQuery.of(context).size.height *0.478,
          left: MediaQuery.of(context).size.width*0.08,
          child: Container(
            height: 270,
            width: 300,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Boxo(
                    suffixVisible: emailIcon,
                    suffixIcon: Icons.ac_unit,
                    controller: emailController,
                    text: 'Enter your email',
                    obscure: false,
                    icon: Icons.email,
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  ),
                  SizedBox(height:10.0),
                  Boxo(
                    suffixVisible: passIcon,
                    suffixIcon: Icons.ac_unit,
                    controller: passController,
                    text: 'Enter your password',
                    obscure: true,
                    icon: Icons.lock,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 14.0,color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height:10.0),
                  Visibility(
                    visible: visible,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      onPressed: (){
                        setState(() {
                          emailController.clear();
                          passController.clear();
                          animate= 'test';
                        });
                      },
                      color: Colors.pink[300],
                      child: Text(
                        'Submit', style: TextStyle(
                        color: Colors.black, fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                    ),

                  ),
            ], ), ), ),),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.92,
                    left: MediaQuery.of(context).size.width * 0.1,
                    child: RichText(
                      text: TextSpan(
                        text: 'Dont have an account? ',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 18.0
                        ),
                        children: <TextSpan>  [
                          TextSpan(
                            recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Registration2.id),
                            text: 'Register.',
                            style: TextStyle(
                              color: Colors.blueGrey,
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
      ],
    ),
      ),
    );


  }
}

class Boxo extends StatelessWidget {
  final IconData icon;
  final EdgeInsets padding;
  final String text;
  final bool obscure;
  final TextEditingController controller;
  final IconData suffixIcon;
  final bool suffixVisible;
  Boxo({this.icon,this.padding,this.text,this.obscure,this.controller,this.suffixIcon,this.suffixVisible});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller ,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.pink[200],
          ),
          suffixIcon: Visibility(
            visible: suffixVisible,
            child: Icon(
              suffixIcon,
              color: Colors.orange,
              size: 12.0,
            ),
          ),
          labelText: text,
          labelStyle: TextStyle( color: Colors.black,fontSize: 15.0,),
          focusedBorder:UnderlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide(
            width: 2,color: Colors.grey,),),
          enabledBorder:UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(
            width: 2,color: Colors.grey,),),
        ),
        style: TextStyle(
          color: Colors.pink,
          fontSize: 20.0,
        ),
        onSaved: (value){
print(value);
        },
      ),
    );
  }
}
