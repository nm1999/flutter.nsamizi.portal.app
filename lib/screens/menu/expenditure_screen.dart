import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/common/FormButton.dart';
import 'package:nsamiziportal/screens/home_screen.dart';
import '../../localDB/sqliteservice.dart';
import '../../common/FormEditText.dart';

class Expenditurescreen extends StatefulWidget {
  const Expenditurescreen({super.key});

  @override
  State<Expenditurescreen> createState() => _ExpenditurescreenState();
}

class _ExpenditurescreenState extends State<Expenditurescreen> {
  final TextEditingController amountRemovedController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  List students = [];
  List studentIds = [];
  late String selectedStudent;
  DatabaseHelper db = DatabaseHelper();

  _submitExpense() {
    String amountRemoved = amountRemovedController.text;
    String reason = reasonController.text;

    if (reason.isNotEmpty &&
        amountRemoved.isNotEmpty &&
        selectedStudent.isNotEmpty) {
      int index = students.indexOf(selectedStudent);

      Map<String, dynamic> exp = {
        'student_id': studentIds[index],
        'amount_removed': amountRemoved,
        'reason': reason,
        'user_id': 1
      };

      db.insertExpense(exp).then((res) {
        if (res > 0) {
          Get.to(const HomeScreen());
        } else {
          print("failed to insert data with response $res");
        }
      });
    }
  }

  getStudent() {
    db.getStudents().then((res) {
      for (var element in res) {
        String name = "${element['firstname']}  ${element['surname']}";
        studentIds.add(element["id"]);
        students.add(name);
      }
      //update the array
      setState(() {});
    });
  }

  @override
  void initState() {
    getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Expenditure",
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
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
                items: students.map<DropdownMenuItem>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedStudent = value;
                  });
                },
                hint: Text(
                  "Student",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
                )),
            const SizedBox(
              height: 10,
            ),
            FormEditText(
                inputLabel: "amount removed",
                textInputType: TextInputType.number,
                controller: amountRemovedController,
                isHidden: false),
            const SizedBox(
              height: 10,
            ),
            FormEditText(
                inputLabel: "Reason for removal",
                textInputType: TextInputType.text,
                controller: reasonController,
                isHidden: false),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                child: FormButton(
                    btnLabel: "submit",
                    onBtnPressed: _submitExpense,
                    isOutlined: false, hasBorderRadius: false,))
          ],
        ),
      ),
    );
  }
}
