import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone/AllScreens/mainScreen.dart';
import 'package:uber_clone/AllScreens/registrationScreen.dart';
import 'package:uber_clone/AllWidgets/progressDialog.dart';

import '../main.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  //const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Image(
                image: AssetImage("assets/images/logo.png"),
                width: MediaQuery.of(context).size.width,
                height: 300.0,
                alignment: Alignment.center,
              ),
             SizedBox(height: 1.0,),
              Text(
                "Login as a Rider",
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Brand Bold"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: emailTextEditingController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.black,
                              fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: passwordTextEditingController,
                      cursorColor: Colors.black,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 10.0,),
                    ElevatedButton(
                      onPressed: () {
                        if(!emailTextEditingController.text.contains("@")){
                          displayToastMessage("Email address is not valid", context);
                        }
                        else if(passwordTextEditingController.text.length < 7){
                          displayToastMessage("Password must be at least 6 character", context);
                        }else{
                          loginAndAuthentication(context);
                        }
                        },
                      child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Brand Bold"
                              ),
                            ),
                          ),
                        ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                          )
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
                  },
                  child: Text(
                    "Do not have an Account? Register Here.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  //final FirebaseAuth auth = FirebaseAuth.instance;

  void loginAndAuthentication(BuildContext context) async{
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return ProgressDialog(message: "Authenticating, Please wait...",);
          },
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      );
      if (userCredential.user != null) {
        Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
        displayToastMessage("you are logged in", context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        displayToastMessage("No record exist for this user. Please create new account", context);
      } else if (e.code == 'wrong-password') {
        displayToastMessage("The password is incorrect. Please try again", context);
      } else {
        displayToastMessage("Error: " + e.message!, context);
      }
    } catch (e) {
      Navigator.pop(context);
      displayToastMessage("Error: " + e.toString(), context);
    }

  }

  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);
  }
}

