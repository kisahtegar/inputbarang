/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/daftar_barang_endpoint.dart' as _i2;
import '../endpoints/daftar_pembelian_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/supplier_endpoint.dart' as _i5;
import '../endpoints/transaksi_endpoint.dart' as _i6;
import 'package:inputbarang_server/src/generated/daftar_barang.dart' as _i7;
import 'package:inputbarang_server/src/generated/daftar_pembelian.dart' as _i8;
import 'package:inputbarang_server/src/generated/supplier.dart' as _i9;
import 'package:inputbarang_server/src/generated/transaksi.dart' as _i10;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'daftarBarang': _i2.DaftarBarangEndpoint()
        ..initialize(
          server,
          'daftarBarang',
          null,
        ),
      'daftarPembelian': _i3.DaftarPembelianEndpoint()
        ..initialize(
          server,
          'daftarPembelian',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'supplier': _i5.SupplierEndpoint()
        ..initialize(
          server,
          'supplier',
          null,
        ),
      'transaksi': _i6.TransaksiEndpoint()
        ..initialize(
          server,
          'transaksi',
          null,
        ),
    };
    connectors['daftarBarang'] = _i1.EndpointConnector(
      name: 'daftarBarang',
      endpoint: endpoints['daftarBarang']!,
      methodConnectors: {
        'getDaftarBarangs': _i1.MethodConnector(
          name: 'getDaftarBarangs',
          params: {
            'keyword': _i1.ParameterDescription(
              name: 'keyword',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarBarang'] as _i2.DaftarBarangEndpoint)
                  .getDaftarBarangs(
            session,
            keyword: params['keyword'],
          ),
        ),
        'addDaftarBarang': _i1.MethodConnector(
          name: 'addDaftarBarang',
          params: {
            'daftarBarang': _i1.ParameterDescription(
              name: 'daftarBarang',
              type: _i1.getType<_i7.DaftarBarang>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarBarang'] as _i2.DaftarBarangEndpoint)
                  .addDaftarBarang(
            session,
            params['daftarBarang'],
          ),
        ),
        'updateDaftarBarang': _i1.MethodConnector(
          name: 'updateDaftarBarang',
          params: {
            'daftarBarang': _i1.ParameterDescription(
              name: 'daftarBarang',
              type: _i1.getType<_i7.DaftarBarang>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarBarang'] as _i2.DaftarBarangEndpoint)
                  .updateDaftarBarang(
            session,
            params['daftarBarang'],
          ),
        ),
        'deleteDaftarBarang': _i1.MethodConnector(
          name: 'deleteDaftarBarang',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarBarang'] as _i2.DaftarBarangEndpoint)
                  .deleteDaftarBarang(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['daftarPembelian'] = _i1.EndpointConnector(
      name: 'daftarPembelian',
      endpoint: endpoints['daftarPembelian']!,
      methodConnectors: {
        'addDaftarPembelian': _i1.MethodConnector(
          name: 'addDaftarPembelian',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i8.DaftarPembelian>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarPembelian'] as _i3.DaftarPembelianEndpoint)
                  .addDaftarPembelian(
            session,
            params['item'],
          ),
        ),
        'loadDaftarPembelians': _i1.MethodConnector(
          name: 'loadDaftarPembelians',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarPembelian'] as _i3.DaftarPembelianEndpoint)
                  .loadDaftarPembelians(session),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['supplier'] = _i1.EndpointConnector(
      name: 'supplier',
      endpoint: endpoints['supplier']!,
      methodConnectors: {
        'addSupplier': _i1.MethodConnector(
          name: 'addSupplier',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i9.Supplier>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['supplier'] as _i5.SupplierEndpoint).addSupplier(
            session,
            params['item'],
          ),
        ),
        'loadSuppliers': _i1.MethodConnector(
          name: 'loadSuppliers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['supplier'] as _i5.SupplierEndpoint)
                  .loadSuppliers(session),
        ),
      },
    );
    connectors['transaksi'] = _i1.EndpointConnector(
      name: 'transaksi',
      endpoint: endpoints['transaksi']!,
      methodConnectors: {
        'addTransaksi': _i1.MethodConnector(
          name: 'addTransaksi',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i10.Transaksi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['transaksi'] as _i6.TransaksiEndpoint).addTransaksi(
            session,
            params['item'],
          ),
        ),
        'loadTransaksis': _i1.MethodConnector(
          name: 'loadTransaksis',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['transaksi'] as _i6.TransaksiEndpoint)
                  .loadTransaksis(session),
        ),
      },
    );
  }
}
