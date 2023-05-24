/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Supplier extends _i1.TableRow {
  Supplier({
    int? id,
    required this.nama_supplier,
    required this.alamat_supplier,
    required this.telepon_supplier,
  }) : super(id);

  factory Supplier.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Supplier(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nama_supplier: serializationManager
          .deserialize<String>(jsonSerialization['nama_supplier']),
      alamat_supplier: serializationManager
          .deserialize<String>(jsonSerialization['alamat_supplier']),
      telepon_supplier: serializationManager
          .deserialize<String>(jsonSerialization['telepon_supplier']),
    );
  }

  static final t = SupplierTable();

  String nama_supplier;

  String alamat_supplier;

  String telepon_supplier;

  @override
  String get tableName => 'supplier';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_supplier': nama_supplier,
      'alamat_supplier': alamat_supplier,
      'telepon_supplier': telepon_supplier,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'nama_supplier': nama_supplier,
      'alamat_supplier': alamat_supplier,
      'telepon_supplier': telepon_supplier,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'nama_supplier': nama_supplier,
      'alamat_supplier': alamat_supplier,
      'telepon_supplier': telepon_supplier,
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
      case 'nama_supplier':
        nama_supplier = value;
        return;
      case 'alamat_supplier':
        alamat_supplier = value;
        return;
      case 'telepon_supplier':
        telepon_supplier = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Supplier>> find(
    _i1.Session session, {
    SupplierExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Supplier>(
      where: where != null ? where(Supplier.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Supplier?> findSingleRow(
    _i1.Session session, {
    SupplierExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Supplier>(
      where: where != null ? where(Supplier.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Supplier?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Supplier>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required SupplierExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Supplier>(
      where: where(Supplier.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Supplier row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Supplier row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Supplier row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    SupplierExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Supplier>(
      where: where != null ? where(Supplier.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef SupplierExpressionBuilder = _i1.Expression Function(SupplierTable);

class SupplierTable extends _i1.Table {
  SupplierTable() : super(tableName: 'supplier');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final nama_supplier = _i1.ColumnString('nama_supplier');

  final alamat_supplier = _i1.ColumnString('alamat_supplier');

  final telepon_supplier = _i1.ColumnString('telepon_supplier');

  @override
  List<_i1.Column> get columns => [
        id,
        nama_supplier,
        alamat_supplier,
        telepon_supplier,
      ];
}

@Deprecated('Use SupplierTable.t instead.')
SupplierTable tSupplier = SupplierTable();
