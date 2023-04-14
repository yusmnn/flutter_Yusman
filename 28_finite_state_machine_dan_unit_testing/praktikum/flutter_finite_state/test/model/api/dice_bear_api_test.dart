import 'package:flutter/material.dart';
import 'package:flutter_contactapp_mvvm/models/api/dice_bear_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'dice_bear_api_test.mocks.dart';

@GenerateMocks([DiceBearApi])
void main() {
  group('DiceBearAPi', () {
    DiceBearApi contactApi = MockDiceBearApi();
    test('Get all Contacts returns Data', () async {
      when(contactApi.getAvatar(TextEditingController())).thenAnswer(
        (_) async => <String>[
          'John',
        ],
      );

      var avatar = await DiceBearApi().getAvatar(TextEditingController());
      expect(
        avatar.isNotEmpty,
        true,
      );
    });
  });
}
