import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iosegzamin/blocs/example_bloc.dart';
import 'package:iosegzamin/models/example_response.dart';
import 'package:iosegzamin/screens/example_details.dart';

class MainContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
  TextEditingController _searchController;
  ExampleBloc _exampleBloc;
  StreamSubscription _exampleSubscription;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
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
                    hintText: 'Search by model...',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _exampleBloc.getExampleForName(_searchController.text);
//                print(_exampleBloc.getExampleForName(_searchController.text));
              },
            )
          ],
        ),
      ),
    );
  }

  void _navigateToDetails(ExampleResponse example) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExampleDetailsScreen(example)));
  }
}
