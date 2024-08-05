// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const List<String> pizzas = ["assets/cheese.png", "assets/ham_cheese.png", "assets/diablo.png", "assets/hawaiian.png",
"assets/meat.png", "assets/pepperoni.png", "assets/chicken_cheese.png", "assets/bbq.png"];
const List<String> pizzaNames = ["CHEESE", "HAM AND CHEESE", "DIABLO", "HAWAIIAN", "MEAT", "PEPPERONI",
"CHICKEN CHEESE", "BBQ"];
const List<String> pizzaPrices = ["11.49", " 9.99 ", "11.99", "15.99", "10.99", "12.99",
"13.99", "12.99"];

List<int> is_in_cart = [0, 0, 0, 0, 0, 0, 0, 0];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          //padding: const EdgeInsets.all(12.0),
          crossAxisCount: 2,
          children: List.generate(8, (index) {
            String now = pizzaPrices[index];
            String button_value = "";
            if (is_in_cart[index] == 0){
              button_value= "+";
            }
            else{
              button_value= "-";
            }
            return Column(
              children: [
                Container(
                  width: 100.0,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(pizzas[index]),
                        fit: BoxFit.contain,
                      ),
                      ),
                    ),
                  ),
                ),
                Text(pizzaNames[index], style: TextStyle(
                        color: Colors.black,
                        fontSize: 18)),
                Row(
                  children: [
                    Container(width:30),
                    Text("$now \$", textAlign: TextAlign.right,),
                    Container(width:30),
                    ElevatedButton(
                      child: Text(button_value),
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                      onPressed: () {
                        setState((){
                          is_in_cart[index] = 1-is_in_cart[index];
                          if (is_in_cart[index] == 0){
                            button_value= "+";
                          }
                          else{
                            button_value= "-";
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      );
  }
}