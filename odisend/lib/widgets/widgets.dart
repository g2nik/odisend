import 'package:flutter/material.dart';
import 'package:odisend/models/order.dart';
import 'package:odisend/pages/profile_details.dart';
import 'package:odisend/pages/order_details.dart';

class ProfileButton extends StatefulWidget {
  @override _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.person),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileDetails()));
      }
    );
  }
}

class OrderCard extends StatelessWidget {
  OrderCard(this.order);
  final Order order;
  
  @override Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        color: Colors.teal[300],
        child: ListTile(
          title: Text(order.address),
          trailing: Text("${order.distance} KM"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetails(order)));
          },
        ),
      ),
    );
  }
}