import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/list_foods_widget.dart';
import 'food_view_model.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodViewModel>(context, listen: false).getAllFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodViewModel = Provider.of<FoodViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
        centerTitle: true,
      ),
      drawer: const RouterWidget(),
      body: Center(
        child: foodViewModel.foods.isEmpty
            ? const CircularProgressIndicator()
            : ListFood(
                foodViewModel: foodViewModel,
              ),
      ),
    );
  }
}
