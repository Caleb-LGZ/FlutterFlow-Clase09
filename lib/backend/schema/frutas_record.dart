import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FrutasRecord extends FirestoreRecord {
  FrutasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "detalle" field.
  String? _detalle;
  String get detalle => _detalle ?? '';
  bool hasDetalle() => _detalle != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _detalle = snapshotData['detalle'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _categoria = snapshotData['categoria'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('frutas');

  static Stream<FrutasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FrutasRecord.fromSnapshot(s));

  static Future<FrutasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FrutasRecord.fromSnapshot(s));

  static FrutasRecord fromSnapshot(DocumentSnapshot snapshot) => FrutasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FrutasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FrutasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FrutasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FrutasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFrutasRecordData({
  String? detalle,
  String? imagen,
  DocumentReference? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'detalle': detalle,
      'imagen': imagen,
      'categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class FrutasRecordDocumentEquality implements Equality<FrutasRecord> {
  const FrutasRecordDocumentEquality();

  @override
  bool equals(FrutasRecord? e1, FrutasRecord? e2) {
    return e1?.detalle == e2?.detalle &&
        e1?.imagen == e2?.imagen &&
        e1?.categoria == e2?.categoria;
  }

  @override
  int hash(FrutasRecord? e) =>
      const ListEquality().hash([e?.detalle, e?.imagen, e?.categoria]);

  @override
  bool isValidKey(Object? o) => o is FrutasRecord;
}
