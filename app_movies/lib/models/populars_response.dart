// To parse this JSON data, do
//
//     final popularRespose = popularResposeFromMap(jsonString);

import 'dart:convert';
import 'package:app_movies/models/models.dart';


class PopularsResponse {
    PopularsResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularsResponse.fromJson(String str) => PopularsResponse.fromMap(json.decode(str));

  

    factory PopularsResponse.fromMap(Map<String, dynamic> json) => PopularsResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    
}

