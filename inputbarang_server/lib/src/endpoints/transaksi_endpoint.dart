import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show Transaksi;

class TransaksiEndpoint extends Endpoint {
  /// Adding Transaksi to the database.
  Future<Transaksi> addTransaksi(Session session, Transaksi item) async {
    await Transaksi.insert(session, item);
    return item;
  }

  /// Load Transaksis.
  Future<List<Transaksi>> loadTransaksis(Session session) async =>
      await Transaksi.find(session);
}
