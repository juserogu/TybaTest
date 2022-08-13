import 'package:flutter/material.dart';
import 'package:tyba_challenge/models/university_model.dart';
import 'package:tyba_challenge/screens/comic_details_page.dart';

class GridWidget extends StatelessWidget {
  List<Result> comics;

  GridWidget({required this.comics});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 4,
            children: comics
                .map((e) => _ItemList(
                      result: e,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComicDetailsPage(
                                      comicId: e.apiDetailUrl!,
                                    )));
                      },
                    ))
                .toList()));
  }
}

class _ItemList extends StatelessWidget {
  final Result result;
  final GestureTapCallback onTap;
  _ItemList({required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        child: Container(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            children: <Widget>[
              Hero(
                tag: result.id!,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    width: 110,
                    height: 100,
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(
                      result.image!.originalUrl!,
                    )),
              ),
              Text(
                result.name ?? 'No name',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Text('#${result.issueNumber}'),
              Text(
                result.dateAdded ?? 'No date',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
