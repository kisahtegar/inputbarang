/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Supplier extends _i1.SerializableEntity {
  Supplier({
    this.id,
    required this.kode_supplier,
    required this.nama_supplier,
    required this.alamat_supplier,
    required this.telepon_supplier,
  });

  factory Supplier.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Supplier(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      kode_supplier: serializationManager
          .deserialize<String>(jsonSerialization['kode_supplier']),
      nama_supplier: serializationManager
          .deserialize<String>(jsonSerialization['nama_supplier']),
      alamat_supplier: serializationManager
          .deserialize<String>(jsonSerialization['alamat_supplier']),
      telepon_supplier: serializationManager
          .deserialize<String>(jsonSerialization['telepon_supplier']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String kode_supplier;

  String nama_supplier;

  String alamat_supplier;

  String telepon_supplier;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_supplier': kode_supplier,
      'nama_supplier': nama_supplier,
      'alamat_supplier': alamat_supplier,
      'telepon_supplier': telepon_supplier,
    };
  }
}
