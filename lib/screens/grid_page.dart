import 'package:flutter/material.dart';
import 'package:tyba_challenge/models/university_model.dart';
import 'package:tyba_challenge/providers/comi_provider.dart';
import 'package:tyba_challenge/widgets/grid_view_widget.dart';

class GridPage extends StatelessWidget {
  final comicProvider = ComicsProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>?>(
        future: comicProvider.getComics(),
        builder: (BuildContext context, AsyncSnapshot<List<Result>?> snapshot) {
          if (snapshot.hasData) {
            return GridWidget(comics: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
