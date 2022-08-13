import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tyba_challenge/models/detail_comic_model.dart';
import 'package:tyba_challenge/models/university_model.dart';

class ComicsProvider {
  String _apikey = '2819db11db4cc57354bf5fcc462d4a7afbdb5225';
  String _url = 'comicvine.gamespot.com/api';

  Future<List<Result>?> getComics() async {
    final response = await http.get(Uri.parse(
        'https://comicvine.gamespot.com/api/issues/?api_key=$_apikey&format=json'));
    if (response.statusCode == 200) {
      var getResponse = Response.fromJson(json.decode(response.body));
      return getResponse.results;
    } else {
      throw Exception('Fallo');
    }
  }

  Future<ResultsDetail?> getComicsDetails(String comicId) async {
    final response =
        await http.get(Uri.parse('$comicId?api_key=$_apikey&format=json'));
    if (response.statusCode == 200) {
      var getResponse = Detail.fromJson(json.decode(response.body));
      return getResponse.results;
    } else {
      throw Exception('Fallo');
    }
  }

  Future<ResultsDetail?> searchComic(String query) async {
    final response = await http.get(Uri.parse(
        'https://comicvine.gamespot.com/api/issues/?api_key=$_apikey&format=json&query=$query'));
    if (response.statusCode == 200) {
      var getResponse = Detail.fromJson(json.decode(response.body));
      return getResponse.results;
    } else {
      throw Exception('Fallo');
    }
  }
}
