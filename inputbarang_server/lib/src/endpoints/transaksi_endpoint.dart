import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show Transaksi;

class TransaksiEndpoint extends Endpoint {
  /// fetch DaftarTransaksis from DB.
  Future<List<Transaksi>> getDaftarTransaksis(
    Session session, {
    String? keyword,
  }) async {
    return await Transaksi.find(session);
  }

  /// Add Transaksi to the database.
  Future<Transaksi> addTransaksi(
    Session session,
    Transaksi daftarTransaksi,
  ) async {
    await Transaksi.insert(session, daftarTransaksi);
    return daftarTransaksi;
  }

  /// Delete Transaksi from database.
  Future<bool> deleteTransaksi(
    Session session,
    int id,
  ) async {
    var result = await Transaksi.delete(
      session,
      where: (t) => t.id.equals(id),
    );
    return result == 1;
  }
}
