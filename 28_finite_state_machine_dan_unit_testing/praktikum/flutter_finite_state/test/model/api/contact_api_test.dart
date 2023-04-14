import 'package:flutter_contactapp_mvvm/models/api/contact_api.dart';
import 'package:flutter_contactapp_mvvm/models/contact_model.dart';
import 'package:mockito/mockito.dart';

import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'contact_api_test.mocks.dart';

@GenerateMocks([ContactApi])
void main() {
  group('Contact API', () {
    ContactApi contactApi = MockContactApi();
    test('Get all Contacts returns Data', () async {
      when(contactApi.getContacts()).thenAnswer(
        (_) async => <Contact>[
          Contact(id: 1, name: 'a', phone: '0'),
        ],
      );

      var contacts = await ContactApi().getContacts();
      expect(
        contacts.isNotEmpty,
        true,
      );
    });
  });
}
