import 'package:docktor_appointment_app/login.dart';
import 'package:docktor_appointment_app/screens/doctor/details.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
       Duration(milliseconds: 1500),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>DoctorDetails(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ClipOval(
          child: Image.asset(
            'assets/images/icon.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
