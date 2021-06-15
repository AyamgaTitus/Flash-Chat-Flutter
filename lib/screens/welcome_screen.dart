
import 'package:flash_chat/Team.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:share/share.dart';
import 'package:fluttertoast/fluttertoast.dart';



class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//.....................................................................................................................................................................



        floatingActionButton: BoomMenu(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          //child: Icon(Icons.add),
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          children: [
            MenuItem(
              child: Icon(Icons.share_outlined, color: Colors.white),
              title: "Share",
              titleColor: Colors.white,
              subtitle: "Share to the world",
              subTitleColor: Colors.white,
              backgroundColor: Colors.blue,
              onTap: ()  {
                          final String url ="http//com.titi.flash_share ";
                      final RenderBox box =context.findRenderObject();
                      Share.share(url,sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              },
            ),
            MenuItem(
              child: Icon(Icons.group_outlined, color: Colors.white),
              title: "Team",
              titleColor: Colors.white,
              subtitle: "View Project Team Members",
              subTitleColor: Colors.white,
              backgroundColor: Colors.blue,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Team()),
                );
              }
            ),
            MenuItem(
              child: Icon(Icons.star_rate_outlined, color: Colors.white),
              title: "Rate US",
              titleColor: Colors.white,
              subtitle: "Tell us your Experience",
              subTitleColor: Colors.white,
              backgroundColor: Colors.blue,
              onTap: () {
                    SimpleStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: 3,
                  size: 32,
                  //allowEditing: true,
                  onRated: (rate) {

                  },
                  spacing: 10,
                );
              }

            ),
            MenuItem(
              child: Icon(Icons.subdirectory_arrow_left_outlined, color: Colors.white),
              title: "Log Out",
              titleColor: Colors.white,
              subtitle: "Log out",
              subTitleColor: Colors.white,
              backgroundColor: Colors.blue,
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Successfully Logged Out",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

              }
            )
          ],
        ),


//..................................................................................................................................................................
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Center(
              child: Text('Messages are End-to-End encrypted', style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w200,
                letterSpacing: 2.7,
                height: 10,
                color: Colors.orange,
              ),),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),

          ],


        ),



      ),
    );
  }
}
