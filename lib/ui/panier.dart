import 'package:flutter/material.dart';
import 'package:pizzerian/models/cart.dart';
import 'package:pizzerian/ui/share/total_widget.dart';
import 'package:flutter_spinbox/material.dart';

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
              itemCount: widget._cart.totalItems(),
                itemBuilder: (context, index) => _buildItem(widget._cart.getCartItem(index))
             ),
           ),
          Row(
            children: [
              Column(
                children: [
                  Text('Total HT'),
                  Text('TVA'),
                  Text('TOTAL TTC'),
                ],
              ),
              Column(
                children: [
                  Text('20€'),
                  Text('21.80€'),
                  Text('21.80€'),
                ],
              )
            ] 
          ),
         Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
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
        Image.asset(
          'assets/images/pizza/${cartItem.pizza.image}',
          height: 180,
          ),
        Column(
          children: [
            Text(cartItem.pizza.title),
            Text('input box'),//methode add
            Text('Sous total : '), //sous total prix de le pizza * nb de l'input
          ],
        )

      ],
    );
  }

}