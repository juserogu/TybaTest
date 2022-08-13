import 'package:flutter/material.dart';
import 'package:tyba_challenge/models/detail_comic_model.dart';
import 'package:tyba_challenge/models/university_model.dart';
import 'package:tyba_challenge/providers/comi_provider.dart';

class ComicSearchDelegate extends SearchDelegate {
  final comicProvider = ComicsProvider();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
            child: Icon(
          Icons.book_outlined,
          color: Colors.grey,
          size: 130,
        )),
      );
    }
    return FutureBuilder(
      future: comicProvider.searchComic(query),
      builder: (BuildContext context, AsyncSnapshot<ResultsDetail?> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
                child: Icon(
              Icons.book_outlined,
              color: Colors.grey,
              size: 130,
            )),
          );
        }

        return Container();
      },
    );
  }
}
