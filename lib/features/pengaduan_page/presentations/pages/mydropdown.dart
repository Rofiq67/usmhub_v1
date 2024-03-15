import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? itemValue;
  List<String> listItem = [
    "One",
    "Two",
    "Three",
    "Four",
  ];

  String? pemainBaru;
  List<String> listPemain = [
    "Egy",
    "Witan",
    "Rafael",
    "Ragnar",
  ];

  String? motorBaru;
  List<String> listMotor = [
    "Beat",
    "Pcx",
    "Vario",
    "Scoopy",
    "Win 100",
    "Megapro",
    "Jupiter",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: DropdownButtonFormField(
                items: listItem.map(
                  (String valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    itemValue = newValue!;
                  });
                },
                value: itemValue,
                borderRadius: BorderRadius.circular(29),
                style: const TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
                hint: const Text('Tujuan wewenang :'),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Iconsax.signpost,
                    color: Color(0xff3E4095),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff3E4095), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff3E4095), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                ),
              ),
            ),

            //
            //dropdown pemain
            const SizedBox(height: 64),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(24),
                  value: pemainBaru,
                  hint: const Text('Pilih pemain baru :'),
                  items: listPemain.map((String newPlayer) {
                    return DropdownMenuItem(
                        value: newPlayer, child: Text(newPlayer));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      pemainBaru = value;
                    });
                  },
                ),
              ),
            ),

            //
            //
            //dropdown2 package
            const SizedBox(
              height: 64,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  iconStyleData: const IconStyleData(
                    iconSize: 24,
                    iconEnabledColor: Colors.brown,
                    iconDisabledColor: Colors.black,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 353,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    offset: const Offset(-10, -6),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  hint: const Row(
                    children: [
                      Icon(Iconsax.signpost),
                      SizedBox(
                        width: 16,
                      ),
                      Text('Pilih motor :'),
                    ],
                  ),
                  underline: Container(),
                  value: motorBaru,
                  items: listMotor.map((String newMotor) {
                    return DropdownMenuItem(
                      value: newMotor,
                      child: Text(newMotor),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      motorBaru = value;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
