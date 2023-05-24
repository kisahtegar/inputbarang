/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'daftar_barang.dart' as _i2;
import 'daftar_pembelian.dart' as _i3;
import 'example.dart' as _i4;
import 'supplier.dart' as _i5;
import 'transaksi.dart' as _i6;
import 'package:inputbarang_client/src/protocol/daftar_barang.dart' as _i7;
import 'package:inputbarang_client/src/protocol/daftar_pembelian.dart' as _i8;
import 'package:inputbarang_client/src/protocol/supplier.dart' as _i9;
import 'package:inputbarang_client/src/protocol/transaksi.dart' as _i10;
export 'daftar_barang.dart';
export 'daftar_pembelian.dart';
export 'example.dart';
export 'supplier.dart';
export 'transaksi.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.DaftarBarang) {
      return _i2.DaftarBarang.fromJson(data, this) as T;
    }
    if (t == _i3.DaftarPembelian) {
      return _i3.DaftarPembelian.fromJson(data, this) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data, this) as T;
    }
    if (t == _i5.Supplier) {
      return _i5.Supplier.fromJson(data, this) as T;
    }
    if (t == _i6.Transaksi) {
      return _i6.Transaksi.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.DaftarBarang?>()) {
      return (data != null ? _i2.DaftarBarang.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.DaftarPembelian?>()) {
      return (data != null ? _i3.DaftarPembelian.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Supplier?>()) {
      return (data != null ? _i5.Supplier.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Transaksi?>()) {
      return (data != null ? _i6.Transaksi.fromJson(data, this) : null) as T;
    }
    if (t == List<_i7.DaftarBarang>) {
      return (data as List)
          .map((e) => deserialize<_i7.DaftarBarang>(e))
          .toList() as dynamic;
    }
    if (t == List<_i8.DaftarPembelian>) {
      return (data as List)
          .map((e) => deserialize<_i8.DaftarPembelian>(e))
          .toList() as dynamic;
    }
    if (t == List<_i9.Supplier>) {
      return (data as List).map((e) => deserialize<_i9.Supplier>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Transaksi>) {
      return (data as List).map((e) => deserialize<_i10.Transaksi>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.DaftarBarang) {
      return 'DaftarBarang';
    }
    if (data is _i3.DaftarPembelian) {
      return 'DaftarPembelian';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.Supplier) {
      return 'Supplier';
    }
    if (data is _i6.Transaksi) {
      return 'Transaksi';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'DaftarBarang') {
      return deserialize<_i2.DaftarBarang>(data['data']);
    }
    if (data['className'] == 'DaftarPembelian') {
      return deserialize<_i3.DaftarPembelian>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'Supplier') {
      return deserialize<_i5.Supplier>(data['data']);
    }
    if (data['className'] == 'Transaksi') {
      return deserialize<_i6.Transaksi>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
