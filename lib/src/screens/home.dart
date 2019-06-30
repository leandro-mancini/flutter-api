import 'package:flutter/material.dart';
import 'package:flutter_api/src/models/beer.dart';
import 'package:flutter_api/src/repository/beer_repository.dart';
import 'package:flutter_api/src/widgets/beer_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Beer> _beers = <Beer>[];

  @override
  void initState() {
    super.initState();

    listenForBeers();
  }

  void listenForBeers() async {
    final Stream<Beer> stream = await getBeer();

    stream.listen((Beer beer) => {
      setState(() => {
        _beers.add(beer)
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Beers'),
      ),
      body: ListView.builder(
        itemCount: _beers.length,
        itemBuilder: (context, index) => BeerTile(_beers[index]),
      ),
    );
  }
}