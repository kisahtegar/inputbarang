/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class DaftarBarang extends _i1.SerializableEntity {
  DaftarBarang({
    this.id,
    required this.nama_barang,
    required this.jenis_barang,
  });

  factory DaftarBarang.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return DaftarBarang(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nama_barang: serializationManager
          .deserialize<String>(jsonSerialization['nama_barang']),
      jenis_barang: serializationManager
          .deserialize<String>(jsonSerialization['jenis_barang']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String nama_barang;

  String jenis_barang;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_barang': nama_barang,
      'jenis_barang': jenis_barang,
    };
  }
}
