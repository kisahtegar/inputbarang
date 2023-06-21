import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show DaftarPembelian;

class DaftarPembelianEndpoint extends Endpoint {
  /// fetch DaftarPembelians from DB.
  Future<List<DaftarPembelian>> getDaftarPembelians(
    Session session, {
    String? keyword,
  }) async {
    return await DaftarPembelian.find(
      session,
      where: (t) => keyword != null
          ? t.kode_pembelian.like('%$keyword%')
          : Constant(true),
    );
  }

  /// Add DaftarPembelian to the database.
  Future<DaftarPembelian> addDaftarPembelian(
    Session session,
    DaftarPembelian daftarPembelian,
  ) async {
    await DaftarPembelian.insert(session, daftarPembelian);
    return daftarPembelian;
  }

  /// Update DaftarPembelian to the database.
  Future<DaftarPembelian> updateDaftarPembelian(
    Session session,
    DaftarPembelian daftarPembelian,
  ) async {
    await DaftarPembelian.update(session, daftarPembelian);
    return daftarPembelian;
  }

  /// Delete DaftarPembelian from database.
  Future<bool> deleteDaftarPembelian(
    Session session,
    int id,
  ) async {
    var result = await DaftarPembelian.delete(
      session,
      where: (t) => t.id.equals(id),
    );
    return result == 1;
  }
}
