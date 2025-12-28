import 'package:flutter_test/flutter_test.dart';
import 'package:studynest/data/models/user.dart';

void main() {
  group('User Model Test', () {
    test('fromJson creates correct User instance', () {
      final json = {
        'id': '123',
        'name': 'Test User',
        'email': 'test@example.com',
        'mobile': '1234567890',
        'profile_picture': 'pic.png',
      };

      final user = User.fromJson(json);

      expect(user.id, '123');
      expect(user.name, 'Test User');
      expect(user.email, 'test@example.com');
      expect(user.mobile, '1234567890');
      expect(user.profilePicture, 'pic.png');
    });

    test('toJson creates correct Map', () {
      final user = User(
        id: '123',
        name: 'Test User',
        email: 'test@example.com',
        mobile: '1234567890',
        profilePicture: 'pic.png',
      );

      final json = user.toJson();

      expect(json['id'], '123');
      expect(json['name'], 'Test User');
      expect(json['email'], 'test@example.com');
      expect(json['mobile'], '1234567890');
      expect(json['profile_picture'], 'pic.png');
    });
  });
}
