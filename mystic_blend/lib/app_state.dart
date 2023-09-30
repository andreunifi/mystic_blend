import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorites = prefs
              .getStringList('ff_favorites')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _favorites;
    });
    _safeInit(() {
      _adMobCounter = prefs.getInt('ff_adMobCounter') ?? _adMobCounter;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _category = '';
  String get category => _category;
  set category(String _value) {
    _category = _value;
  }

  String _searchtext = '';
  String get searchtext => _searchtext;
  set searchtext(String _value) {
    _searchtext = _value;
  }

  List<ItemsStruct> _favorites = [];
  List<ItemsStruct> get favorites => _favorites;
  set favorites(List<ItemsStruct> _value) {
    _favorites = _value;
    prefs.setStringList(
        'ff_favorites', _value.map((x) => x.serialize()).toList());
  }

  void addToFavorites(ItemsStruct _value) {
    _favorites.add(_value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.serialize()).toList());
  }

  void removeFromFavorites(ItemsStruct _value) {
    _favorites.remove(_value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFavorites(int _index) {
    _favorites.removeAt(_index);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.serialize()).toList());
  }

  void updateFavoritesAtIndex(
    int _index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    _favorites[_index] = updateFn(_favorites[_index]);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFavorites(int _index, ItemsStruct _value) {
    _favorites.insert(_index, _value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.serialize()).toList());
  }

  int _adMobCounter = 0;
  int get adMobCounter => _adMobCounter;
  set adMobCounter(int _value) {
    _adMobCounter = _value;
    prefs.setInt('ff_adMobCounter', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
