import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iosegzamin/models/example_response.dart';
import 'package:iosegzamin/repositories/example_repository.dart';

class ExampleBloc extends BlocBase {
  final ExampleRepository _exampleRepository;

  ExampleBloc(this._exampleRepository);

  BehaviorSubject<ExampleResponse> _exampleSubject = BehaviorSubject();
  Stream<ExampleResponse> get exampleObservable => _exampleSubject.stream;

  BehaviorSubject<bool> _loadingExampleSubject = BehaviorSubject();
  Stream<bool> get loadingExampleObservable => _loadingExampleSubject.stream;

  Future getExampleForName(String name) async {
    _loadingExampleSubject.add(true);
    _exampleRepository.getExampleForName(name)
        .then(_onExampleSuccess)
        .catchError(_onExampleError);
  }

  Future _onExampleSuccess(ExampleResponse example) async {
    _loadingExampleSubject.add(false);
    _exampleSubject.add(example);
  }

  Future _onExampleError(e) async {
    _loadingExampleSubject.add(false);
    _exampleSubject.addError(e);
  }

  @override
  void dispose() {
    super.dispose();
    _exampleSubject.close();
    _loadingExampleSubject.close();
  }
}
