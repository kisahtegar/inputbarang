/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class DaftarPembelian extends _i1.SerializableEntity {
  DaftarPembelian({
    this.id,
    required this.transaksiId,
    required this.daftarBarangId,
    required this.kode_pembelian,
    required this.jumlah,
    required this.harga_barang,
  });

  factory DaftarPembelian.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return DaftarPembelian(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      transaksiId: serializationManager
          .deserialize<int>(jsonSerialization['transaksiId']),
      daftarBarangId: serializationManager
          .deserialize<int>(jsonSerialization['daftarBarangId']),
      kode_pembelian: serializationManager
          .deserialize<String>(jsonSerialization['kode_pembelian']),
      jumlah:
          serializationManager.deserialize<int>(jsonSerialization['jumlah']),
      harga_barang: serializationManager
          .deserialize<int>(jsonSerialization['harga_barang']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int transaksiId;

  int daftarBarangId;

  String kode_pembelian;

  int jumlah;

  int harga_barang;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaksiId': transaksiId,
      'daftarBarangId': daftarBarangId,
      'kode_pembelian': kode_pembelian,
      'jumlah': jumlah,
      'harga_barang': harga_barang,
    };
  }
}
