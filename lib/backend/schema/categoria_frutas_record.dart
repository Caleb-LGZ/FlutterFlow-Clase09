import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CategoriaFrutasRecord extends FirestoreRecord {
  CategoriaFrutasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "peso" field.
  String? _peso;
  String get peso => _peso ?? '';
  bool hasPeso() => _peso != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _peso = snapshotData['peso'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoriaFrutas');

  static Stream<CategoriaFrutasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriaFrutasRecord.fromSnapshot(s));

  static Future<CategoriaFrutasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriaFrutasRecord.fromSnapshot(s));

  static CategoriaFrutasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriaFrutasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriaFrutasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriaFrutasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriaFrutasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriaFrutasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriaFrutasRecordData({
  String? nombre,
  String? peso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'peso': peso,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriaFrutasRecordDocumentEquality
    implements Equality<CategoriaFrutasRecord> {
  const CategoriaFrutasRecordDocumentEquality();

  @override
  bool equals(CategoriaFrutasRecord? e1, CategoriaFrutasRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.peso == e2?.peso;
  }

  @override
  int hash(CategoriaFrutasRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.peso]);

  @override
  bool isValidKey(Object? o) => o is CategoriaFrutasRecord;
}
