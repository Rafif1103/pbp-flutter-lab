import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/result.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/mywatchlist_detail.dart';

class MyWatchListPage extends StatefulWidget {
    const MyWatchListPage({Key? key}) : super(key: key);

    @override
    MyWatchListState createState() => MyWatchListState();
}

class Details {
    static late Fields _test;
    static Fields get test => _test;
}

class MyWatchListState extends State<MyWatchListPage>{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
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
                // Route menu ke halaman result
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyResultPage()),
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman My Watch List
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                  children: const [
                      Text(
                      "Belum ada film :D",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                      ),
                      SizedBox(height: 8),
                  ],
                );
            } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0
                          )
                        ]
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              Details._test = snapshot.data![index].fields;
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MyWatchListDetails()),
                                    );
                            },
                            child: Column(
                              children:[
                                Text(
                                  "${snapshot.data![index].fields.filmTitle}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              ),
                               const SizedBox(height: 4),],
                            ),
                          ),
                        ],
                    ),
                  )
                );
            }
          }
        }
      )
    );
  }

  Future<List<MyWatchList>> fetchMyWatchList() async {
        var url = Uri.parse('https://tugas-2-pbp-rafif.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object MyWatchList
        List<MyWatchList> listMyWatchList = [];
        for (var d in data) {
          if (d != null) {
              listMyWatchList.add(MyWatchList.fromJson(d));
          }
        }

        return listMyWatchList;
    }
}