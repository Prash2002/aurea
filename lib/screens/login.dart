import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aurea/screens/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
 Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
    
        final AuthResult authResult = await _auth.signInWithCredential(credential);
        final FirebaseUser user = authResult.user;
        final CollectionReference userRef = Firestore.instance.collection('users');
        User userEntered = User(id: user.uid, name: user.displayName, email: user.email, photoUrl: user.photoUrl);
        final DocumentSnapshot doc= await userRef.document(user.uid).get();
        if(!doc.exists){
          await User().addDocument(userEntered);
        }
        return userEntered;
    
      }
    
      @override
      Widget build(BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var orientation = MediaQuery.of(context).orientation;
        return Scaffold(
          body: SafeArea(
              child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: orientation==Orientation.portrait? AssetImage("assets/images/splash.jpg"):AssetImage("assets/images/splash-hor.jpg"),
                  fit:BoxFit.cover,
                ),
              ),
              child:Stack(
                children: <Widget>[
                  Positioned(
                    top:orientation==Orientation.portrait? height*0.56:height/2 -(height*0.55/2),
                    left:orientation==Orientation.portrait? width/2-(width*0.75/2):width/2-(width*0.4/2),
                    child: GestureDetector(
                      child: Container(
                        width:orientation==Orientation.portrait? width*0.75:width*0.4,
                        height:orientation==Orientation.portrait? height*0.28:height*0.55,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text("Login",style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(71, 94, 84,1)
                              ),),
                              Spacer(flex:1),
                              SvgPicture.asset(
                              'assets/images/icons8-gmail.svg',
                               height:100,
                              ),
                              Spacer(flex:1),
                              Text("Google Sign In",style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acme',
                                color: Color.fromRGBO(235, 111, 62,1)
                              ),)
                            ],
                          ),
                        ),
                      ),
                      onTap: ()async {
                          User user = await signInWithGoogle();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(currentUser: user)));
                          },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    
 