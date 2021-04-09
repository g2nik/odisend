import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.stopCamera();
        Navigator.pop(context, result.code);
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}