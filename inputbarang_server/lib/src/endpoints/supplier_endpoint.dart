import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart' show Supplier;

class SupplierEndpoint extends Endpoint {
  /// fetch Suppliers from DB.
  Future<List<Supplier>> getSuppliers(
    Session session, {
    String? keyword,
  }) async {
    return await Supplier.find(
      session,
      where: (t) =>
          keyword != null ? t.nama_supplier.like('%$keyword%') : Constant(true),
    );
  }

  /// Add Supplier to the database.
  Future<Supplier> addSupplier(
    Session session,
    Supplier supplier,
  ) async {
    await Supplier.insert(session, supplier);
    return supplier;
  }

  /// Update Supplier to the database.
  Future<Supplier> updateSupplier(
    Session session,
    Supplier supplier,
  ) async {
    await Supplier.update(session, supplier);
    return supplier;
  }

  /// Delete Supplier from database.
  Future<bool> deleteSupplier(
    Session session,
    int id,
  ) async {
    var result = await Supplier.delete(
      session,
      where: (t) => t.id.equals(id),
    );
    return result == 1;
  }
}
