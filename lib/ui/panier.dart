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
            Container(
              decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2.0,
                    blurRadius: 10,
                    offset: Offset(4.0, 4.0)
                  )
               ]),
              child: Table(
                children: [
                  TableRow(children: [
                    Column(children: [Text('', style: TextStyle(height: 1.0))]),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Total HT', style: TextStyle(height: 1.8))]),
                    Column(children: [Text(' ${widget._cart.totalPanierHT()} €', style: TextStyle(height: 1.8))])
                    ]),
                    TableRow(children: [
                    Column(children: [Text('', style: TextStyle(height: 1.0))]),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('TVA', style: TextStyle(height: 1.8))]),
                    Column(children: [Text(' 1.2 €', style: TextStyle(height: 1.8))])
                    ]),
                    TableRow(children: [
                    Column(children: [Text('', style: TextStyle(height: 1.0))]),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Total TTC', style: TextStyle(height: 1.8, color: Colors.blue.shade800,))]),
                    Column(children: [Text(' ${widget._cart.totalPanier()} €', style: TextStyle(height: 1.8, color: Colors.blue.shade800,))])
                    ]),
                ],
              ),
            ),
          /* Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2.0,
                    blurRadius: 10,
                    offset: Offset(4.0, 4.0)
                  )
               ]),
               child:  Padding(
                 padding: const EdgeInsets.all(3.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Total HT', style: TextStyle(height: 1.8),),
                         Text('TVA', style: TextStyle(height: 1.8),),
                         Text('TOTAL TTC', style: TextStyle(color: Colors.blue.shade800, height: 1.8),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(30.0),),
                    
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                        Text(' ${widget._cart.totalPanierHT()} €', style: TextStyle(height: 1.8),),
                         Text('1.20 €', style: TextStyle(height: 1.8),),
                         Text(' ${widget._cart.totalPanier()} €', style: TextStyle(color: Colors.blue.shade800, height: 1.8),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(right: 20.0),),
                    ] 
                  ),
               ), */
          //    ),
          //  ),
         Padding(padding: EdgeInsets.only(top: 8.0, bottom: 12.0),),

          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Container(
              child: ElevatedButton(
                style: ButtonStyle( 
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red.shade800)),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text('VALIDER LE PANIER'),
                  ],
                ),
                onPressed: () {
                  MaterialPageRoute(builder: (context) => Panier(widget._cart));
                  print('Valider');
                },
              )),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) { //case avec les données des pizzas
  
  double _subtotal = (cartItem.pizza.total * cartItem.quantity);
  
    return Row(
      children: [
        Image.asset(
          'assets/images/pizza/${cartItem.pizza.image}',
          height: 132,
          ),
          Padding(padding: EdgeInsets.all(3.0),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cartItem.pizza.title, style: TextStyle(fontWeight: FontWeight.bold, height: 1.8),),
            Text('${cartItem.pizza.total} €', style: TextStyle(color: Colors.grey.shade700,height: 1.8),),
            Text('Sous total : ${_subtotal} €', style: TextStyle(color: Colors.blue.shade800, height: 1.8), ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  widget._cart.removeProduct(cartItem.pizza);
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.8, color: Colors.grey,),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' ${cartItem.quantity}'),
              )
              ),
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
      ],
    );
  }
}