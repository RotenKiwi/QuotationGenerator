import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/RoundedButton.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Gurkha/pdf.dart';
import 'package:sp_quotation/variables.dart' as vari;

import '../../Models/Gurkha/Gurkha 4X4 BSVI FM2.6CR2400WB(3+D).dart';

class Accessories extends StatefulWidget {
  const Accessories({Key? key}) : super(key: key);

  @override
  State<Accessories> createState() => _AccessoriesState();
}

var AccessoriesSelected = [
  false, //1
  false, //2
  false, //3
  false, //4
  false, //5
  false, //6
  false, //7
  false, //8
  false, //9
  false, //10
  false, //11
  false, //12
  false, //13
  false, //14
  false, //15
];

class _AccessoriesState extends State<Accessories> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: constraint.maxHeight * 0.07,
            ),
            topBar(text: 'Accessories', maxWidth: constraint.maxWidth),
            Text(
              'Including GST and Fitting charges',
              style: TextStyle(fontSize: constraint.maxWidth * 0.04),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                scrollbarOrientation: ScrollbarOrientation.left,
                radius: Radius.circular(20.0),
                thickness: 10,
                child: ListView.builder(
                    itemCount: Gurkha().Accessories.length,
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (AccessoriesSelected[index] == false) {
                                  AccessoriesSelected[index] = true;
                                  vari.accessoriesTotal +=
                                      Gurkha().AccessoriesPrice[index];
                                } else {
                                  AccessoriesSelected[index] = false;
                                  vari.accessoriesTotal -=
                                      Gurkha().AccessoriesPrice[index];
                                }
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraint.maxWidth * 0.05,
                                    vertical: constraint.maxWidth * 0.04),
                                decoration: BoxDecoration(
                                    color: AccessoriesSelected[index]
                                        ? Colors.greenAccent
                                        : Colors.white,
                                    border: Border.all(
                                      color: AccessoriesSelected[index]
                                          ? Colors.greenAccent
                                          : Colors.black,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Text(Gurkha().Accessories[index] + ' ')),
                          ));
                    }),
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            RoundedButton(
                text: 'Next',
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pdf()));
                },
                color: Colors.black,
                textColor: Colors.white,
                length: 0.85),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
          ],
        ),
      );
    });
  }
}
