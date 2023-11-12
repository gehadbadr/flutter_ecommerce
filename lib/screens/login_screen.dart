import 'package:ecommerce/costants.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});
  static String id = 'LoginScreen';
  final GlobalKey<FormState>_globalKey= GlobalKey<FormState>();
  late String _email,_password;
  final _auth=Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
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
            CustomTextField(hint:'Enter your email',icon: Icons.email,onClick: (value){_email=value;} ,),
            SizedBox(height: height*.02),
            CustomTextField(hint:'Enter your password',icon: Icons.lock,onClick: (value){_password=value;}),
            SizedBox(height: height*.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                  ),
                onPressed: ()async {

                  if(_globalKey.currentState!.validate()){
                    _globalKey.currentState?.save();
                    print(_email);
                    print(_password);
                    final authResult = await _auth.signIn(_email, _password);
                    print(authResult.user.uid);

                  }

                },

                // onPressed: () {
                  //   _globalKey.currentState?.validate();
                  // },
                  child: Text('Login',style: TextStyle(color: Colors.white),),),
            ),
            SizedBox(height: height*.05),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account ?',style: TextStyle(color: Colors.white,fontSize:16),),
                GestureDetector(
                    onTap:(){Navigator.pushNamed(context, SignupScreen.id);},
                    child: Text(' Sign up',style: TextStyle(fontSize:16),
                    )),

              ],
            )
          ],
        ),
      ),
    );
  }
}
