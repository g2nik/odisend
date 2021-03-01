import 'package:flutter/material.dart';
import 'package:odisend/models/order.dart';
import 'package:odisend/widgets/widgets.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails(this.order);
  final Order order;

  @override _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDER DETAILS"),
        actions: [
          ProfileButton(),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          Text(
            "ID#${widget.order.id}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          Text(
            widget.order.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Text(
            widget.order.destinatary,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Text(
            "${widget.order.distance} KM",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {},
      ),
    );
  }
}