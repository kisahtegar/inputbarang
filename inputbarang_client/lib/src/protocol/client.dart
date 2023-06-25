/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:inputbarang_client/src/protocol/daftar_barang.dart' as _i3;
import 'package:inputbarang_client/src/protocol/daftar_pembelian.dart' as _i4;
import 'package:inputbarang_client/src/protocol/supplier.dart' as _i5;
import 'package:inputbarang_client/src/protocol/transaksi.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

class _EndpointDaftarBarang extends _i1.EndpointRef {
  _EndpointDaftarBarang(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'daftarBarang';

  /// fetch DaftarBarangs from DB.
  _i2.Future<List<_i3.DaftarBarang>> getDaftarBarangs({String? keyword}) =>
      caller.callServerEndpoint<List<_i3.DaftarBarang>>(
        'daftarBarang',
        'getDaftarBarangs',
        {'keyword': keyword},
      );

  /// Add DaftarBarang to the database.
  _i2.Future<_i3.DaftarBarang> addDaftarBarang(_i3.DaftarBarang daftarBarang) =>
      caller.callServerEndpoint<_i3.DaftarBarang>(
        'daftarBarang',
        'addDaftarBarang',
        {'daftarBarang': daftarBarang},
      );

  /// Update DaftarBarang to the database.
  _i2.Future<_i3.DaftarBarang> updateDaftarBarang(
          _i3.DaftarBarang daftarBarang) =>
      caller.callServerEndpoint<_i3.DaftarBarang>(
        'daftarBarang',
        'updateDaftarBarang',
        {'daftarBarang': daftarBarang},
      );

  /// Update DaftarBarang to the database.
  _i2.Future<_i3.DaftarBarang?> findDaftarBarang(int daftarBarangId) =>
      caller.callServerEndpoint<_i3.DaftarBarang?>(
        'daftarBarang',
        'findDaftarBarang',
        {'daftarBarangId': daftarBarangId},
      );

  /// Delete DaftarBarang from database.
  _i2.Future<bool> deleteDaftarBarang(int id) =>
      caller.callServerEndpoint<bool>(
        'daftarBarang',
        'deleteDaftarBarang',
        {'id': id},
      );
}

class _EndpointDaftarPembelian extends _i1.EndpointRef {
  _EndpointDaftarPembelian(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'daftarPembelian';

  /// fetch DaftarPembelians from DB.
  _i2.Future<List<_i4.DaftarPembelian>> getDaftarPembelians() =>
      caller.callServerEndpoint<List<_i4.DaftarPembelian>>(
        'daftarPembelian',
        'getDaftarPembelians',
        {},
      );

  /// Add DaftarPembelian to the database.
  _i2.Future<_i4.DaftarPembelian> addDaftarPembelian(
          _i4.DaftarPembelian daftarPembelian) =>
      caller.callServerEndpoint<_i4.DaftarPembelian>(
        'daftarPembelian',
        'addDaftarPembelian',
        {'daftarPembelian': daftarPembelian},
      );

  /// Update DaftarPembelian to the database.
  _i2.Future<_i4.DaftarPembelian> updateDaftarPembelian(
          _i4.DaftarPembelian daftarPembelian) =>
      caller.callServerEndpoint<_i4.DaftarPembelian>(
        'daftarPembelian',
        'updateDaftarPembelian',
        {'daftarPembelian': daftarPembelian},
      );

  /// Delete DaftarPembelian from database.
  _i2.Future<bool> deleteDaftarPembelian(int id) =>
      caller.callServerEndpoint<bool>(
        'daftarPembelian',
        'deleteDaftarPembelian',
        {'id': id},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointSupplier extends _i1.EndpointRef {
  _EndpointSupplier(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'supplier';

  /// fetch Suppliers from DB.
  _i2.Future<List<_i5.Supplier>> getSuppliers({String? keyword}) =>
      caller.callServerEndpoint<List<_i5.Supplier>>(
        'supplier',
        'getSuppliers',
        {'keyword': keyword},
      );

  /// Add Supplier to the database.
  _i2.Future<_i5.Supplier> addSupplier(_i5.Supplier supplier) =>
      caller.callServerEndpoint<_i5.Supplier>(
        'supplier',
        'addSupplier',
        {'supplier': supplier},
      );

  /// Update Supplier to the database.
  _i2.Future<_i5.Supplier> updateSupplier(_i5.Supplier supplier) =>
      caller.callServerEndpoint<_i5.Supplier>(
        'supplier',
        'updateSupplier',
        {'supplier': supplier},
      );

  /// Delete Supplier from database.
  _i2.Future<bool> deleteSupplier(int id) => caller.callServerEndpoint<bool>(
        'supplier',
        'deleteSupplier',
        {'id': id},
      );
}

class _EndpointTransaksi extends _i1.EndpointRef {
  _EndpointTransaksi(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'transaksi';

  /// fetch DaftarTransaksis from DB.
  _i2.Future<List<_i6.Transaksi>> getDaftarTransaksis({String? keyword}) =>
      caller.callServerEndpoint<List<_i6.Transaksi>>(
        'transaksi',
        'getDaftarTransaksis',
        {'keyword': keyword},
      );

  /// Add Transaksi to the database.
  _i2.Future<_i6.Transaksi> addTransaksi(_i6.Transaksi daftarTransaksi) =>
      caller.callServerEndpoint<_i6.Transaksi>(
        'transaksi',
        'addTransaksi',
        {'daftarTransaksi': daftarTransaksi},
      );

  /// Delete Transaksi from database.
  _i2.Future<bool> deleteTransaksi(int id) => caller.callServerEndpoint<bool>(
        'transaksi',
        'deleteTransaksi',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    daftarBarang = _EndpointDaftarBarang(this);
    daftarPembelian = _EndpointDaftarPembelian(this);
    example = _EndpointExample(this);
    supplier = _EndpointSupplier(this);
    transaksi = _EndpointTransaksi(this);
  }

  late final _EndpointDaftarBarang daftarBarang;

  late final _EndpointDaftarPembelian daftarPembelian;

  late final _EndpointExample example;

  late final _EndpointSupplier supplier;

  late final _EndpointTransaksi transaksi;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'daftarBarang': daftarBarang,
        'daftarPembelian': daftarPembelian,
        'example': example,
        'supplier': supplier,
        'transaksi': transaksi,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
