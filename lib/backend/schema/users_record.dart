import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isVendor" field.
  bool? _isVendor;
  bool get isVendor => _isVendor ?? false;
  bool hasIsVendor() => _isVendor != null;

  // "favorites" field.
  List<String>? _favorites;
  List<String> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "Birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "isBoostedVendor" field.
  bool? _isBoostedVendor;
  bool get isBoostedVendor => _isBoostedVendor ?? false;
  bool hasIsBoostedVendor() => _isBoostedVendor != null;

  // "isPendingVendor" field.
  bool? _isPendingVendor;
  bool get isPendingVendor => _isPendingVendor ?? false;
  bool hasIsPendingVendor() => _isPendingVendor != null;

  // "VendorBio" field.
  String? _vendorBio;
  String get vendorBio => _vendorBio ?? '';
  bool hasVendorBio() => _vendorBio != null;

  // "IdCardURL" field.
  String? _idCardURL;
  String get idCardURL => _idCardURL ?? '';
  bool hasIdCardURL() => _idCardURL != null;

  // "VendorShopName" field.
  String? _vendorShopName;
  String get vendorShopName => _vendorShopName ?? '';
  bool hasVendorShopName() => _vendorShopName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isVendor = snapshotData['isVendor'] as bool?;
    _favorites = getDataList(snapshotData['favorites']);
    _name = snapshotData['Name'] as String?;
    _surname = snapshotData['Surname'] as String?;
    _birthday = snapshotData['Birthday'] as DateTime?;
    _isBoostedVendor = snapshotData['isBoostedVendor'] as bool?;
    _isPendingVendor = snapshotData['isPendingVendor'] as bool?;
    _vendorBio = snapshotData['VendorBio'] as String?;
    _idCardURL = snapshotData['IdCardURL'] as String?;
    _vendorShopName = snapshotData['VendorShopName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isVendor,
  String? name,
  String? surname,
  DateTime? birthday,
  bool? isBoostedVendor,
  bool? isPendingVendor,
  String? vendorBio,
  String? idCardURL,
  String? vendorShopName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isVendor': isVendor,
      'Name': name,
      'Surname': surname,
      'Birthday': birthday,
      'isBoostedVendor': isBoostedVendor,
      'isPendingVendor': isPendingVendor,
      'VendorBio': vendorBio,
      'IdCardURL': idCardURL,
      'VendorShopName': vendorShopName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isVendor == e2?.isVendor &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        e1?.name == e2?.name &&
        e1?.surname == e2?.surname &&
        e1?.birthday == e2?.birthday &&
        e1?.isBoostedVendor == e2?.isBoostedVendor &&
        e1?.isPendingVendor == e2?.isPendingVendor &&
        e1?.vendorBio == e2?.vendorBio &&
        e1?.idCardURL == e2?.idCardURL &&
        e1?.vendorShopName == e2?.vendorShopName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isVendor,
        e?.favorites,
        e?.name,
        e?.surname,
        e?.birthday,
        e?.isBoostedVendor,
        e?.isPendingVendor,
        e?.vendorBio,
        e?.idCardURL,
        e?.vendorShopName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
