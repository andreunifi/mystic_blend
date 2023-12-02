import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "isBoosted" field.
  bool? _isBoosted;
  bool get isBoosted => _isBoosted ?? false;
  bool hasIsBoosted() => _isBoosted != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "LuogoVendita" field.
  LatLng? _luogoVendita;
  LatLng? get luogoVendita => _luogoVendita;
  bool hasLuogoVendita() => _luogoVendita != null;

  // "createdUser" field.
  DocumentReference? _createdUser;
  DocumentReference? get createdUser => _createdUser;
  bool hasCreatedUser() => _createdUser != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "CategoryIndex" field.
  int? _categoryIndex;
  int get categoryIndex => _categoryIndex ?? 0;
  bool hasCategoryIndex() => _categoryIndex != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _isBoosted = snapshotData['isBoosted'] as bool?;
    _category = snapshotData['Category'] as String?;
    _luogoVendita = snapshotData['LuogoVendita'] as LatLng?;
    _createdUser = snapshotData['createdUser'] as DocumentReference?;
    _image = snapshotData['Image'] as String?;
    _categoryIndex = castToType<int>(snapshotData['CategoryIndex']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  DateTime? createdAt,
  int? quantity,
  bool? isBoosted,
  String? category,
  LatLng? luogoVendita,
  DocumentReference? createdUser,
  String? image,
  int? categoryIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'created_at': createdAt,
      'quantity': quantity,
      'isBoosted': isBoosted,
      'Category': category,
      'LuogoVendita': luogoVendita,
      'createdUser': createdUser,
      'Image': image,
      'CategoryIndex': categoryIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.specifications == e2?.specifications &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.quantity == e2?.quantity &&
        e1?.isBoosted == e2?.isBoosted &&
        e1?.category == e2?.category &&
        e1?.luogoVendita == e2?.luogoVendita &&
        e1?.createdUser == e2?.createdUser &&
        e1?.image == e2?.image &&
        e1?.categoryIndex == e2?.categoryIndex;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.specifications,
        e?.price,
        e?.createdAt,
        e?.quantity,
        e?.isBoosted,
        e?.category,
        e?.luogoVendita,
        e?.createdUser,
        e?.image,
        e?.categoryIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
