import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/FormButton.dart';
import '../common/FormEditText.dart';
import '../localDB/sqliteservice.dart';

class AddFees extends StatefulWidget {
  const AddFees(
      {super.key,
      required this.studentId,
      required this.name,
      required this.course});
  final int studentId;
  final String name;
  final String course;

  @override
  State<AddFees> createState() => _AddFeesState();
}

class _AddFeesState extends State<AddFees> {
  bool isPaymentTabOpened = false;

  reloadPage() {
    setState(() {
      isPaymentTabOpened = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Fees",
            style: GoogleFonts.montserrat(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text("Student Name : ",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(widget.name),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Course : ",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(widget.course),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Tuition Paid : ",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const Text("6570000/="),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormButton(
                      btnLabel: "View Record",
                      onBtnPressed: () {
                        setState(() {
                          isPaymentTabOpened = false;
                        });
                      },
                      isOutlined: isPaymentTabOpened,
                      hasBorderRadius: true,
                    ),
                    FormButton(
                      btnLabel: "Payment",
                      onBtnPressed: () {
                        setState(() {
                          isPaymentTabOpened = true;
                        });
                      },
                      isOutlined: !isPaymentTabOpened,
                      hasBorderRadius: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            isPaymentTabOpened
                ? PayFees(
                    studentId: widget.studentId,
                    reloadPage: reloadPage,
                  )
                : ViewRecord(student_id: widget.studentId),
          ],
        ),
      ),
    );
  }
}

class ViewRecord extends StatefulWidget {
  const ViewRecord({super.key, required this.student_id});
  final int student_id;

  @override
  State<ViewRecord> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  DatabaseHelper db = DatabaseHelper();
  List record = [];
  getStudentRecord() {
    db.getStudentPaymentRecord(widget.student_id).then((val) {
      setState(() {
        record = val;
      });
    });
  }

  @override
  void initState() {
    getStudentRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: record.isEmpty
            ? const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              )
            : SizedBox(
                height: 1000,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Paid ${record[index]["fee"]}",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid: ${record[index]["amount_paid"]} /=",
                              style: GoogleFonts.montserrat()),
                          Text(
                            "Date: 2/11/2024",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: record.length,
                )));
  }
}

class PayFees extends StatefulWidget {
  const PayFees({super.key, required this.studentId, required this.reloadPage});
  final int studentId;
  final VoidCallback reloadPage;

  @override
  State<PayFees> createState() => _PayFeesState();
}

class _PayFeesState extends State<PayFees> {
  final TextEditingController _amountPaid = TextEditingController();
  String feePaid = "";

  DatabaseHelper db = DatabaseHelper();

  payFeeFunction() {
    Map<String, dynamic> pdts = {
      "student_id": widget.studentId,
      "amount_paid": int.parse(_amountPaid.text),
      "fee": feePaid,
      "user_id": 1
    };

    if (_amountPaid.text.isNotEmpty) {
      db.insertFee(pdts).then((value) {
        widget.reloadPage();
        print(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    List<String> fees = [
      "Tuition",
      "Guild fee",
      "Ream of paper",
      "Development fees",
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0))),
              ),
              items: fees.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  feePaid = value!;
                });
              },
              hint: Text(
                "Which fee",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
              )),
          const SizedBox(
            height: 20,
          ),
          FormEditText(
              controller: _amountPaid,
              inputLabel: "Amount",
              isHidden: false,
              textInputType: TextInputType.number),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: _width,
            height: 50,
            child: FormButton(
              btnLabel: "Add fees",
              hasBorderRadius: false,
              isOutlined: false,
              onBtnPressed: payFeeFunction,
            ),
          )
        ],
      ),
    );
  }
}
