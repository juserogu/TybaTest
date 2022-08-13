import 'package:flutter/material.dart';
import 'package:tyba_challenge/screens/grid_page.dart';
import 'package:tyba_challenge/screens/list_page.dart';
import 'package:tyba_challenge/search/search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text(
            'Vintange comics',
            style: TextStyle(fontSize: 28),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                  icon: Icon(
                Icons.grid_on,
              )),
              Tab(icon: Icon(Icons.menu)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[GridPage(), Listpage()],
        ),
      ),
    );
  }
}
