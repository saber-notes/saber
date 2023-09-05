import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';

void main() => group('Test login validation:', () {
  group('Email:', () {
    test('Valid username should pass', () {
      expect(LoginInputGroup.validateUsername('username'), isNull);
    });
    test('Valid email should pass', () {
      expect(LoginInputGroup.validateUsername('user@example.com'), isNull);
    });
    test('Empty email should fail', () {
      expect(LoginInputGroup.validateUsername(''), isNotNull);
    });
    test('Invalid email should fail', () {
      expect(LoginInputGroup.validateUsername('invalid email @'), isNotNull);
    });
  });

  group('Nextcloud password:', () {
    test('Empty password should fail', () {
      expect(LoginInputGroup.validateNcPassword(''), isNotNull);
    });
    test('Non-empty password should pass', () {
      expect(LoginInputGroup.validateNcPassword('p'), isNull);
    });
  });

  group('Encryption password:', () {
    test('Empty password should fail', () {
      expect(LoginInputGroup.validateEncPassword(''), isNotNull);
    });
    test('Non-empty password should pass', () {
      expect(LoginInputGroup.validateEncPassword('p'), isNull);
    });
  });

  group('URL:', () {
    test('null URL should fail', () {
      expect(LoginInputGroup.validateCustomServer(null), isNotNull);
    });
    test('Empty URL should fail', () {
      expect(LoginInputGroup.validateCustomServer(''), isNotNull);
    });
    test('Default URL should pass', () {
      expect(LoginInputGroup.validateCustomServer(NextcloudClientExtension.defaultNextcloudUri.toString()), isNull);
    });
    test('Invalid URL should fail', () {
      expect(LoginInputGroup.validateCustomServer('invalid url'), isNotNull);
    });
    test('URL with /nextcloud should pass', () {
      expect(LoginInputGroup.validateCustomServer('https://example.com/nextcloud'), isNull);
    });
    test('URL with http (not https) should pass', () {
      expect(LoginInputGroup.validateCustomServer('http://example.com'), isNull);
    });
    test('URL with ftp protocol should fail', () {
      expect(LoginInputGroup.validateCustomServer('ftp://example.com'), isNotNull);
    });
    test('IP address without port should pass', () {
      expect(LoginInputGroup.validateCustomServer('http://192.168.0.1'), isNull);
    });
    test('IP address with port should pass', () {
      expect(LoginInputGroup.validateCustomServer('http://192.168.0.1:8080'), isNull);
    });
  });

  group('URL prefixing:', () {
    test("URL starting with 'http' should stay the same", () {
      String url = 'http://example.com';
      String prefixed = LoginInputGroup.prefixUrlWithHttps(url);
      expect(prefixed, url);
    });
    test("URL starting with 'https' should stay the same", () {
      String url = 'https://example.com';
      String prefixed = LoginInputGroup.prefixUrlWithHttps(url);
      expect(prefixed, url);
    });
    test("URL without 'https?' should be prefixed", () {
      String url = 'example.com';
      String prefixed = LoginInputGroup.prefixUrlWithHttps(url);
      expect(prefixed, 'https://$url');
    });
  });
});
