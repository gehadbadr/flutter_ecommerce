import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/provider/adminMode.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/admin_home.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});
  static String id = 'LoginScreen';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? _email, _password;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: BlurryModalProgressHUD(
        inAsyncCall: Provider
            .of<ModelHud>(context)
            .isLoading,
        blurEffectIntensity: 4,
        // progressIndicator: SpinKitFadingCircle(
        //   color: purpleColor,
        //   size: 90.0,
        // ),
        dismissible: true,
        opacity: 0.4,
        color: Colors.black87,
        child: Form(
          key: globalKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/icons/buy.png'),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Text(
                            "Buy it",
                            style:
                            TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .1),
              CustomTextField(
                  hint: 'Enter your email',
                  icon: Icons.email,
                  onClick: (value) {
                    _email = value;
                  }),
              SizedBox(height: height * .02),
              CustomTextField(
                  hint: 'Enter your password',
                  icon: Icons.lock,
                  onClick: (value) {
                    _password = value;
                  }),
              SizedBox(height: height * .05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                  ),
                  onPressed: () async {
                    _validate(context);
                    /*final modelHud =
                        Provider.of<ModelHud>(context, listen: false);
                    modelHud.changeisLoading(true);
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState?.save();
                      try {
                        final authResult =
                            await _auth.signIn(_email!, _password!);
                        modelHud.changeisLoading(true);
                        Navigator.pushReplacementNamed(context, HomePage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'invalid-email') {
                          modelHud.changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Email is invalid")));
                        } else if (e.code == 'user-not-found') {
                          modelHud.changeisLoading(false);
                          print("kjvklsdjkdjfgkfjgkdfk");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("This email is not found ")));
                        } else if (e.code == 'wrong-password') {
                          modelHud.changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Wrong Password ")));
                        }
                      }
                    }
                    modelHud.changeisLoading(false);
                 */
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                      },
                      child: Text(
                        ' Sign up',
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Provider.of<AdminMode>(context,listen: false).changeisAdmin(true);
                      },
                      child: Text(
                        ' user',
                        style: TextStyle(
                            fontSize: 16,
                            color: Provider
                                .of<AdminMode>(context)
                                .isAdmin
                                ? kMainColor
                                : Colors.white),
                      )),
                  GestureDetector(
                      onTap: () {
                        Provider.of<AdminMode>(context,listen: false).changeisAdmin(false);
                      },
                      child: Text(
                        ' admin',
                        style: TextStyle(
                            fontSize: 16,
                            color: Provider
                                .of<AdminMode>(context)
                                .isAdmin
                                ? Colors.white
                                : kMainColor),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
     modelHud.changeisLoading(true);
    if (globalKey.currentState!.validate()) {
      globalKey.currentState?.save();
      /*  if (Provider.of<AdminMode>(context).isAdmin) {
        try {
          final authResult = await _auth.signIn(_email!, _password!);
          modelHud.changeisLoading(true);
          Navigator.pushReplacementNamed(context, HomePage.id);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Email is invalid")));
          } else if (e.code == 'user-not-found') {
            modelHud.changeisLoading(false);
            print("kjvklsdjkdjfgkfjgkdfk");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("This email is not found ")));
          } else if (e.code == 'wrong-password') {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Wrong Password ")));
          }
        }
      }
      modelHud.changeisLoading(false);
    } else {*/
      if (Provider
          .of<AdminMode>(context, listen: false)
          .isAdmin) {
        try {
          final authResult = await _auth.signIn(_email!, _password!);
          modelHud.changeisLoading(true);
          Navigator.pushReplacementNamed(context, AdminHome.id);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Email is invalid")));
          } else if (e.code == 'user-not-found') {
            modelHud.changeisLoading(false);
            print("kjvklsdjkdjfgkfjgkdfk");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("This email is not found ")));
          } else if (e.code == 'wrong-password') {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Wrong Password ")));
          }
        }
      }
    else{
        try {
          final authResult = await _auth.signIn(_email!, _password!);
          modelHud.changeisLoading(false);
          Navigator.pushReplacementNamed(context, HomePage.id);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Email is invalid")));
          } else if (e.code == 'user-not-found') {
            modelHud.changeisLoading(false);
            print("kjvklsdjkdjfgkfjgkdfk");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("This email is not found ")));
          } else if (e.code == 'wrong-password') {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Wrong Password ")));
          }
        }
        //}
        modelHud.changeisLoading(false);
      }

    }
    modelHud.changeisLoading(false);

  }
}