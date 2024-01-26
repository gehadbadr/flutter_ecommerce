import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/strings.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/provider/adminMode.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/admin/add_product.dart';
import 'package:ecommerce/screens/admin/edit_product.dart';
import 'package:ecommerce/screens/admin/products_view.dart';
import 'package:ecommerce/screens/admin_home.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';


/*
void main() {
  runApp(const MyApp());
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return/* MultiProvider(
        providers: [
          ChangeNotifierProvider<ModelHud>(
            create: (context) => ModelHud(),
          ),
          ChangeNotifierProvider<AdminMode>(
            create: (context) => AdminMode(),
          ),
        ],
        child:*/ GetMaterialApp(
          home:SplashScreen(),

          debugShowCheckedModeBanner: false,
            title:appname,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
              appBarTheme: const AppBarTheme(iconTheme:IconThemeData(color: darkFontGrey),backgroundColor: Colors.transparent,elevation: 0.0
              ),
              //fontFamily: regular,
            ),
         /*   initialRoute: SplashScreen.id, routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomePage.id: (context) => HomePage(),
          AdminHome.id: (context) => AdminHome(),
          AddProduct.id: (context) => AddProduct(),
          EditProduct.id: (context) => EditProduct(),
          Products.id: (context) => Products(),
        }*/
       // )
    );
  }
}
