import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../entities/ingredient_entities.dart';
import '../main.dart';
import '../provider/ingredient_provider.dart';
import '../utilities/utility.dart';
import 'ingredient_list.dart';

class AnalyzingScreen extends StatefulWidget {
  final List<String> ingredientName;
  const AnalyzingScreen({Key? key, required this.ingredientName})
      : super(key: key);

  @override
  _AnalyzingScreenState createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  List<String> distinctIngredientName = [];
  late List<Ingredient> ingredientList;

  void RemoveDuplicates() {
    print('length:' + widget.ingredientName.length.toString());
    distinctIngredientName = widget.ingredientName.toSet().toList();
    print('length:' + distinctIngredientName.length.toString());
  }

  Future<List<Ingredient>> ExtractIngredientInfo(
      List<String> ingredientName) async {
    RemoveDuplicates();
    Provider.of<IngredientProvider>(context, listen: false)
        .ingredientList
        .clear();
    for (String name in distinctIngredientName) {
      await Provider.of<IngredientProvider>(context, listen: false)
          .getIngredientInfo(name);
    }
    ingredientList =
        await Provider.of<IngredientProvider>(context, listen: false)
            .ingredientList;
    return ingredientList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ExtractIngredientInfo(widget.ingredientName)
        .then((value) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    IngredientsList(IngredientList: ingredientList),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: ''),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReemKufi_Grey_Center(
              textValue: 'Analyzing Ingredient List',
              size: displayWidth(context) * 0.075),
          SizedBox(height: displayHeight(context) * 0.05),
          CircularProgressIndicator(
            color: const Color(0xFF4D4D4D),
          )
        ],
      )),
    );
  }
}
