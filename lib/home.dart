import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docktor_appointment_app/screens/doctor/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List category = [];
  List doctors = [];
  bool isDoctorErrored = false;
  // String categoryError = "";
  late MotionTabBarController tabBarController;

  void fetchCategories() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await firestore.collection('Category').get();
      category = querySnapshot.docs.map((docs) {
        return docs.data();
      }).toList();
      setState(() {});
      print(category);
    } catch (e) {
      print(e);
    }
  }

  void fetchDoctors() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await firestore.collection('Doctors').get();
      doctors = querySnapshot.docs.map((docs) {
        return docs.data();
      }).toList();
      isDoctorErrored = false;
      setState(() {});
      print(doctors);
    } catch (e) {
      isDoctorErrored = true;
      setState(() {});
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCategories();
      fetchDoctors();
      tabBarController = MotionTabBarController(length: 5, vsync: this);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //ACTION BAR
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'AppDoc',
                        style: TextStyle(
                          fontFamily: 'Redex',
                          color: Colors.grey.shade800,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 20.0, 0.0),
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: const Color(0x95E0E3E7),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey.shade900,
                        size: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 20.0, 0.0),
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: const Color(0x95E0E3E7),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.grey.shade900,
                        size: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),

            //CATEGORY LIST

            category.isNotEmpty
                ? Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 0.0, 0.0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          Map categoryData = category[index];

                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(360.0),
                                  child: Image.network(
                                    categoryData['IMG'],
                                    width: 55.0,
                                    height: 55.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    categoryData['Name'],
                                    style: TextStyle(
                                        fontFamily: 'Readex',
                                        color: Colors.grey.shade900,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 35,
                    width: 35,
                    child: CircularProgressIndicator(),
                  ), //Title bar

            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Top Doctors',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.grey.shade900,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontFamily: 'Redex',
                          color: CupertinoColors.systemBlue,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),

            // DOCTORS LIST
            doctors.isNotEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          Map doctorsData = doctors[index];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 5.0, 20.0, 5.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => DoctorDetails(
                                      category: doctorsData['Category'] ?? '',
                                      experience:
                                          doctorsData['Experience'] ?? '',
                                      name: doctorsData['Name'] ?? '',
                                      rating:
                                          doctorsData['Rating'].toString() ??
                                              '',
                                      fee: doctorsData['Fee'] ?? '',
                                      phone: doctorsData['phone'] ?? '',
                                      dp: doctorsData['DP'] ?? '',
                                      sun: doctorsData['Sun'] ?? '',
                                      mon: doctorsData['Mon'] ?? '',
                                      tue: doctorsData['Tue'] ?? '',
                                      wed: doctorsData['Wed'] ?? '',
                                      thu: doctorsData['Thu'] ?? '',
                                      fri: doctorsData['Fri'] ?? '',
                                      sat: doctorsData['Sat'] ?? ''),
                                );
                              },
                              child: Container(
                                width: 100.0,
                                height: 270.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 2),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          doctorsData['DP'],
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        15.0, 10.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x3FE0E3E7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Icon(
                                                            Icons.star_half,
                                                            color: Color(
                                                                0xFFFFB300),
                                                            size: 24.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              doctorsData[
                                                                      'Rating']
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontFamily:
                                                                    'Ubuntu',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0x3FE0E3E7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90.0),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .favorite_border_rounded,
                                                        color: Colors
                                                            .grey.shade900,
                                                        size: 20.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  doctorsData['Category'],
                                                  style: const TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    color: Color(0xA912151C),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  doctorsData['Name'],
                                                  style: TextStyle(
                                                      fontFamily: 'Ubuntu',
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '\$${doctorsData['Fee']}',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Ubuntu',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      TextSpan(
                                                        text: '/ session',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Ubuntu',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                    style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        letterSpacing: 0.0,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x46E0E3E7),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      topRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Availability',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Ubuntu',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' . 5 Slots',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Ubuntu',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Ubuntu',
                                                                  letterSpacing:
                                                                      0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                '25 Oct',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Ubuntu',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_rounded,
                                                                  size: 18.0,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade900,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : isDoctorErrored
                    ? Expanded(
                        child: Center(
                          child: Text(
                            'No Doctors available !',
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 17),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator(),
                      ),
          ],
        ),
      ),
      bottomNavigationBar: MotionTabBar(
        controller: tabBarController,
        initialSelectedTab: 'Home',
        onTabItemSelected: (tab) {
          tabBarController.index = tab;
          setState(() {});
        },
        labels: const ['Home', 'Appointments', 'Favorites', 'Chats', 'Profile'],
        icons: const [
          Icons.home_filled,
          Icons.calendar_month_rounded,
          CupertinoIcons.heart_fill,
          CupertinoIcons.chat_bubble_2_fill,
          Icons.person_4_rounded,
        ],
        tabIconSize: 22,
        textStyle: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 15,
        ),
      ),
    );
  }
}
