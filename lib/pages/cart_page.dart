import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/menu_page.dart';

List<int> quantity = [0, 0, 0, 0, 0, 0, 0, 0];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<int> inCartNow = [];
    
    for (int i = 0; i < is_in_cart.length; i++){
      if (is_in_cart[i] == 1){
        inCartNow.add(i);
        quantity[i] = 1;
      }
    }
    return Scaffold(
      body: GridView.count(
          padding: const EdgeInsets.all(12.0),
          crossAxisCount: 1,
          children: List.generate(inCartNow.length, (index2) {
            int pizzaNumber = inCartNow[index2];
            double totalPrice = quantity[pizzaNumber]*(double.parse(pizzaPrices[pizzaNumber]));
            
            return Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 300,
                      //width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(pizzas[pizzaNumber]),
                          fit: BoxFit.scaleDown,
                        ),
                    )
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 200,
                          //width: 100,
                          child: Text("${totalPrice}\$", style: TextStyle(
                            color: Colors.black,
                            fontSize: 24)),
                        ),
                        Container(
                          child: Card(
                            color: Colors.blue,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: 
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            setState(() {
                                              quantity[pizzaNumber]--;
                                              if (quantity[pizzaNumber] == 0){
                                                is_in_cart[pizzaNumber] = 0;
                                              }
                                            });
                                          },
                                        ),
                                        Text(quantity[pizzaNumber].toString()),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              quantity[pizzaNumber]++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                            )),
                        ),
                      ],
                    ),
                  )
                ],
              )
            );
          }),
        ),
    );
  }
}