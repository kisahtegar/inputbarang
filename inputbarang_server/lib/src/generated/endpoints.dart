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
        'findDaftarBarang': _i1.MethodConnector(
          name: 'findDaftarBarang',
          params: {
            'daftarBarangId': _i1.ParameterDescription(
              name: 'daftarBarangId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarBarang'] as _i2.DaftarBarangEndpoint)
                  .findDaftarBarang(
            session,
            params['daftarBarangId'],
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
        'getDaftarPembelians': _i1.MethodConnector(
          name: 'getDaftarPembelians',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarPembelian'] as _i3.DaftarPembelianEndpoint)
                  .getDaftarPembelians(session),
        ),
        'addDaftarPembelian': _i1.MethodConnector(
          name: 'addDaftarPembelian',
          params: {
            'daftarPembelian': _i1.ParameterDescription(
              name: 'daftarPembelian',
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
            params['daftarPembelian'],
          ),
        ),
        'updateDaftarPembelian': _i1.MethodConnector(
          name: 'updateDaftarPembelian',
          params: {
            'daftarPembelian': _i1.ParameterDescription(
              name: 'daftarPembelian',
              type: _i1.getType<_i8.DaftarPembelian>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['daftarPembelian'] as _i3.DaftarPembelianEndpoint)
                  .updateDaftarPembelian(
            session,
            params['daftarPembelian'],
          ),
        ),
        'deleteDaftarPembelian': _i1.MethodConnector(
          name: 'deleteDaftarPembelian',
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
              (endpoints['daftarPembelian'] as _i3.DaftarPembelianEndpoint)
                  .deleteDaftarPembelian(
            session,
            params['id'],
          ),
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
        'getSuppliers': _i1.MethodConnector(
          name: 'getSuppliers',
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
              (endpoints['supplier'] as _i5.SupplierEndpoint).getSuppliers(
            session,
            keyword: params['keyword'],
          ),
        ),
        'addSupplier': _i1.MethodConnector(
          name: 'addSupplier',
          params: {
            'supplier': _i1.ParameterDescription(
              name: 'supplier',
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
            params['supplier'],
          ),
        ),
        'updateSupplier': _i1.MethodConnector(
          name: 'updateSupplier',
          params: {
            'supplier': _i1.ParameterDescription(
              name: 'supplier',
              type: _i1.getType<_i9.Supplier>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['supplier'] as _i5.SupplierEndpoint).updateSupplier(
            session,
            params['supplier'],
          ),
        ),
        'deleteSupplier': _i1.MethodConnector(
          name: 'deleteSupplier',
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
              (endpoints['supplier'] as _i5.SupplierEndpoint).deleteSupplier(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['transaksi'] = _i1.EndpointConnector(
      name: 'transaksi',
      endpoint: endpoints['transaksi']!,
      methodConnectors: {
        'getDaftarTransaksis': _i1.MethodConnector(
          name: 'getDaftarTransaksis',
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
              (endpoints['transaksi'] as _i6.TransaksiEndpoint)
                  .getDaftarTransaksis(
            session,
            keyword: params['keyword'],
          ),
        ),
        'addTransaksi': _i1.MethodConnector(
          name: 'addTransaksi',
          params: {
            'daftarTransaksi': _i1.ParameterDescription(
              name: 'daftarTransaksi',
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
            params['daftarTransaksi'],
          ),
        ),
        'deleteTransaksi': _i1.MethodConnector(
          name: 'deleteTransaksi',
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
              (endpoints['transaksi'] as _i6.TransaksiEndpoint).deleteTransaksi(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
