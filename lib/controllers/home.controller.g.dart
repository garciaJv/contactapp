// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$showSearchAtom = Atom(name: '_HomeControllerBase.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$contactsAtom = Atom(name: '_HomeControllerBase.contacts');

  @override
  ObservableList<ContactModel> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<ContactModel> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_HomeControllerBase.search');

  @override
  Future search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic toggleSearch() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
contacts: ${contacts}
    ''';
  }
}
