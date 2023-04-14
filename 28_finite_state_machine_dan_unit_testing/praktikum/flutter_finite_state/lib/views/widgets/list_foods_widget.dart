import 'package:flutter/material.dart';
import 'package:flutter_contactapp_mvvm/views/screens/food_screens/food_view_model.dart';
import 'package:provider/provider.dart';

class ListFood extends StatelessWidget {
  const ListFood({
    super.key,
    required this.foodViewModel,
  });

  final FoodViewModel foodViewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodViewModel.foods.length,
      itemBuilder: (context, index) {
        final food = foodViewModel.foods[index];
        return Padding(
          padding: const EdgeInsets.only(
              bottom: 0, top: 4.0, left: 12.0, right: 12.0),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff6750A4)),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Consumer<FoodViewModel>(
              builder: (context, foodViewModel, child) {
                return ListTile(
                  title: Row(
                    children: [
                      const Text('ID: '),
                      Text(food.id.toString()),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Text('Name: '),
                      Text(food.name),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
