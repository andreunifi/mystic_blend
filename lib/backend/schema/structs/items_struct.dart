// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends FFFirebaseStruct {
  ItemsStruct({
    String? name,
    String? description,
    String? specifications,
    DocumentReference? item,
    DocumentReference? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _specifications = specifications,
        _item = item,
        _user = user,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  set specifications(String? val) => _specifications = val;
  bool hasSpecifications() => _specifications != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  set item(DocumentReference? val) => _item = val;
  bool hasItem() => _item != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        specifications: data['specifications'] as String?,
        item: data['item'] as DocumentReference?,
        user: data['user'] as DocumentReference?,
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ItemsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'specifications': _specifications,
        'item': _item,
        'user': _user,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'specifications': serializeParam(
          _specifications,
          ParamType.String,
        ),
        'item': serializeParam(
          _item,
          ParamType.DocumentReference,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        specifications: deserializeParam(
          data['specifications'],
          ParamType.String,
          false,
        ),
        item: deserializeParam(
          data['item'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Items'],
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        name == other.name &&
        description == other.description &&
        specifications == other.specifications &&
        item == other.item &&
        user == other.user;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, description, specifications, item, user]);
}

ItemsStruct createItemsStruct({
  String? name,
  String? description,
  String? specifications,
  DocumentReference? item,
  DocumentReference? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsStruct(
      name: name,
      description: description,
      specifications: specifications,
      item: item,
      user: user,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsStruct? updateItemsStruct(
  ItemsStruct? items, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    items
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsStructData(
  Map<String, dynamic> firestoreData,
  ItemsStruct? items,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (items == null) {
    return;
  }
  if (items.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && items.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsData = getItemsFirestoreData(items, forFieldValue);
  final nestedData = itemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = items.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsFirestoreData(
  ItemsStruct? items, [
  bool forFieldValue = false,
]) {
  if (items == null) {
    return {};
  }
  final firestoreData = mapToFirestore(items.toMap());

  // Add any Firestore field values
  items.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsListFirestoreData(
  List<ItemsStruct>? itemss,
) =>
    itemss?.map((e) => getItemsFirestoreData(e, true)).toList() ?? [];
