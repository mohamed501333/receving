// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jason_company/app/validation.dart';
import 'package:jason_company/ui/commen/textformfield.dart';
import 'package:jason_company/ui/theConstants/constants_viewmoder.dart';

class ChipsForBlocks extends StatelessWidget {
  ChipsForBlocks({super.key});
  ConstantsViewModel vm = ConstantsViewModel();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    scrollable: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: SizedBox(
                      height: 600,
                      child: Form(
                        key: vm.formKey,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.blue[900],
                              height: 30,
                              child: const Center(
                                child: Text(
                                  'اضافة ثابت جديد ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "الكثافه",
                                      controller: vm.densitycontroller,
                                      validator: Validation.validateothers,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "اللون",
                                      keybordtupe: TextInputType.text,
                                      controller: vm.colercontroller,
                                      validator: Validation.validateothers,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "الكود ",
                                      controller: vm.codecontroller,
                                      validator: Validation.validateothers,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "رقم البلوك",
                                      controller: vm.blocknumbercontroller,
                                      validator: Validation.validateothe,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "العرض",
                                      controller: vm.widthcontroller,
                                      validator: Validation.validateothers,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "الطول ",
                                      controller: vm.lenthcontroller,
                                      validator: Validation.validateothers,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "النوع",
                                      keybordtupe: TextInputType.name,
                                      controller: vm.typecontroller,
                                      validator: Validation.validateothers,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "الارتفاع",
                                      controller: vm.hightncontroller,
                                      validator: Validation.validateothers,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "المقص ",
                                      controller: vm.scissorcontroller,
                                      validator: Validation.validateothe,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .23,
                                      hint: "العنوان",
                                      keybordtupe: TextInputType.name,
                                      controller: vm.tiitlecontroller,
                                      validator: Validation.validateothers,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      onPressed: () {
                                        vm.addchipblock(context);
                                      },
                                      child: const Text('أضافه')),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('الغاء')),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        icon: const Icon(Icons.add));
  }
}

class ChipsForH123 extends StatelessWidget {
  ChipsForH123({super.key});
  ConstantsViewModel vm = ConstantsViewModel();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    scrollable: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: SizedBox(
                      height: 200,
                      child: Form(
                        key: vm.formKey,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.blue[900],
                              height: 30,
                              child: const Center(
                                child: Text(
                                  ' عمل اختصار جديد ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      hint: "الارتفاع",
                                      controller: vm.hightncontroller,
                                      validator: Validation.validateothers,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      hint: "العرض",
                                      controller: vm.widthcontroller,
                                      validator: Validation.validateothers,
                                    ),
                                    CustomTextFormField(
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      hint: "الطول ",
                                      controller: vm.lenthcontroller,
                                      validator: Validation.validateothers,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      onPressed: () {
                                        vm.addfractionchip(context);
                                      },
                                      child: const Text('أضافه')),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('الغاء')),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        icon: const Icon(Icons.add));
  }
}
