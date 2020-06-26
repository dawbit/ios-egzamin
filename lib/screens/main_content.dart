import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:iosegzamin/blocs/example_bloc.dart';
import 'package:iosegzamin/models/example_response.dart';
import 'package:iosegzamin/screens/example_details.dart';

import 'dart:convert';
import 'package:crypto/crypto.dart';

class MainContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
  TextEditingController _searchController;
  TextEditingController _searchController2;
  ExampleBloc _exampleBloc;
  StreamSubscription _exampleSubscription;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController2 = TextEditingController();
    _exampleBloc = BlocProvider.getBloc();
    _exampleSubscription = _exampleBloc.exampleObservable.listen(_navigateToDetails);
  }

  @override
  void dispose() {
    super.dispose();
    _exampleSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examplepedia app'),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Imie',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: _searchController2,
                  decoration: InputDecoration(
                    hintText: 'Nazwisko',
                  ),
                ),

              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _exampleBloc.getExampleForName(generateMd5(_searchController2.text + " " + _searchController.text));
                print(generateMd5(_searchController2.text + " " + _searchController.text));
              },
            )
          ],
        ),
      ),
    );
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  void _navigateToDetails(ExampleResponse example) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExampleDetailsScreen(example)));
  }
}
