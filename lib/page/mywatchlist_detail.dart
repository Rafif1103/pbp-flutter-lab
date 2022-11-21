import 'package:flutter/material.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:counter_7/model/mywatchlist.dart';


class MyWatchListDetails extends StatefulWidget {
    const MyWatchListDetails({Key? key}) : super(key: key);

    @override
    State<MyWatchListDetails> createState() => MyWatchListStateDetails();
}

class MyWatchListStateDetails extends State<MyWatchListDetails> {
    Fields current_fields = Details.test;
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List Details'),
        ),
        body: Column(
          children: <Widget>[
              
              // Padding(
                
              //   padding: const EdgeInsets.all(10.0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: <Widget>[
              //       Text(
              //         current_fields.filmTitle,
              //         textAlign: TextAlign.center,
              //         style: const TextStyle(
              //           fontWeight: FontWeight.bold, 
              //           fontSize: 30,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Align(
                      alignment: Alignment.center,
                      child: Column(
                          children: <Widget>[
                            Text(
                              current_fields.filmTitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Release Date: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: current_fields.filmReleaseDate),
                          ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Rating: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: current_fields.filmRating.toString()),
                          ]
                        ),
                      ),
                    ),
                    if(current_fields.isWatched == "Yes")...[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Status: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text:'watched'),
                            ]
                          ),
                        ),
                      ),
                    ]
                    else...[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          children: <TextSpan>[
                            TextSpan(
                            text: 'Status: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'not watched'),
                          ]
                        ),
                      ),
                    ),
                  ],
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Review: ", 
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      current_fields.filmReview,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      );
    }
}