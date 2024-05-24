import 'package:another_flushbar/flushbar.dart';
import 'package:e_czane/constants.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_numericfield.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  List<Medicine> medicines = [];
  void _addMedicine() async {
    final medicine = await showDialog<Medicine>(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        int repeat = 1;
        List<TimeOfDay> times = [
          TimeOfDay.now(),
        ];
        String category = '';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('İlaç Ekle'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    EczaneTextField(
                        onChanged: (value) {
                          name = value;
                        },
                        hint: 'İlaç Adı',
                        width: DeviceSize.width * 0.5,
                        height: DeviceSize.height * 0.05),
                    eczaneSmallPadding,
                    const Text('Tekrar Sayısı',
                        style: TextStyle(fontFamily: 'inter', fontSize: 20)),
                    EczaneNumericfield(onChanged: (value) {
                      repeat = value;
                      setState(() {
                        times = List<TimeOfDay>.generate(
                            repeat, (index) => TimeOfDay.now());
                      });
                    }),
                    eczaneSmallPadding,
                    Column(
                        children: List.generate(repeat, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'İlacın Zamanı ${index + 1}: ${times[index].format(context)}'),
                          IconButton(
                            icon: const Icon(Icons.access_time),
                            onPressed: () async {
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: times[index],
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  times[index] = pickedTime;
                                });
                              }
                            },
                          ),
                        ],
                      );
                    })),
                    EczaneTextField(
                        onChanged: (value) {
                          category = value;
                        },
                        hint: 'Kategori',
                        width: DeviceSize.width * 0.5,
                        height: DeviceSize.height * 0.05),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('İptal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                    child: const Text('Ekle'),
                    onPressed: () {
                      if (name.isNotEmpty && repeat > 0) {
                        Navigator.of(context).pop(
                          Medicine(
                            name: name,
                            repeat: repeat,
                            times: times,
                            category: category,
                          ),
                        );
                      } else if (name.isEmpty) {
                        Flushbar(
                          message: 'İlaç adı boş olamaz',
                          duration: const Duration(seconds: 3),
                        ).show(context);
                      }
                    }),
              ],
            );
          },
        );
      },
    );

    if (medicine != null) {
      setState(() {
        medicines.add(medicine);
      });
    }
  }

  void _removeMedicine(int index) {
    setState(() {
      medicines.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addMedicine,
        child: const Icon(Icons.add),
      ),
      appBar: EczaneAppbar(
        backButtonPressed: () {
          Navigator.popAndPushNamed(context, '/MyHomePage');
        },
      ),
      widget: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(medicine.name),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Tekrar Sayısı: ${medicine.repeat},'),
                        ...medicine.times.map(
                          (time) => Text('Zaman: ${time.format(context)}'),
                        ),
                        Text('Kategori: ${medicine.category}'),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('İlaç Sil'),
                                    content: Text(
                                        '${medicine.name} ilacını silmek istediğinizden emin misiniz?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('İptal'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _removeMedicine(index);
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Sil'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                          child: const Text('Sil')),
                      TextButton(
                          onPressed: () {}, child: const Text('Düzenle')),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Kapat'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(medicine.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tekrar Sayısı: ${medicine.repeat},'),
                    ...medicine.times
                        .map((time) => Text('Zaman: ${time.format(context)}')),
                    Text('Kategori: ${medicine.category}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
