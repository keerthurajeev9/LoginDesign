import 'package:flutter/material.dart';
import 'package:login1/Registration3.dart';
import 'validator.dart';
class Login3 extends StatelessWidget {
  static const id= 'Login3';

  Validation validation = new Validation();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController= TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  void validate(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }
    else{
      autoValidate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPaint(
        painter: SpecialPainter(),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width*0.05,
            top: MediaQuery.of(context).size.height*0.04,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Registration3.id);
              },
              child: Icon(
                Icons.arrow_back,
                size: 25.0,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width*0.1,
            top: MediaQuery.of(context).size.height*0.19,
            child: Text(
              'Welcome ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width*0.1,
            top: MediaQuery.of(context).size.height*0.26,
            child: Text(
              'Back ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 35.0
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidate: autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                       Texto(text: 'Email',padding: EdgeInsets.only(top:280,left: 30),obscure: false,validator: validation.validateEmail,controller: emailController,),
                    Texto(text: 'Password',padding: EdgeInsets.only(top:30,left: 30),obscure: true,validator: validation.validatePassword,controller: passController,),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40,left: 20.0),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40,left: 160),
                          child: GestureDetector(
                            onTap: (){
                              validate();
                              emailController.clear();
                              passController.clear();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[800],
                              radius: 30.0,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 35,left: 30.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, Registration3.id);
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35,left: 80.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, Registration3.id);
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    ),
    ),
    ),
    );
  }
}

class Texto extends StatelessWidget {
  final EdgeInsets padding;
  final TextEditingController controller;
  final String text;
  final bool obscure;
  final Function validator;
  Texto({this.padding,this.text,this.obscure,this.validator,this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        onSaved: (value){
          print(value);
        },
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.black),),
          focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.black,

          ),),
          errorBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.black),),
          focusedErrorBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.black),),
          errorStyle: TextStyle(color: Colors.pink[100]),

        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class SpecialPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint =Paint();
    var width= size.width;
    var height=size.height;
    paint.color = Colors.white;
    var whitePath = Path();
    whitePath.addRect(Rect.fromLTWH(0, 0, width, height));
    canvas.drawPath(whitePath, paint);

    //Blue path
    var bluePath =Path();
    paint.color = Colors.lightBlueAccent;
    bluePath.lineTo(width, 0);
    bluePath.lineTo(width, height*0.5);
    bluePath.cubicTo(width*0.6, height*0.5,width*0.3, height*0.3, 0, height*0.2);
    bluePath.close();
    canvas.drawPath(bluePath, paint);

    //Grey Path
    var greyPath =Path();
    paint.color = Colors.grey[800];
    greyPath.lineTo(width, 0);
    greyPath.lineTo(width, height*0.09);
    greyPath.cubicTo(width*0.42, height*0.2,width*0.9, height*0.65, 0, height*0.4);
    greyPath.close();
    canvas.drawPath(greyPath, paint);

    //Yellow Path
    var amberPath =Path();
    paint.color = Colors.amberAccent[400];
    amberPath.moveTo(width*0.8, 0);
    amberPath.lineTo(0, 0);
    amberPath.lineTo(0, height*0.2);
    amberPath.cubicTo(width*0.2, height*0.2, width*0.03, height*0.05, width*0.74, 0);
    amberPath.close();
    canvas.drawPath(amberPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;


}
