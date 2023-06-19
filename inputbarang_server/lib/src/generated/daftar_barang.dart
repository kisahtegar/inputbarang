/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class DaftarBarang extends _i1.TableRow {
  DaftarBarang({
    int? id,
    required this.kode_barang,
    required this.nama_barang,
    required this.jenis_barang,
  }) : super(id);

  factory DaftarBarang.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return DaftarBarang(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      kode_barang: serializationManager
          .deserialize<String>(jsonSerialization['kode_barang']),
      nama_barang: serializationManager
          .deserialize<String>(jsonSerialization['nama_barang']),
      jenis_barang: serializationManager
          .deserialize<String>(jsonSerialization['jenis_barang']),
    );
  }

  static final t = DaftarBarangTable();

  String kode_barang;

  String nama_barang;

  String jenis_barang;

  @override
  String get tableName => 'daftar_barang';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_barang': kode_barang,
      'nama_barang': nama_barang,
      'jenis_barang': jenis_barang,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'kode_barang': kode_barang,
      'nama_barang': nama_barang,
      'jenis_barang': jenis_barang,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'kode_barang': kode_barang,
      'nama_barang': nama_barang,
      'jenis_barang': jenis_barang,
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
      case 'kode_barang':
        kode_barang = value;
        return;
      case 'nama_barang':
        nama_barang = value;
        return;
      case 'jenis_barang':
        jenis_barang = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<DaftarBarang>> find(
    _i1.Session session, {
    DaftarBarangExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DaftarBarang>(
      where: where != null ? where(DaftarBarang.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<DaftarBarang?> findSingleRow(
    _i1.Session session, {
    DaftarBarangExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<DaftarBarang>(
      where: where != null ? where(DaftarBarang.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<DaftarBarang?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<DaftarBarang>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required DaftarBarangExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DaftarBarang>(
      where: where(DaftarBarang.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    DaftarBarang row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    DaftarBarang row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    DaftarBarang row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    DaftarBarangExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DaftarBarang>(
      where: where != null ? where(DaftarBarang.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef DaftarBarangExpressionBuilder = _i1.Expression Function(
    DaftarBarangTable);

class DaftarBarangTable extends _i1.Table {
  DaftarBarangTable() : super(tableName: 'daftar_barang');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final kode_barang = _i1.ColumnString('kode_barang');

  final nama_barang = _i1.ColumnString('nama_barang');

  final jenis_barang = _i1.ColumnString('jenis_barang');

  @override
  List<_i1.Column> get columns => [
        id,
        kode_barang,
        nama_barang,
        jenis_barang,
      ];
}

@Deprecated('Use DaftarBarangTable.t instead.')
DaftarBarangTable tDaftarBarang = DaftarBarangTable();
