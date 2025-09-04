import 'package:docktor_appointment_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  TextEditingController _CPassController = TextEditingController();

  Color Secondary = Color(0xFFECEFF1);
  Color Primary = Color(0xFF343341);
  Color primaryBackground = Color(0xFF1F4F8);
  Color secondaryBackground = Color(0xFFFFFFF);
  Color alternate = Color(0xFFE0E3E7);
  Color secondaryText = Color(0xFF57636C);
  Color Success = Color(0xFF249689);
  Color gehra = Color(0xFF03473F);
  Color Heart = Color(0xFFFB0909);

  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isLogginPage = true;
  bool isContinued = false;

  void _ShowMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  void _checkLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }
@override
void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20),
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: alternate,
                        width: 1.5,
                      )),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                  ),
                ),
              ),

              //dp
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: const ClipOval(
                      child: Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                ),
              ),

              // login layout
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30),
                child: Text(
                  isLogginPage ? 'Login' : 'SignUp',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 5),
                child: Text(
                  isLogginPage
                      ? 'Login to continue with us'
                      : 'Create an account with us',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Redex'),
                ),
              ),

              // EMAIL TEXTEDITOR
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    style: TextStyle(
                      color: Primary,
                      fontFamily: 'Redex',
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _EmailController,
                    decoration: InputDecoration(
                      //HINT TEXT
                      label: const Text(
                        'Enter your Email ID',
                        style: TextStyle(fontSize: 15, fontFamily: 'Redex'),
                      ),
                      prefixIcon: const Icon(Icons.mark_email_read_rounded),
                      fillColor: Colors.grey.shade50,
                      filled: true,

                      //normal border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: secondaryText, width: 3),
                      ),

                      //focused border

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 3),
                      ),

                      //enabled border
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(360),
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              //PASSWORD TEXTEDITOR
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    style: TextStyle(
                      color: Primary,
                      fontFamily: 'Redex',
                      fontSize: 15,
                    ),
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: _PassController,
                    decoration: InputDecoration(
                      //HINT TEXT
                      label: const Text(
                        'Enter your Password',
                        style: TextStyle(fontSize: 15, fontFamily: 'Redex'),
                      ),

                      prefixIcon: const Icon(Icons.password_rounded),
                      fillColor: Colors.grey.shade50,
                      filled: true,

                      //normal border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: secondaryText, width: 3),
                      ),

                      //focused border

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 3),
                      ),

                      //enabled border
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(360),
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              //CONFIRM PASSWORD

              Visibility(
                visible: !isLogginPage,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      style: TextStyle(
                        color: Primary,
                        fontFamily: 'Redex',
                        fontSize: 15,
                      ),
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: _CPassController,
                      decoration: InputDecoration(
                        //HINT TEXT
                        label: const Text(
                          'Confirm Password',
                          style: TextStyle(fontSize: 15, fontFamily: 'Redex'),
                        ),

                        prefixIcon: const Icon(Icons.password_rounded),
                        fillColor: Colors.grey.shade50,
                        filled: true,

                        //normal border
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: secondaryText, width: 3),
                        ),

                        //focused border

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 3),
                        ),

                        //enabled border
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //LOGIN BUTTON // SIGN UP

              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50, top: 55),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(CupertinoColors.systemBlue),
                    ),
                    onPressed: () async {
                      if (isLogginPage) {
                        //login

                        if (_EmailController.text != '') {
                          // email is entered

                          if (_PassController.text != '') {
                            // password is entered

                            isContinued = true;
                            setState(() {});

                            try {
                              UserCredential UserCard =
                                  await _auth.signInWithEmailAndPassword(
                                      email: _EmailController.text,
                                      password: _PassController.text);

                              if (UserCard.user != null) {
                                // loggedin successfully
                                _ShowMsg('Logged in successfully');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              _ShowMsg('$e');
                              isContinued = false;
                              setState(() {});
                            }
                          } else {
                            // password is empty
                            _ShowMsg('Enter Password');
                          }
                        } else {
                          // email is empty
                          _ShowMsg('Enter Emain Id');
                        }
                      } else {
                        isContinued = true;
                        setState(() {});
                        //signup

                        if (_EmailController.text != '') {
                          // email is entered

                          if (_PassController.text != '') {
                            // password is entered
                            if (_PassController.text == _CPassController.text) {
                              // matched
                              try {
                                UserCredential UserCard =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: _EmailController.text,
                                        password: _PassController.text);

                                if (UserCard.user != null) {
                                  // signed in successfully
                                  _ShowMsg('Sighned Up successfully');
                                  isContinued = false;
                                  setState(() {});
                                }
                              } on FirebaseAuthException catch (e) {
                                _ShowMsg('$e');
                                isContinued = false;
                                setState(() {});
                              }
                            } else {
                              // password is empty
                              _ShowMsg('Enter Password');
                            }
                          } else {
                            // email is empty
                            _ShowMsg('Enter Emain Id');
                          }
                        } else {
                          // password not equal to confirm pass
                          _ShowMsg(
                              'Password & Confirm Passeord is not Matched');
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: isContinued,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 3)),
                          ),
                        ),
                        Text(
                          isContinued
                              ? 'Loading....'
                              : isLogginPage
                                  ? 'Login'
                                  : 'SignUp',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Visibility(
                          visible: !isContinued,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                child: Center(
                  child: Text(
                    'or',
                    style: TextStyle(
                        color: secondaryText,
                        fontSize: 16,
                        fontFamily: 'Redex'),
                  ),
                ),
              ),

              //GOOGLE BTN
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45),
                child: InkWell(
                  onTap: () async {
                    GoogleSignInAccount? googleUser =
                        await _googleSignIn.signIn();
                    if (googleUser != null) {
                      GoogleSignInAuthentication googleAuth =
                          await googleUser.authentication;
                      OAuthCredential authCredntial =
                          GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken);
                      UserCredential result = await FirebaseAuth.instance
                          .signInWithCredential(authCredntial);
                      User? user = result.user;
                      if (user != null) {
                        _ShowMsg('Google sign in successful');
                      } else {
                        _ShowMsg('Google sign in failed');
                      }
                    } else {
                      _ShowMsg('Google sign in canceled');
                    }
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(360),
                      border: Border.all(color: alternate, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Image(
                            image: AssetImage("assets/images/google.png"),
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //SIGN UP
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      isLogginPage = !isLogginPage;
                      setState(() {});
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: isLogginPage
                                ? 'Don\'t have an account ? '
                                : 'Already have an account :',
                            style: TextStyle(
                                color: Primary,
                                fontFamily: 'Redex',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: isLogginPage ? 'SignUp ' : 'LogIn',
                            style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                color: CupertinoColors.systemBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
