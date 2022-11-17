import 'package:flutter/material.dart' hide Action;
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';


class MyResultPage extends StatefulWidget {
    const MyResultPage({super.key});

    @override
    State<MyResultPage> createState() => _MyResultPageState();
}

class _MyResultPageState extends State<MyResultPage> {
    List<List<String>> dataSekarang = Data.dataSaved;
    int counter = Data.counter;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),
            drawer: Drawer(
                child: Column(
                  children: [
                    // Menambahkan clickable menu
                    ListTile(
                      title: const Text('counter_7'),
                      onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Tambah Budget'),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyFormPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Data Budget'),
                      onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyResultPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            body: Form(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: const Text('Data Budget')),

                        for (int i = 0; i < counter; i++) ListView(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: [
                            SizedBox(height: 20),
                            // TODO: Munculkan informasi yang didapat dari form
                            Text( 
                              dataSekarang[i][0],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              dataSekarang[i][1],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              dataSekarang[i][2],
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
        );
    }
}