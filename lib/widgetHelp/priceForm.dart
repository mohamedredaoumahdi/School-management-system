import 'package:flutter/material.dart';

class PriceForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("level"),
              Text("Year"),
            ],
          ),
          SizedBox(height: 25),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.directions_walk),
              hintText: 'kid name',
              labelText: 'kid name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.euro),
              hintText: 'Price',
              labelText: 'Price',
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
