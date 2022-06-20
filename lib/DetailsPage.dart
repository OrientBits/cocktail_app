import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final drink;

  DetailsPage(this.drink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment(0, -1),
            end: Alignment(0, 0)
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Details Page"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 100,),
            Hero(
              tag: drink["idDrink"],
              child: CircleAvatar(
                radius: 150,
                  backgroundImage: NetworkImage("${drink["strDrinkThumb"]}")),
            ),
            const SizedBox(height: 30,),
            Center(child: Text("${drink["strDrink"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        ),
      ),
    );
  }
}
