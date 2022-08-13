import 'package:flutter/material.dart';
import 'package:tyba_challenge/models/detail_comic_model.dart';
import 'package:tyba_challenge/providers/comi_provider.dart';
import 'package:tyba_challenge/search/search_delegate.dart';
import 'package:tyba_challenge/widgets/detail_widget.dart';

class ComicDetailsPage extends StatelessWidget {
  final String comicId;
  final comicProvider = ComicsProvider();

  ComicDetailsPage({required this.comicId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: ComicSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
          centerTitle: true,
          title: Text('Vintage comic', style: TextStyle(fontSize: 28)),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder<ResultsDetail?>(
            future: comicProvider.getComicsDetails(comicId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return DetailWidget(comic: snapshot.data);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
