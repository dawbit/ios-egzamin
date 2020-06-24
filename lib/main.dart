import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:iosegzamin/screens/main_content.dart';
import 'package:iosegzamin/blocs/example_bloc.dart';
import 'package:iosegzamin/repositories/example_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: _blocs,
      dependencies: _dependencies,
      child: MaterialApp(
        title: 'iOS Egzamin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainContent(),
      ),
    );
  }

  List<Bloc> get _blocs =>
      [
        Bloc((i) => ExampleBloc(i.get()))
      ]; // Block

  List<Dependency> get _dependencies =>
      [
        Dependency((_) => ExampleRepository())
      ]; // Dependency

}