import 'package:flutter/material.dart';
import 'package:odisend/models/order.dart';
import 'package:odisend/widgets/widgets.dart';

class HomeX extends StatefulWidget {
  @override _HomeXState createState() => _HomeXState();
}

class _HomeXState extends State<HomeX> {

  List<Order> orders = [
    Order(id: 1, address: "C Barcelona 1", destinatary: "Sr Pepe", distance: .75),
    Order(id: 2, address: "C Valencia 2", destinatary: "Sr Pepito", distance: 1.8),
    Order(id: 3, address: "C Madrid 3", destinatary: "Sra Pepa", distance: 2.8),
    Order(id: 4, address: "Av Malaga 4", destinatary: "Don Pepe", distance: 3.4),
    Order(id: 5, address: "Pl Cádiz", destinatary: "Sr Pedro", distance: 6),
    Order(id: 6, address: "Pl España", destinatary: "Sr Pedrito", distance: 7),
    Order(id: 7, address: "Pl Catalunya", destinatary: "Don Juan", distance: 15),
    Order(id: 8, address: "C Mayor 8", destinatary: "San Juan", distance: 25),
    Order(id: 9, address: "C Menor 9", destinatary: "Son Goku", distance: 345),
    Order(id: 10, address: "C Cielo 10", destinatary: "Son Goku", distance: 9999),
  ];

  Future<void> _pullRefresh() async {
    setState(() => orders.removeAt(9));
  }
  
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PACKET TRACER"),
        actions: [ProfileButton()],
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 30),
          itemCount: orders.length,
          itemBuilder: (context, index) => OrderCard(orders[index]),
        ),
      ),
    );
  }
}