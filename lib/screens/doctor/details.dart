import 'package:docktor_appointment_app/widgets/icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.1),
          ),
          child: Column(
            children: [
              SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      IconBtn(icons: Icons.arrow_back_ios_sharp,),
                      Spacer(),
                      IconBtn(icons: Icons.favorite_border_rounded,),
                      SizedBox(
                        width: 10,
                      ),
                      IconBtn(icons: Icons.share_rounded,),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
