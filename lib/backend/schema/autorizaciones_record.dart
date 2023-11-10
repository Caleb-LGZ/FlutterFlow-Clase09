import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AutorizacionesRecord extends FirestoreRecord {
  AutorizacionesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "firma" field.
  String? _firma;
  String get firma => _firma ?? '';
  bool hasFirma() => _firma != null;

  void _initializeFields() {
    _firma = snapshotData['firma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('autorizaciones');

  static Stream<AutorizacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AutorizacionesRecord.fromSnapshot(s));

  static Future<AutorizacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AutorizacionesRecord.fromSnapshot(s));

  static AutorizacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AutorizacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AutorizacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AutorizacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AutorizacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AutorizacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAutorizacionesRecordData({
  String? firma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'firma': firma,
    }.withoutNulls,
  );

  return firestoreData;
}

class AutorizacionesRecordDocumentEquality
    implements Equality<AutorizacionesRecord> {
  const AutorizacionesRecordDocumentEquality();

  @override
  bool equals(AutorizacionesRecord? e1, AutorizacionesRecord? e2) {
    return e1?.firma == e2?.firma;
  }

  @override
  int hash(AutorizacionesRecord? e) => const ListEquality().hash([e?.firma]);

  @override
  bool isValidKey(Object? o) => o is AutorizacionesRecord;
}
