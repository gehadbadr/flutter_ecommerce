
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatelessWidget {
   //SignupScreen({super.key});
  static String id = 'SignupScreen';


  GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  String? _email,_password;
  final _auth=Auth();

   @override
  Widget build(BuildContext context) {


     double height = MediaQuery.of(context).size.height;
    return   Scaffold(
          backgroundColor: kMainColor,
          body: BlurryModalProgressHUD(
            inAsyncCall: Provider.of<ModelHud>(context).isLoading,
            blurEffectIntensity: 4,
            // progressIndicator: SpinKitFadingCircle(
            //   color: purpleColor,
            //   size: 90.0,
            // ),
            dismissible: true,
            opacity: 0.4,
            color: Colors.black87,
            child: Form(
              key: _globalkey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
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
                                style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*.1),
                  CustomTextField(hint:'Enter your name',icon: Icons.perm_identity,onClick:(value){_email=value;}),
                  SizedBox(height: height*.02),
                  CustomTextField(hint:'Enter your email',icon: Icons.email,onClick:(value){_email=value;}),
                  SizedBox(height: height*.02),
                  CustomTextField(hint:'Enter your password',icon: Icons.lock,onClick:(value){_password=value;}),
                  SizedBox(height: height*.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                          ),
                          onPressed: ()async {
                            final modelHud = Provider.of<ModelHud>(context,listen: false);
                            modelHud.changeisLoading(true);
                            if(_globalkey.currentState!.validate()){
                              _globalkey.currentState?.save();
                              try{
                                await _auth.signUp(_email!, _password!);
                                modelHud.changeisLoading(true);
                                Navigator.pushReplacementNamed(context, HomePage.id);
                              }on FirebaseAuthException catch (e){
                                if (e.code == 'invalid-email'){
                                  modelHud.changeisLoading(false);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email is invalid")));
                                }else if (e.code == 'email-already-in-use') {
                                  modelHud.changeisLoading(false);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("this email is already  registered ")));
                                }else if (e.code == 'weak-password') {
                                  modelHud.changeisLoading(false);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is weak ")));
                                }
                              }
                            }
                            modelHud.changeisLoading(false);                          },
                          child: Text('Sign up',style: TextStyle(color: Colors.white),),)

                    ),
                  ),
                  SizedBox(height: height*.05),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do have an account ?',style: TextStyle(color: Colors.white,fontSize:16),),
                      GestureDetector(
                          onTap:(){Navigator.pushNamed(context, LoginScreen.id);},
                          child: Text(' Login',style: TextStyle(fontSize:16),
                          )),

                    ],
                  )
                ],
              ),
            ),
          ),
        )
    ;
  }
}

