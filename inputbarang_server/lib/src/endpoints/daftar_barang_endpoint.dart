import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show DaftarBarang;

class DaftarBarangEndpoint extends Endpoint {
  /// fetch DaftarBarangs from DB.
  Future<List<DaftarBarang>> getDaftarBarangs(
    Session session, {
    String? keyword,
  }) async {
    return await DaftarBarang.find(
      session,
      where: (t) =>
          keyword != null ? t.nama_barang.like('%$keyword%') : Constant(true),
    );
  }

  /// Add DaftarBarang to the database.
  Future<DaftarBarang> addDaftarBarang(
    Session session,
    DaftarBarang daftarBarang,
  ) async {
    await DaftarBarang.insert(session, daftarBarang);
    return daftarBarang;
  }

  /// Update DaftarBarang to the database.
  Future<DaftarBarang> updateDaftarBarang(
    Session session,
    DaftarBarang daftarBarang,
  ) async {
    await DaftarBarang.update(session, daftarBarang);
    return daftarBarang;
  }

  /// Delete DaftarBarang from database.
  Future<bool> deleteDaftarBarang(
    Session session,
    int id,
  ) async {
    var result = await DaftarBarang.delete(
      session,
      where: (t) => t.id.equals(id),
    );
    return result == 1;
  }
}
