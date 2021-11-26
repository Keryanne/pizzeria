import 'package:flutter/material.dart';
import 'package:pizzerian/models/cart.dart';
import 'package:pizzerian/ui/share/input_spinbox_widget.dart';
import 'package:pizzerian/ui/share/total_widget.dart';

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
              Padding(padding: EdgeInsets.all(16.0),),
              Column(
                children: [
                  Text(' ${widget._cart.totalItems()} €'),
                  Text('20%'),
                  Text(' ${widget._cart.totalPanier()} €'),
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

//double _quantity = 1;


  Widget _buildItem(CartItem cartItem) { //case avec les données des pizzas
  
  double _subtotal = (cartItem.pizza.total * cartItem.quantity);
  
    return Row(
      children: [
        Image.asset(
          'assets/images/pizza/${cartItem.pizza.image}',
          height: 180,
          ),
          Padding(padding: EdgeInsets.all(10.0),),
        Column(
          children: [
            Text(cartItem.pizza.title),
             Row(
               children: <Widget>[
                 Text('${cartItem.pizza.total} €'),
                  Padding(padding: EdgeInsets.all(16.0),),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                       widget._cart.removeProduct(cartItem.pizza);
                    });
                  },
                ),

                Text(' ${cartItem.quantity}'),

                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget._cart.addProduct(cartItem.pizza);
                    });
                   
                  },
                ),
              ],
             ),
            Text('Sous total : ${_subtotal} €'), //sous total prix de le pizza * nb de l'input
          ],
        )

      ],
    );
  }

}