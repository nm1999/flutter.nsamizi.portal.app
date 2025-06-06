import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/common/FormButton.dart';
import 'package:nsamiziportal/common/FormEditText.dart';
import '../../localDB/sqliteservice.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  DatabaseHelper db = DatabaseHelper();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String _selectedCourse = "";
  String _selectedPeriod = "";
  List<String> courses = <String>[
    'BPAM',
    'DPAM',
    'DSWK',
    'DBA',
    'NDBM',
    'NCPAM',
    'CSMD',
    'NCCP',
  ];

  List<String> periods = [
    "Year 1 Sem 1",
    "Year 1 Sem 2",
    "Year 2 Sem 1",
    "Year 2 Sem 2",
  ];

  _registerStudent() async {
    //collect all inputs values should not be null

    String firstname = firstnameController.text;
    String surname = surnameController.text;
    String contact = contactController.text;

    Map<String, dynamic> pdts ={
      'firstname':firstname,
      'surname':surname,
      'contact':contact,
      'course':_selectedCourse,
      'duration':_selectedPeriod,
      'regno':''
    };

    db.insertStudent(pdts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "New Student Entry",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Student info *",
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            FormEditText(
                inputLabel: "firstname",
                textInputType: TextInputType.text,
                controller: firstnameController,
                isHidden: false),
            const SizedBox(
              height: 20,
            ),
            FormEditText(
                inputLabel: "surname",
                textInputType: TextInputType.text,
                controller: surnameController,
                isHidden: false),
            const SizedBox(
              height: 20,
            ),
            FormEditText(
                inputLabel: "contact",
                textInputType: TextInputType.number,
                controller: contactController,
                isHidden: false),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
                items: courses.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _selectedCourse = value!;
                  });
                },
                hint: Text(
                  "Select course",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
                )),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
                items: periods.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _selectedPeriod = value!;
                  });
                },
                hint: Text(
                  "Duration",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: FormButton(
                  btnLabel: "submit",
                  onBtnPressed: _registerStudent,
                  isOutlined: false, hasBorderRadius: false,),
            )
          ],
        ),
      ),
    );
  }
}
