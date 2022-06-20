import 'dart:convert';
import 'package:cocktail_app/DetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var API = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res;
  var drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    res = await http.get(Uri.parse(API));
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    print(drinks.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cocktail App"),
      ),
      body: Center(
        child: res != null
            ? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  var drink = drinks[index];
                  return Container(
                    color: Colors.orange.shade50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 0),
                      child: Card(
                        shadowColor: Colors.orange.shade50,
                        elevation: 2.5,
                        child: InkWell(
                          onTap: () {
                            print("Clicked");
                          },
                          child: ListTile(
                              title: Text("${drink["strDrink"]}"),
                              leading: Hero(
                                tag: drink["idDrink"],
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${drink["strDrinkThumb"]}")),
                              ),
                              subtitle: Text("ID: ${drink["idDrink"]}"),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsPage(drink);
                                }));
                              }),
                        ),
                      ),
                    ),
                  );
                })
            : const CircularProgressIndicator(),
      ),
    );
  }
}
