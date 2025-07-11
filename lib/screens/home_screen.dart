import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/common/colors.dart';
import '../Fragments/home.dart';
import '../Fragments/profile.dart';
import '../Fragments/results.dart';
import '../Fragments/notification.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final List<Widget> _pages = const [
      Home(),
      Results(),
      NotificationFragment(),
      Profile()
  ];

  void _iconTapped(pos) {
    setState(() {
      index = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight:10,backgroundColor: AppColor.mainColor,),
      body: _pages[index],
      backgroundColor: AppColor.backgroundColorlight,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: AppColor.mainColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        elevation: 20,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _iconTapped(0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.home,
                    size: 25,
                    color: index == 0 ? AppColor.mainColor : null,
                  ),
                  Text("Home",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: index == 0 ? AppColor.mainColor : null)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _iconTapped(1),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.travel_explore_sharp,
                    size: 25,
                    color: index == 1 ? AppColor.mainColor : null,
                  ),
                  Text("News",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: index == 1 ? AppColor.mainColor : null)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _iconTapped(2),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.notifications,
                    size: 25,
                    color: index == 2 ? AppColor.mainColor : null,
                  ),
                  Text("Notifications",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: index == 2 ? AppColor.mainColor : null)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _iconTapped(3),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.settings,
                      size: 25, color: index == 3 ? AppColor.mainColor : null),
                  Text(
                    "Profile",
                    style: GoogleFonts.montserrat(
                        fontSize: 12, color: index == 3 ? AppColor.mainColor : null),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
