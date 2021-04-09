import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:odisend/models/order.dart';
import 'package:odisend/pages/profile_details.dart';
import 'package:odisend/pages/order_details.dart';

class ProfileButton extends StatefulWidget {
  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfileDetails()));
        });
  }
}

class OrderCard extends StatelessWidget {
  OrderCard(this.order);
  final Order order;

  @override
  Widget build(BuildContext context) {
    bool light = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light;
if (order.id > 2) {
      return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        color: light ? Colors.orangeAccent : Colors.grey[700],
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.content,
                  style: TextStyle(
                      color: light ? Colors.black : Colors.orangeAccent,
                      fontWeight: FontWeight.bold)),  
                      Row(
                        children: [
                          Icon(Icons.motorcycle)
                          ,Icon(Icons.local_car_wash), Icon(Icons.pedal_bike),
                        ],
                      ), 
            ],
          ),
          trailing: Text("11 KM",
              style:
                  TextStyle(color: light ? Colors.black : Colors.orangeAccent)),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OrderDetails(order)));
          },
        ),
      ),
    );
} else {
      return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        color: light ? Colors.orangeAccent : Colors.grey[700],
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.content,
                  style: TextStyle(
                      color: light ? Colors.black : Colors.orangeAccent,
                      fontWeight: FontWeight.bold)),  
                      Row(
                        children: [
                          Icon(Icons.motorcycle)
                          ,Icon(Icons.local_car_wash)
                        ],
                      ), 
            ],
          ),
          trailing: Text("11 KM",
              style:
                  TextStyle(color: light ? Colors.black : Colors.orangeAccent)),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OrderDetails(order)));
          },
        ),
      ),
    );
}

  }
}
