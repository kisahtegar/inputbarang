import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show Supplier;

class SupplierEndpoint extends Endpoint {
  /// Adding Supplier to the database.
  Future<Supplier> addSupplier(Session session, Supplier item) async {
    await Supplier.insert(session, item);
    return item;
  }

  /// Load Suppliers.
  Future<List<Supplier>> loadSuppliers(Session session) async =>
      await Supplier.find(session);
}
