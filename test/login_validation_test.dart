import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';

String _validUsername = "username";
String _validPassword = "password";
String _validUrl = NextcloudClientExtension.defaultNextCloudUri;

void main() => group("Test login validation:", () {
  test("Test assumed valid login details", () {
    expect(LoginInputGroup.validate(
      username: _validUsername,
      ncPassword: _validPassword,
      encPassword: _validPassword,
      customServer: _validUrl,
    ), isNull);
  });

  group("Email:", () {
    test("Empty email should fail", () {
      expect(LoginInputGroup.validate(
        username: "",
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: _validUrl,
      ), isNotNull);
    });
    test("Invalid email should fail", () {
      expect(LoginInputGroup.validate(
        username: "invalid email @",
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: _validUrl,
      ), isNotNull);
    });
  });

  group("Nextcloud password:", () {
    test("Empty password should fail", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: "",
        encPassword: _validPassword,
        customServer: _validUrl,
      ), isNotNull);
    });
    test("Non-empty password should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: "p",
        encPassword: _validPassword,
        customServer: _validUrl,
      ), isNull);
    });
  });

  group("Encryption password:", () {
    test("Empty password should fail", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: "",
        customServer: _validUrl,
      ), isNotNull);
    });
    test("Non-empty password should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: "p",
        customServer: _validUrl,
      ), isNull);
    });
  });

  group("URL:", () {
    test("null URL should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: null,
      ), isNull);
    });
    test("Empty URL should fail", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: "",
      ), isNotNull);
    });
    test("Invalid URL should fail", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: "invalid url",
      ), isNotNull);
    });
    test("URL with /nextcloud should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: "https://example.com/nextcloud",
      ), isNull);
    });
    test("URL with http (not https) should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: "http://example.com",
      ), isNull);
    });
    test("IP address without port should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: "http://192.168.0.1",
      ), isNull);
    });
    test("IP address with port should pass", () {
      expect(LoginInputGroup.validate(
        username: _validUsername,
        ncPassword: _validPassword,
        encPassword: _validPassword,
        customServer: "http://192.168.0.1:8080",
      ), isNull);
    });
  });
});
