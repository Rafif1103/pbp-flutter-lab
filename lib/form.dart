import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/result.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class Data {
    static int _counter = 0;
    static List<List<String>> _dataSaved = [];
    static int get counter => _counter;
    static List<List<String>> get dataSaved => _dataSaved;

}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();
    final String dropdownLabel = "Pilih Jenis";
    String _judul = "";
    String _tipeBudget = "Pemasukan";
    int _nominal = 0;
    List<String> listTipeBudget = ["Pilih Jenis", "Pemasukan", "Pengeluaran"];


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Tambah Budget'),
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
            body: Form (
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      children: [
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Judul",
                                      //labelText: "Nama Lengkap",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          _judul = value!;
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                      setState(() {
                                          _judul = value!;
                                          Data._counter++;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Field judul tidak boleh kosong!';
                                      }
                                      return null;
                                  },
                              ),
                          ),

                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Nominal",
                                      //labelText: "Nama Lengkap",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                    ],
                                  
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                         _nominal = int.parse(value!);
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                      setState(() {
                                         _nominal = int.parse(value!);
                                         
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Field nominal tidak boleh kosong!';
                                      }
                                      return null;
                                  },
                              ),
                          ),
                          Center(
                          child: ListTile(
                             
                              trailing: DropdownButton(
                                  alignment: AlignmentDirectional.topEnd,
                                  value: dropdownLabel,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: listTipeBudget.map((String items) {  
                                  return DropdownMenuItem(
                                      child: Text(items, textAlign: TextAlign.center),
                                      value: items,
                                  );
                                  
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                  setState(() {
                                      _tipeBudget = newValue!;
                                  });
                                  },
                              ),
                            ),
                          ),

                          TextButton(
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Data._dataSaved.add([_judul, _nominal.toString(), _tipeBudget]);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15,
                                      child: Container(
                                        child: ListView(
                                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            const Center(child: Text('Informasi Data')),
                                            const SizedBox(height: 20),
                                            // TODO: Munculkan informasi yang didapat dari form
                                            const Text(
                                              'Data berhasil ditambahkan',
                                              textAlign: TextAlign.center,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Kembali'),
                                            ), 
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                      ],
                  ),
                ),
              ),
            )
        );
    }
}