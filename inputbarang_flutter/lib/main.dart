import 'package:flutter/material.dart';
import 'package:inputbarang_client/inputbarang_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'screens/main_screen.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InputBarang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   // These fields hold the last result or error message that we've received from
//   // the server or null if no result exists yet.
//   String? _resultMessage;
//   String? _errorMessage;

//   final _textEditingController = TextEditingController();
//   final _textEditingControllerAlamat = TextEditingController();
//   final _textEditingControllerTelepon = TextEditingController();

//   // Calls the `hello` method of the `example` endpoint. Will set either the
//   // `_resultMessage` or `_errorMessage` field, depending on if the call
//   // is successful.
//   void _callHello() async {
//     try {
//       final result = await client.example.hello(_textEditingController.text);
//       setState(() {
//         _resultMessage = result;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = '$e';
//       });
//     }
//   }

//   void _addSupplier() async {
//     try {
//       final result = await client.supplier.addSupplier(
//         Supplier(
//           nama_supplier: _textEditingController.text,
//           alamat_supplier: _textEditingControllerAlamat.text,
//           telepon_supplier: _textEditingControllerTelepon.text,
//         ),
//       );
//       setState(() {
//         _resultMessage = 'Saved Todo: $result';
//         _textEditingController.text = '';
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = '$e';
//       });
//     }
//   }

//   /// Adding Transaksi
//   // void _addDaftarPembelian() async {
//   //   try {
//   //     final result = await client.daftarPembelian.addDaftarPembelian(
//   //       DaftarPembelian(
//   //         transaksiId: 1,
//   //         daftarBarangId: daftarBarangId,
//   //         jumlah: jumlah,
//   //         harga_barang: harga_barang,
//   //       ),
//   //     );
//   //     setState(() {
//   //       _resultMessage = 'Saved Todo: $result';
//   //       _textEditingController.text = '';
//   //     });
//   //   } catch (e) {
//   //     setState(() {
//   //       _errorMessage = '$e';
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: TextField(
//                 controller: _textEditingController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your name',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: TextField(
//                 controller: _textEditingControllerAlamat,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your alamat',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: TextField(
//                 controller: _textEditingControllerTelepon,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your telepon',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: ElevatedButton(
//                 onPressed: _addSupplier,
//                 child: const Text('Send to Server'),
//               ),
//             ),
//             _ResultDisplay(
//               resultMessage: _resultMessage,
//               errorMessage: _errorMessage,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // _ResultDisplays shows the result of the call. Either the returned result from
// // the `example.hello` endpoint method or an error message.
// class _ResultDisplay extends StatelessWidget {
//   final String? resultMessage;
//   final String? errorMessage;

//   const _ResultDisplay({
//     this.resultMessage,
//     this.errorMessage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String text;
//     Color backgroundColor;
//     if (errorMessage != null) {
//       backgroundColor = Colors.red[300]!;
//       text = errorMessage!;
//     } else if (resultMessage != null) {
//       backgroundColor = Colors.green[300]!;
//       text = resultMessage!;
//     } else {
//       backgroundColor = Colors.grey[300]!;
//       text = 'No server response yet.';
//     }

//     return Container(
//       height: 50,
//       color: backgroundColor,
//       child: Center(
//         child: Text(text),
//       ),
//     );
//   }
// }
