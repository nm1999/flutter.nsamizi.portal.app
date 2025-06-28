import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/screens/menu/Payments.dart';

import '../common/colors.dart';
import '../screens/menu/BpamResult.dart';
import '../screens/menu/accountability.dart';
// import '../screens/menu/add_student.dart';
// import '../screens/menu/expenditure_screen.dart';
import '../screens/menu/past_papers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorlight,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(alignment: Alignment.topLeft, children: [
            Container(
              color:AppColor.mainColor,
              height: 260,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hello ",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " 212 !",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 28,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/profile.jpeg"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Take drugs,",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Be healthy for life,",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.alarm, size: 28),
                          ),
                          ElevatedButton(
                            onPressed: () {
                             
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.orange)),
                            child: Text("set a reminder",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 300,
                padding: const EdgeInsets.only(left: 10, right: 10,top:0),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Health matters",
                                style: GoogleFonts.montserrat(),
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      elevation: 2,
                                      child: Icon(Icons.explore_sharp),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      elevation: 2,
                                      child: Icon(Icons.access_time,
                                          color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      elevation: 2,
                                      child: Icon(
                                        Icons.safety_check,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      elevation: 2,
                                      child: Icon(Icons.accessibility,
                                          color: Colors.deepPurple),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 6.0,
                                  )),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "50%",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 40,
                                        color: 30 < 40
                                            ? Colors.black
                                            : 50 < 70
                                                ? Colors.blue
                                                : Colors.green),
                                  ),
                                  Text(
                                    "level of adherence",
                                    style: GoogleFonts.aBeeZee(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Our Menu",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const PastPapers());
                  },
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.fireplace,
                              size: 40,
                              color: AppColor.mainColor,
                            ),
                            Text(
                              "Past papers",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const BpamResult());
                  },
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.edit_document,
                              size: 40,
                              color: AppColor.mainColor,
                            ),
                            Text(
                              "Results",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const Payments());
                  },
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.money,
                              size: 40,
                              color: AppColor.mainColor,
                            ),
                            Text(
                              "Payments",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const AccountabilityScreen());
                  },
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.report_gmailerrorred_rounded,
                              size: 40,
                              color: AppColor.mainColor,
                            ),
                            Text(
                              "Inquiries",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
