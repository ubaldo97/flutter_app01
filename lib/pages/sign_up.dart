import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app01/api/auth_api.dart';
import '../widgets/circle.dart';
import '../widgets/input_text.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  final _authAPI = AuthAPI();
  var _username='',_email='',_password = '';

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() async{
    final isValid = _formKey.currentState.validate();
    if(isValid){
      final isOk = await _authAPI.register(username:_username,email: _email,password: _password);
      if(isOk){
        print("REGISTER");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: -size.width*.25,
                  top: -size.width*.25,
                  child:  Circle(
                    radio: size.width*.45,
                    colors: [
                      Colors.cyan,
                      Colors.cyanAccent
                    ],
                  ),
                ),
                Positioned(
                  right: -size.width*.22,
                  top: -size.width*.35,
                  child:  Circle(
                    radio: size.width*.45,
                    colors: [
                      Colors.purple,
                      Colors.purpleAccent
                    ],
                  ),
                ),

                Positioned(
                  left: -size.width*.15,
                  top: -size.width*.35,
                  child:  Circle(
                    radio: size.width*.35,
                    colors: [
                      Colors.blue,
                      Colors.indigo
                    ],
                  ),
                ),

                SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      height: size.height,
                      child: SafeArea(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 90,
                                  margin: EdgeInsets.only(top: size.width*0.3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26, blurRadius: 25
                                        )
                                      ]
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text("Hello. \n Sign up to get started.",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: 350,
                                        minWidth: 350
                                    ),
                                    child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: <Widget>[
                                            InputText(label: "USERNAME",
                                              validator: (String text){
                                                if(RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)){
                                                  _username = text;
                                                  return null;
                                                }
                                                return "Invalid Username";
                                              }),
                                            SizedBox(height: 10),
                                            InputText(label: "EMAIL ADDRESS",
                                              inputType: TextInputType.emailAddress,
                                              validator: (String text){
                                                if(text.contains("@")){
                                                  _email = text;
                                                  return null;
                                                }
                                                return "Invalid Email";
                                              }),
                                            SizedBox(height: 10),
                                            InputText(label: "PASSWORD",
                                              isSecure: true
                                              ,validator: (String text){
                                                if(text.isNotEmpty && text.length>5){
                                                  _password = text;
                                                  return null;
                                                }
                                                return "Invalid Password";
                                              }),
                                          ],
                                        )
                                    )
                                ),
                                SizedBox(height: 50),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 350,
                                      minWidth: 350
                                  ),
                                  child: CupertinoButton(
                                    padding: EdgeInsets.symmetric(vertical: 17),
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(6),
                                    onPressed: () => _submit(),
                                    child: Text("Sign Up",style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Already have an account?",style: TextStyle(fontSize: 16,color: Colors.black54)),
                                    CupertinoButton(
                                      onPressed: ()=>Navigator.pop(context),
                                      child: Text("Sign In",style: TextStyle(fontSize: 16,color: Colors.cyan)),
                                    )
                                  ],
                                ),
                                SizedBox(height: size.height*0.08,)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Positioned(
                  left: 15,
                  top: 5,
                  child: SafeArea(
                    child: CupertinoButton(
                      color: Colors.black12,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      onPressed: ()=>Navigator.pop(context),
                      child: Icon(Icons.arrow_back,color: Colors.white),
                    ),
                  )
                )
              ],
            ),
          ),
        )
    );
  }
}
