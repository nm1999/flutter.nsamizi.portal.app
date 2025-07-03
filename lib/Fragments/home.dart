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
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backgroundColorlight,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 230,
            child: Stack(alignment: Alignment.topLeft, children: [
              Container(
                color: AppColor.mainColor,
                height: 140,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "Hello ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Joan !",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),                       
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: _width,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
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
                                  "Objectives",
                                  style: GoogleFonts.montserrat(),
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
                                      color: AppColor.mainColor,
                                      width: 6.0,
                                    )),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Text(
                                      "50",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 40,
                                          color: 30 < 40
                                              ? Colors.black
                                              : 50 < 70
                                                  ? Colors.blue
                                                  : Colors.green),
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
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              "Our Menu",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
