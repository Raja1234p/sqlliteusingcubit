
import 'package:skindisease/hisotry.dart';
import 'package:skindisease/loginui.dart';
import 'package:skindisease/suggestion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'detectdiseasesbyimage.dart';
import 'detectdiseasesbyname.dart';
import 'homescreen.dart';
import 'signupui.dart';

void main()  async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home:MyApp()));
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Express City Taxi',
        theme: ThemeData(
          fontFamily: 'Brand Bold',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser==null? LoginPage.idScreen :HomeScreen.idScreen,
        routes: {

          Signup.idScreen:(context)=>Signup(),
          LoginPage.idScreen:(context)=>LoginPage(),
          HomeScreen.idScreen:(context)=>HomeScreen(),
          Detectbyname.idScreen:(context)=>Detectbyname.name('imageUrl'),
          ImageDetection.idScreen:(context)=>ImageDetection(),
          Suggestion.idScreen:(context)=>Suggestion(),
          History.idScreen:(context)=>History()


        },
        debugShowCheckedModeBanner: false,



    );


  }

}











//
// class SplashScreen extends StatefulWidget {
//   static const String idScreen = 'Splash Screen';
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(
//         Duration(seconds: 3),
//         () => Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset("images/splashscreen.png",
//             fit: BoxFit.cover),
//       ),
//     );
//   }
// }
