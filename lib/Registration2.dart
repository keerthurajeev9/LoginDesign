import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Login2.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'validator.dart';
class Registration2 extends StatefulWidget {
  static const id = 'registration2';

  @override
  _Registration2State createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  Validation validation = new Validation();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  void validate(){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();}
    else{
      _autoValidate = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 40.0,
                    ),
                  ),
                ),
                Container(
                  height: 100.0,

                  child: new FlareActor(
                    'animations/Teddy.flr',
                    animation: 'success',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight: Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Register(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                              text: 'Enter your first name *',
                              icon: Icons.people,
                              validator: validation.validateFirstName,
                              obscure: false),
                          Register(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                              text: 'Enter your last name *',
                              icon: Icons.people_outline,
                              validator: validation.validateLastName,obscure: false),
                          Register(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                              text: 'Enter your email *',
                              icon: Icons.email,
                              validator: validation.validateEmail,obscure: false),
                          Register(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                              text: 'Enter your password *',
                              icon: Icons.lock,
                              validator: validation.validatePassword,obscure: true),
                          Padding(
                            padding: const EdgeInsets.only(top:10),
                            child: FlatButton(
                              color: Colors.white70,
                              child: Padding(
                                padding: const EdgeInsets.only(top:10,bottom: 10),
                                child: Text(
                                  'Submit',
                                ),
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              onPressed: validate,

                            ),
                          ),
                          SizedBox(height:20.0),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Have an account? ',
                                style: TextStyle(color: Colors.blue, fontSize: 18.0
                                ),
                                children: <TextSpan>  [
                                  TextSpan(
                                    recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Login2.id),
                                    text: 'Log In.',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
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


              ],
            )
          ],
        ),
      ),
    );

  }
}

class Register extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final IconData icon;
  final Function validator;
  final bool obscure;
  Register({this.padding,this.text,this.icon,this.validator,this.obscure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blue,
          ),
          labelText:text,
          labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.0
          ),
          focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color: Colors.black)),
          errorStyle:TextStyle(color: Colors.red),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),

        ),
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        cursorColor: Colors.green,
        validator: validator,
        onSaved: (value){
          print(value);},
      ),
    );
  }
}