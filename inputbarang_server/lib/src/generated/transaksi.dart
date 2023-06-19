/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Transaksi extends _i1.TableRow {
  Transaksi({
    int? id,
    required this.supplierId,
    required this.kode_faktur,
    required this.tanggal_transaksi,
  }) : super(id);

  factory Transaksi.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Transaksi(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      supplierId: serializationManager
          .deserialize<int>(jsonSerialization['supplierId']),
      kode_faktur: serializationManager
          .deserialize<String>(jsonSerialization['kode_faktur']),
      tanggal_transaksi: serializationManager
          .deserialize<DateTime>(jsonSerialization['tanggal_transaksi']),
    );
  }

  static final t = TransaksiTable();

  int supplierId;

  String kode_faktur;

  DateTime tanggal_transaksi;

  @override
  String get tableName => 'transaksi';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supplierId': supplierId,
      'kode_faktur': kode_faktur,
      'tanggal_transaksi': tanggal_transaksi,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'supplierId': supplierId,
      'kode_faktur': kode_faktur,
      'tanggal_transaksi': tanggal_transaksi,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'supplierId': supplierId,
      'kode_faktur': kode_faktur,
      'tanggal_transaksi': tanggal_transaksi,
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
      case 'supplierId':
        supplierId = value;
        return;
      case 'kode_faktur':
        kode_faktur = value;
        return;
      case 'tanggal_transaksi':
        tanggal_transaksi = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Transaksi>> find(
    _i1.Session session, {
    TransaksiExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Transaksi>(
      where: where != null ? where(Transaksi.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Transaksi?> findSingleRow(
    _i1.Session session, {
    TransaksiExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Transaksi>(
      where: where != null ? where(Transaksi.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Transaksi?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Transaksi>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TransaksiExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Transaksi>(
      where: where(Transaksi.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Transaksi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Transaksi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Transaksi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TransaksiExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Transaksi>(
      where: where != null ? where(Transaksi.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TransaksiExpressionBuilder = _i1.Expression Function(TransaksiTable);

class TransaksiTable extends _i1.Table {
  TransaksiTable() : super(tableName: 'transaksi');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final supplierId = _i1.ColumnInt('supplierId');

  final kode_faktur = _i1.ColumnString('kode_faktur');

  final tanggal_transaksi = _i1.ColumnDateTime('tanggal_transaksi');

  @override
  List<_i1.Column> get columns => [
        id,
        supplierId,
        kode_faktur,
        tanggal_transaksi,
      ];
}

@Deprecated('Use TransaksiTable.t instead.')
TransaksiTable tTransaksi = TransaksiTable();
