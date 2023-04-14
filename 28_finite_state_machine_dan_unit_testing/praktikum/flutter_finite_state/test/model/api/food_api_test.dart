import 'package:flutter_contactapp_mvvm/models/api/food_api.dart';
import 'package:flutter_contactapp_mvvm/models/food_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'food_api_test.mocks.dart';

@GenerateMocks([FoodApi])
void main() {
  group('Food API', () {
    FoodApi contactApi = MockFoodApi();
    test('Get all Food Menu returns Data', () async {
      when(contactApi.getFoods()).thenAnswer(
        (_) async => <Food>[
          Food(id: 1, name: 'a'),
        ],
      );

      var foods = await FoodApi().getFoods();
      expect(
        foods.isNotEmpty,
        true,
      );
    });
  });
}
