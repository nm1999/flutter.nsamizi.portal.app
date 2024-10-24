import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/common/FormButton.dart';

import '../../common/FormEditText.dart';

class Expenditurescreen extends StatefulWidget {
  const Expenditurescreen({super.key});

  @override
  State<Expenditurescreen> createState() => _ExpenditurescreenState();
}

class _ExpenditurescreenState extends State<Expenditurescreen> {
  final TextEditingController amountRemovedController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  List<String> students = [
    "Student 1",
    "Student 2",
    "Student 3",
    "Student 4",
    "Student 5",
    "Student 6",
    "Student 7",
  ];

  _submitExpense(){

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
                items: students.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  setState(() {});
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
              height:50,
              child: FormButton(btnLabel: "submit", onBtnPressed: _submitExpense, isOutlined: false))
          ],
        ),
      ),
    );
  }
}
