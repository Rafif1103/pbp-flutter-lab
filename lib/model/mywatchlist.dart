// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
    MyWatchList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.isWatched,
        required this.filmTitle,
        required this.filmRating,
        required this.filmReleaseDate,
        required this.filmReview,
    });

    String isWatched;
    String filmTitle;
    double filmRating;
    String filmReleaseDate;
    String filmReview;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        isWatched: json["is_watched"],
        filmTitle: json["film_title"],
        filmRating: json["film_rating"].toDouble(),
        filmReleaseDate: json["film_release_date"],
        filmReview: json["film_review"],
    );

    Map<String, dynamic> toJson() => {
        "is_watched": isWatched,
        "film_title": filmTitle,
        "film_rating": filmRating,
        "film_release_date": filmReleaseDate,
        "film_review": filmReview,
    };
}

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues = EnumValues({
    "mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
