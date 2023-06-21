/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Transaksi extends _i1.SerializableEntity {
  Transaksi({
    this.id,
    required this.supplierId,
    required this.tanggal_transaksi,
  });

  factory Transaksi.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Transaksi(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      supplierId: serializationManager
          .deserialize<int>(jsonSerialization['supplierId']),
      tanggal_transaksi: serializationManager
          .deserialize<DateTime>(jsonSerialization['tanggal_transaksi']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int supplierId;

  DateTime tanggal_transaksi;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supplierId': supplierId,
      'tanggal_transaksi': tanggal_transaksi,
    };
  }
}
