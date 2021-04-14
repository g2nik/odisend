import 'package:flutter/material.dart';
import 'package:odisend/models/order.dart';
import 'package:odisend/pages/profile_details.dart';
import 'package:odisend/services/api.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:odisend/widgets/widgets.dart';

class Orders extends StatefulWidget {
  Orders({GoogleSignInProvider provider}) : googleProvider = provider;

  final GoogleSignInProvider googleProvider;

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {

  API api = API();
  List<Order> generalOrders = List();
  List<Order> assignedOrders = List();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _loadGeneralOrders();
    _loadAssignedOrders();
    load();
  }

  Future load() async {

  }

  Future _loadGeneralOrders() async {
    generalOrders = await api.getGeneralOrders();
    debugPrint(generalOrders.toString());
    setState(() {});
  }

  Future _loadAssignedOrders() async {
    assignedOrders = await api.getAssignedOrders();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ODISEND BOARD"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileDetails(provider: widget.googleProvider)));
            }
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "ALL TASKS",),
            Tab(text: "MY TASKS",),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [

          RefreshIndicator(
            onRefresh: _loadGeneralOrders,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: generalOrders.length,
              itemBuilder: (context, index) => OrderCard(generalOrders[index]),
            ),
          ),

          RefreshIndicator(
            onRefresh: _loadAssignedOrders,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: assignedOrders.length,
              itemBuilder: (context, index) => OrderCard(assignedOrders[index]),
            ),
          ),

        ],
      ),
    );
  }
}