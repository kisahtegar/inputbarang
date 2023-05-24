import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show DaftarPembelian;

class DaftarPembelianEndpoint extends Endpoint {
  /// Adding DaftarPembelian to the database.
  Future<DaftarPembelian> addDaftarPembelian(
    Session session,
    DaftarPembelian item,
  ) async {
    await DaftarPembelian.insert(session, item);
    return item;
  }

  /// Load DaftarPembelians.
  Future<List<DaftarPembelian>> loadDaftarPembelians(Session session) async =>
      await DaftarPembelian.find(session);
}
