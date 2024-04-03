import 'dart:async';
import 'package:e_czane/dialogs/image_picker_dialog.dart';
import 'package:e_czane/services/gemini.dart';
import 'package:e_czane/style/color.dart';
import 'package:e_czane/style/text_sytle.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneSearchPage extends StatefulWidget {
  const EczaneSearchPage({super.key});

  @override
  State<EczaneSearchPage> createState() => _EczaneSearchPageState();
}

class _EczaneSearchPageState extends State<EczaneSearchPage> {
  final TextEditingController searchController = TextEditingController();
  Future<String?> response = Future.value("İlaç arayın");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        appBar: EczaneAppbar(
          backButtonPressed: () {
            Navigator.popAndPushNamed(context, '/MyHomePage');
          },
        ),
        widget: Column(
          children: [
            const SizedBox(height: 100),
            Stack(alignment: Alignment.center, children: [
              Container(
                width: 340,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: eczaneLightGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EczaneTextField(
                    controller: searchController,
                    hint: "Search",
                    width: 250,
                    height: 35,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        response = getGeminiData(searchController.text);
                      });
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) =>
                                ImagePickerDialog(context)).then((value) {
                          setState(() {
                            if (value != null) {
                              response = getGeminiData(value!);
                            }
                          });
                        });
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                      ))
                ],
              ),
            ]),
            SizedBox(
              height: 500,
              child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: response,
                      initialData: "İlaç arayın",
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 1.3,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: eczaneWhite.withOpacity(0.8),
                            ),
                            child: Text(
                              "${snapshot.data}",
                              style: blackTextStyleMid,
                            ),
                          );
                        } else {
                          return const Text("Bir hata oluştu");
                        }
                      })),
            )
          ],
        ));
  }
}
