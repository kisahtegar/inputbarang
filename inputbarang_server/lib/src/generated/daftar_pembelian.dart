/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class DaftarPembelian extends _i1.TableRow {
  DaftarPembelian({
    int? id,
    required this.transaksiId,
    required this.daftarBarangId,
    required this.jumlah,
    required this.harga_barang,
  }) : super(id);

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
      jumlah:
          serializationManager.deserialize<int>(jsonSerialization['jumlah']),
      harga_barang: serializationManager
          .deserialize<int>(jsonSerialization['harga_barang']),
    );
  }

  static final t = DaftarPembelianTable();

  int transaksiId;

  int daftarBarangId;

  int jumlah;

  int harga_barang;

  @override
  String get tableName => 'daftar_pembelian';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaksiId': transaksiId,
      'daftarBarangId': daftarBarangId,
      'jumlah': jumlah,
      'harga_barang': harga_barang,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'transaksiId': transaksiId,
      'daftarBarangId': daftarBarangId,
      'jumlah': jumlah,
      'harga_barang': harga_barang,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'transaksiId': transaksiId,
      'daftarBarangId': daftarBarangId,
      'jumlah': jumlah,
      'harga_barang': harga_barang,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'transaksiId':
        transaksiId = value;
        return;
      case 'daftarBarangId':
        daftarBarangId = value;
        return;
      case 'jumlah':
        jumlah = value;
        return;
      case 'harga_barang':
        harga_barang = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<DaftarPembelian>> find(
    _i1.Session session, {
    DaftarPembelianExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DaftarPembelian>(
      where: where != null ? where(DaftarPembelian.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<DaftarPembelian?> findSingleRow(
    _i1.Session session, {
    DaftarPembelianExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<DaftarPembelian>(
      where: where != null ? where(DaftarPembelian.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<DaftarPembelian?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<DaftarPembelian>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required DaftarPembelianExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DaftarPembelian>(
      where: where(DaftarPembelian.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    DaftarPembelian row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    DaftarPembelian row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    DaftarPembelian row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    DaftarPembelianExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DaftarPembelian>(
      where: where != null ? where(DaftarPembelian.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef DaftarPembelianExpressionBuilder = _i1.Expression Function(
    DaftarPembelianTable);

class DaftarPembelianTable extends _i1.Table {
  DaftarPembelianTable() : super(tableName: 'daftar_pembelian');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final transaksiId = _i1.ColumnInt('transaksiId');

  final daftarBarangId = _i1.ColumnInt('daftarBarangId');

  final jumlah = _i1.ColumnInt('jumlah');

  final harga_barang = _i1.ColumnInt('harga_barang');

  @override
  List<_i1.Column> get columns => [
        id,
        transaksiId,
        daftarBarangId,
        jumlah,
        harga_barang,
      ];
}

@Deprecated('Use DaftarPembelianTable.t instead.')
DaftarPembelianTable tDaftarPembelian = DaftarPembelianTable();
