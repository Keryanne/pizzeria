import 'package:flutter/material.dart';
import 'package:pizzerian/models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, { Key? key }) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // A faire en utilisant widget._cart
              
            ),
          ),
          Row(
            children: [
              Text('Total'),
              Text('30 €'),
            ],
          ),
          Container(
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: () {
                print('Valider');
              },
            )),
        ],
      ),
    );
  }
  Widget _buildItem(CartItem cartItem) {
    return Row(
      children: [
        Text('Image'),
        Column(
          children: [
            Text(cartItem.pizza.title),
            Text('Prix avec InputSpinboxWidget'),
            Text('Sous_total'),
          ],
        )

      ],
    );
  }

}