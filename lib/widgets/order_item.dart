  import 'dart:math';
  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';
  import '../models/order.dart' as ord;

  class OrderItem extends StatefulWidget {

    final ord.OrderItem order;

    OrderItem(this.order);

    @override
    _OrderItemState createState() => _OrderItemState();
  }

  class _OrderItemState extends State<OrderItem> {
    var _expanded = false;

    @override
    Widget build(BuildContext context) {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('total price : \$${widget.order.amount}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('date : $widget.order.dateTime'),
                  Text('Status: ${widget.order.status}'),
                  Text('Payment Status: ${widget.order.paymentStatus ? 'Paid' : 'Unpaid'}',
                    style: TextStyle(color: widget.order.paymentStatus ? Colors.green:Colors.red),),
                ],
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(widget.order.products.length * 20.0 + 10, 100),
                child: ListView(
                  children: widget.order.products
                      .map(
                        (prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          prod.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${prod.quantity} x \$${prod.price}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                      .toList(),
                ),
              )
          ],
        ),
      );
    }
  }
