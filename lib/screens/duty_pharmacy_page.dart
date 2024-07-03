import 'dart:async';
import 'package:e_czane/constants.dart';
import 'package:e_czane/services/duty_pharmacy_service.dart';
import 'package:e_czane/style/color.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneDutyPage extends StatefulWidget {
  const EczaneDutyPage({super.key});

  @override
  State<EczaneDutyPage> createState() => _EczaneDutyPageState();
}

class _EczaneDutyPageState extends State<EczaneDutyPage> {
  final TextEditingController ilController = TextEditingController();
  final TextEditingController ilceController = TextEditingController();
  Future<List<Pharmacy>> futurePharmacies = Future.value([]);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return EczaneScaffold(
        appBar: EczaneAppbar(
          backButtonPressed: () {
            Navigator.popAndPushNamed(context, '/MyHomePage');
          },
        ),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: DeviceSize.height * 0.1),
            Stack(alignment: Alignment.center, children: [
              Container(
                width: DeviceSize.width * 0.9,
                height: DeviceSize.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: eczaneLightGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EczaneTextField(
                    controller: ilController,
                    hint: "İl",
                    width: DeviceSize.width * 0.4,
                    height: DeviceSize.height * 0.05,
                  ),
                  EczaneTextField(
                    width: DeviceSize.width * 0.4,
                    height: DeviceSize.height * 0.05,
                    controller: ilceController,
                    hint: "İlçe",
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        futurePharmacies = getDutyPharmacyData(
                            ilController.text, ilceController.text, context);
                      });
                    },
                    icon: const Icon(Icons.search_rounded),
                  )
                ],
              ),
            ]),
            SizedBox(
              height: DeviceSize.height * 0.3,
              child: FutureBuilder<List<Pharmacy>>(
                  future: futurePharmacies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index].name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Addres: ${snapshot.data![index].address}'),
                                  Text(
                                      'Telefon: ${snapshot.data![index].phone}'),
                                  Text(
                                      'Lokasyon: ${snapshot.data![index].loc}'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}'));
                    }
                    return const Text('Bir hata oluştu');
                  }),
            )
          ],
        ));
  }
}
