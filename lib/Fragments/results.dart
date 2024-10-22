import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  Dio dio = Dio();
  List records = [];

  fetchRecords() async {
    Response response =
        await dio.get("http://nutricare.benipele.org/v1/fetch-record.php");
    if (response.statusCode == 200) {
      setState(() {
        records = response.data["results"];
      });
    } else {
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [          
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.grey[200]),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "search"),
            ),
          ),
          Expanded(
            child: records.isEmpty
                ? const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        title: Row(
                          children: [
                            Text("NC0012 - ",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600)),
                            Text(
                                "${records[index]["surname"]} ${records[index]["firstname"]}",
                                style: GoogleFonts.montserrat()),
                          ],
                        ),
                        subtitle: Text(
                          "${records[index]["village"]}",
                          style: GoogleFonts.montserrat(),
                        ),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                            width: 0.2,
                          ),
                        ),
                      );
                    },
                    itemCount: records.length),
          )
        ],
      ),
    );
  }
}
