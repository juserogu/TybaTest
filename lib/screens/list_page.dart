import 'package:flutter/material.dart';
import 'package:tyba_challenge/models/university_model.dart';
import 'package:tyba_challenge/providers/comi_provider.dart';
import 'package:tyba_challenge/widgets/list_view_widget.dart';

class Listpage extends StatelessWidget {
  final comicProvider = ComicsProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>?>(
        future: comicProvider.getComics(),
        builder: (BuildContext context, AsyncSnapshot<List<Result>?> snapshot) {
          if (snapshot.hasData) {
            return ListScroll(comics: snapshot.data!);
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
