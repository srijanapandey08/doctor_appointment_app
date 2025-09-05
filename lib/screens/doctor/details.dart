import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docktor_appointment_app/widgets/icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:horizontal_calender_mz/horizontal_calender_mz.dart';

class DoctorDetails extends StatefulWidget {
  final String category;
  final String name;
  final String rating;
  final String fee;
  final String experience;
  final String phone;
  final String dp;
  final String sun;
  final String mon;
  final String tue;
  final String wed;
  final String thu;
  final String fri;
  final String sat;

  const DoctorDetails(
      {super.key,
      required this.category,
      required this.dp,
      required this.name,
      required this.rating,
      required this.fee,
      required this.phone,
      required this.experience,
      required this.sun,
      required this.mon,
      required this.tue,
      required this.wed,
      required this.thu,
      required this.fri,
      required this.sat});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  List _dates = [];

  String selectedDate = '';
  String month = '';
  List<String> slots = [];
  void fetchDates() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await firestore.collection('Dates').get();
      _dates = querySnapshot.docs.map((docs) {
        return docs.data();
      }).toList();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void setSelectedDate(String date) {
    selectedDate = date;
    setState(() {});
  }

  void currentMonth() {
    int numMonth = DateTime.now().month;
    month = numMonth == 1
        ? 'Jan'
        : numMonth == 2
            ? 'Feb'
            : numMonth == 3
                ? 'Mar'
                : numMonth == 4
                    ? 'Apr'
                    : numMonth == 5
                        ? 'May'
                        : numMonth == 6
                            ? 'Jun'
                            : numMonth == 7
                                ? 'Jul'
                                : numMonth == 8
                                    ? 'Aug'
                                    : numMonth == 9
                                        ? 'Sep'
                                        : numMonth == 10
                                            ? 'Oct'
                                            : numMonth == 11
                                                ? 'Nov'
                                                : 'Dec';
    setState(() {});
  }

  void arrangeSlots(String currentDay) {
    slots.clear();
    String tempSlots = currentDay == 'Mon'
        ? widget.mon
        : currentDay == 'Tue'
            ? widget.tue
            : currentDay == 'Wed'
                ? widget.wed
                : currentDay == 'Thu'
                    ? widget.thu
                    : currentDay == 'Fri'
                        ? widget.fri
                        : currentDay == 'Sat'
                            ? widget.sat
                            : widget.sun;
    slots = tempSlots.split(',').map((s) => s.trim()).toList();
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      fetchDates();
      setSelectedDate(
        DateTime.now().day.toString(),
      );
      currentMonth();
      arrangeSlots('Fri');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    IconBtn(
                      icons: Icons.arrow_back_ios_sharp,
                    ),
                    Spacer(),
                    IconBtn(
                      icons: Icons.favorite_border_rounded,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconBtn(
                      icons: Icons.share_rounded,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 260,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.dp ??
                              'https://res.cloudinary.com/dkiiws6uj/image/upload/v1756970392/ladydr_yparxt.webp',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 15.0, 0.0, 0.0),
                            child: Text(
                              widget.category,
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.grey.shade800,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 0.0, 0.0),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.grey.shade900,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: CupertinoColors.systemOrange,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  widget.rating,
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontFamily: 'Readex',
                                      fontSize: 16),
                                ),
                                Text(
                                  '(5347)',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 0.0, 25.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$${widget.fee}',
                                    style: const TextStyle(
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.0,
                                        fontSize: 24,
                                        color: CupertinoColors.systemBlue,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const TextSpan(
                                    text: '/ session',
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                                style: const TextStyle(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.0,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      //SECOND ACTION BAR

                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 37,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(360),
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1.5),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: Text(
                                  '+${widget.experience} years Experience',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Redex',
                                      color: Colors.grey.shade900),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1)),
                            child: Icon(
                              Icons.calendar_month_rounded,
                              size: 18,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1)),
                            child: Icon(
                              Icons.call,
                              size: 18,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //booking slots

                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              '$month ${DateTime.now().year}',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Redex',
                                  color: Colors.grey.shade900),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              '6 slots available',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Ubuntu',
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 10,
                            color: Colors.grey.shade800,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: Colors.grey.shade800,
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),

                      // AVAILABLEDATES

                      _dates.isEmpty
                          ? const SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            )
                          : SizedBox(
                              height: 98,
                              width: MediaQuery.sizeOf(context).width,
                              child: ListView.builder(
                                primary: false,
                                padding: const EdgeInsets.only(
                                    top: 16, bottom: 10, left: 10),
                                itemCount: _dates.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final listItem = _dates[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: InkWell(
                                      onTap: () {
                                        setSelectedDate(listItem['Date']);
                                        arrangeSlots(listItem['Day']);
                                        print(slots);
                                      },
                                      child: Container(
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          border: Border.all(
                                            color:
                                                selectedDate == listItem['Date']
                                                    ? CupertinoColors.systemBlue
                                                    : Colors.grey.shade300,
                                            width: 1.6,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 5.0,
                                              bottom: 5.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                listItem['Day'],
                                                style: TextStyle(
                                                    color: selectedDate ==
                                                            listItem['Date']
                                                        ? CupertinoColors
                                                            .systemBlue
                                                        : Colors.grey.shade700,
                                                    fontSize: 12,
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                              Text(
                                                listItem['Date'],
                                                style: TextStyle(
                                                    color: selectedDate ==
                                                            listItem['Date']
                                                        ? CupertinoColors
                                                            .systemBlue
                                                        : Colors.grey.shade900,
                                                    fontSize: 16,
                                                    fontFamily: 'Redex'),
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

                      // Slots Booking
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 189, 213, 224)
                                .withOpacity(0.9),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Text(
                                      'Available Time Only',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Redex',
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Text(
                                      '6 slots ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.grey.shade800),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 10,
                                    color: Colors.grey.shade800,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 10,
                                    color: Colors.grey.shade800,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 40,
                                    width: (MediaQuery.sizeOf(context).width -
                                            78) /
                                        3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        slots[0],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Redex',
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 40,
                                    width: (MediaQuery.sizeOf(context).width -
                                            78) /
                                        3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        slots[1],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Redex',
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 40,
                                    width: (MediaQuery.sizeOf(context).width -
                                            78) /
                                        3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        slots[2],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Redex',
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 40,
                                    width: (MediaQuery.sizeOf(context).width -
                                            78) /
                                        3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        slots[3],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Redex',
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 40,
                                    width: (MediaQuery.sizeOf(context).width -
                                            78) /
                                        3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                         slots[4],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Redex',
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 40,
                                    width: (MediaQuery.sizeOf(context).width -
                                            78) /
                                        3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        slots[5],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Redex',
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Next Button

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemBlue,
                            borderRadius: BorderRadius.circular(360),
                          ),
                          child: const Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontFamily: 'Redex',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
