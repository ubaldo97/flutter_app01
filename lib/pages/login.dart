import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/circle.dart';
import '../widgets/input_text.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit(){
 _formKey.currentState.validate();
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
                              Text("Hello again. \n Welcome back.",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300))
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
                                      InputText(label: "EMAIL ADDRESS",
                                        inputType: TextInputType.emailAddress,
                                        validator: (String text){
                                        if(text.contains("@")){
                                          return null;
                                        }
                                        return "Invalid Email";
                                      },),
                                      SizedBox(height: 30),
                                      InputText(label: "PASSWORD",
                                          isSecure: true
                                          ,validator: (String text){
                                        if(text.isNotEmpty && text.length>5){
                                          return null;
                                        }
                                        return "Invalid Password";
                                      },)
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
                                  child: Text("Sign In",style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("New friend?",style: TextStyle(fontSize: 16,color: Colors.black54)),
                                  CupertinoButton(
                                    onPressed: ()=> Navigator.pushNamed(context, "signup"),
                                    child: Text("Sign Up",style: TextStyle(fontSize: 16,color: Colors.cyan)),
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
              )
            ],
          ),
        ),
      )
    );
  }
}
