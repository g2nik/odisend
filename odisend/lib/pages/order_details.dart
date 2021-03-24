import 'package:flutter/material.dart';
import 'package:odisend/models/order.dart';
import 'package:odisend/widgets/map.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails(this.order);
  final Order order;

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDER DETAILS"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          Text(
            "ID#${widget.order.id}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.grey, fontStyle: FontStyle.italic),
          ),

          SizedBox(height: 30),
          Text(
            widget.order.direction_Pickup,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),

          Divider(),

          SizedBox(height: 20),
          Text(
            "${widget.order.userId}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 20),
          Text(
            "Pickup: ${widget.order.direction_Pickup}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            "Delivery: ${widget.order.direction_Delivery}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Text(
            "${widget.order.state}" ?? "N/A",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OdisendMap(widget.order)));
        },
      ),
    );
  }
}