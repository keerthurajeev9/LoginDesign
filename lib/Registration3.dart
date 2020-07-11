import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login1/validator.dart';
import 'Login3.dart';
class Registration3 extends StatefulWidget {
  static const id = 'Registration3';

  @override
  _Registration3State createState() => _Registration3State();
}

class _Registration3State extends State<Registration3> {
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
                     Navigator.pushNamed(context, Login3.id);
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
                  top: MediaQuery.of(context).size.height*0.1,
                  child: Text(
                    'Create ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width*0.1,
                  top: MediaQuery.of(context).size.height*0.17,
                  child: Text(
                    'Account ',
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
                          Texto(text: 'Name',
                            padding: const EdgeInsets.only(top:190,left: 30),obscure: false,validator: validation.validateLastName,controller: nameController,),
                          Texto(text: 'Email',padding: EdgeInsets.only(top:30,left: 30),obscure: false,validator: validation.validateEmail,controller: emailController,),
                          Texto(text: 'Password',padding: EdgeInsets.only(top:30,left: 30),obscure: true,validator: validation.validatePassword,controller: passController,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 40,left: 20.0),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40,left: 160),
                                child: GestureDetector(
                                  onTap: (){
                                    validate();
                                    emailController.clear();
                                    nameController.clear();
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
                          Padding(
                            padding: const EdgeInsets.only(top: 35,left: 30.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, Login3.id);
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
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
        validator: validator,
        onSaved: (value){
          print(value);
        },
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            fontSize: 17.0,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.white),),
          focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.white,

          ),),
          errorBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.grey),),
          focusedErrorBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.grey),),
          errorStyle: TextStyle(color: Colors.pink[100]),

        ),
        style: TextStyle(color: Colors.tealAccent),
      ),
    );
  }
}

class SpecialPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var height= size.height;
    var width = size.width;

    //white
    paint.color = Colors.white;
    var whitePath = Path();
    whitePath.addRect(Rect.fromLTWH(0, 0, width, height));
    canvas.drawPath(whitePath,paint);
//Blue
    paint.color = Colors.lightBlueAccent[200];
    var bluePath =Path();
    bluePath.lineTo(0,height);
    bluePath.lineTo(width*0.4, height);
    bluePath.cubicTo(width*0.6, height*0.7, width*0.65, height*0.75, width*1.95, height*0.4);

    canvas.drawPath(bluePath, paint);

    //Black
    var blackPath = Path();
    paint.color = Colors.grey[800];
    blackPath.lineTo(width, 0);
    blackPath.lineTo(width, height*0.3);
    blackPath.cubicTo(width*0.7, height*0.5, width*0.4, height*0.3, 0, height*0.6);
    blackPath.close();
    canvas.drawPath(blackPath, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}