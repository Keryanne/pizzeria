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
              itemBuilder: (context, index) => InkWell(
                 child: _buildItem(widget._cart),
              ),
             ),
           ),
          Row(
            children: [ Table(
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                    ),
                  ]
                ),
              ]
            ),], 
          ),
          Container(
            child: ElevatedButton(
              child: Text('VALIDER LE PANIER'),
              onPressed: () {
                MaterialPageRoute(builder: (context) => Panier(widget._cart));
                print('Valider');
              },
            )),
        ],
      ),
    );
  }
  Widget _buildItem(CartItem cartItem) { //case avec les données des pizzas
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