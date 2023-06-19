/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'daftar_barang.dart' as _i3;
import 'daftar_pembelian.dart' as _i4;
import 'example.dart' as _i5;
import 'supplier.dart' as _i6;
import 'transaksi.dart' as _i7;
import 'package:inputbarang_server/src/generated/daftar_barang.dart' as _i8;
import 'package:inputbarang_server/src/generated/daftar_pembelian.dart' as _i9;
import 'package:inputbarang_server/src/generated/supplier.dart' as _i10;
import 'package:inputbarang_server/src/generated/transaksi.dart' as _i11;
export 'daftar_barang.dart';
export 'daftar_pembelian.dart';
export 'example.dart';
export 'supplier.dart';
export 'transaksi.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'daftar_barang',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'daftar_barang_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'kode_barang',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nama_barang',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'jenis_barang',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'daftar_barang_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'daftar_pembelian',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'daftar_pembelian_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'transaksiId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'daftarBarangId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'kode_pembelian',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'jumlah',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'harga_barang',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'daftar_pembelian_fk_0',
          columns: ['transaksiId'],
          referenceTable: 'transaksi',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'daftar_pembelian_fk_1',
          columns: ['daftarBarangId'],
          referenceTable: 'daftar_barang',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'daftar_pembelian_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'supplier',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'supplier_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'kode_supplier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nama_supplier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'alamat_supplier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'telepon_supplier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'supplier_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'transaksi',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'transaksi_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'supplierId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'kode_faktur',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tanggal_transaksi',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'transaksi_fk_0',
          columns: ['supplierId'],
          referenceTable: 'supplier',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'transaksi_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.DaftarBarang) {
      return _i3.DaftarBarang.fromJson(data, this) as T;
    }
    if (t == _i4.DaftarPembelian) {
      return _i4.DaftarPembelian.fromJson(data, this) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data, this) as T;
    }
    if (t == _i6.Supplier) {
      return _i6.Supplier.fromJson(data, this) as T;
    }
    if (t == _i7.Transaksi) {
      return _i7.Transaksi.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.DaftarBarang?>()) {
      return (data != null ? _i3.DaftarBarang.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.DaftarPembelian?>()) {
      return (data != null ? _i4.DaftarPembelian.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Supplier?>()) {
      return (data != null ? _i6.Supplier.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Transaksi?>()) {
      return (data != null ? _i7.Transaksi.fromJson(data, this) : null) as T;
    }
    if (t == List<_i8.DaftarBarang>) {
      return (data as List)
          .map((e) => deserialize<_i8.DaftarBarang>(e))
          .toList() as dynamic;
    }
    if (t == List<_i9.DaftarPembelian>) {
      return (data as List)
          .map((e) => deserialize<_i9.DaftarPembelian>(e))
          .toList() as dynamic;
    }
    if (t == List<_i10.Supplier>) {
      return (data as List).map((e) => deserialize<_i10.Supplier>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.Transaksi>) {
      return (data as List).map((e) => deserialize<_i11.Transaksi>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.DaftarBarang) {
      return 'DaftarBarang';
    }
    if (data is _i4.DaftarPembelian) {
      return 'DaftarPembelian';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.Supplier) {
      return 'Supplier';
    }
    if (data is _i7.Transaksi) {
      return 'Transaksi';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'DaftarBarang') {
      return deserialize<_i3.DaftarBarang>(data['data']);
    }
    if (data['className'] == 'DaftarPembelian') {
      return deserialize<_i4.DaftarPembelian>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (data['className'] == 'Supplier') {
      return deserialize<_i6.Supplier>(data['data']);
    }
    if (data['className'] == 'Transaksi') {
      return deserialize<_i7.Transaksi>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.DaftarBarang:
        return _i3.DaftarBarang.t;
      case _i4.DaftarPembelian:
        return _i4.DaftarPembelian.t;
      case _i6.Supplier:
        return _i6.Supplier.t;
      case _i7.Transaksi:
        return _i7.Transaksi.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
