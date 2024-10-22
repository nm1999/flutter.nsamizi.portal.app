import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final List<Widget> _pages = const [
      
  ];

  void _iconTapped(pos) {
    setState(() {
      index = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: Colors.red,
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
                    color: index == 0 ? Colors.red : null,
                  ),
                  Text("Home",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: index == 0 ? Colors.red : null)),
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
                    Icons.search,
                    size: 25,
                    color: index == 1 ? Colors.red : null,
                  ),
                  Text("Search",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: index == 1 ? Colors.red : null)),
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
                    Icons.message,
                    size: 25,
                    color: index == 2 ? Colors.red : null,
                  ),
                  Text("Consult",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: index == 2 ? Colors.red : null)),
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
                      size: 25, color: index == 3 ? Colors.red : null),
                  Text(
                    "Settings",
                    style: GoogleFonts.montserrat(
                        fontSize: 12, color: index == 3 ? Colors.red : null),
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
