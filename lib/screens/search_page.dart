import 'package:e_czane/services/gemini.dart';
import 'package:e_czane/style/color.dart';
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
  dynamic response;
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
                    onPressed: () async {
                      response = await getGeminiData(searchController.text);
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                      ))
                ],
              ),
            ]),
            SingleChildScrollView(
                child: FutureBuilder(
                    future: response,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(snapshot.data.toString());
                      }
                    }))
          ],
        ));
  }
}
