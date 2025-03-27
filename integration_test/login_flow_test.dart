import 'package:base/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login flow test (REAL)', (tester) async {
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'develop');
    await dotenv.load(fileName: '.env.$flavor');
    await mainApp();
    await tester
        .pumpAndSettle(const Duration(seconds: 5)); // Đợi widget dựng xong

    // 🔍 Tìm các widget cần tương tác
    final emailField = find.byKey(const Key('email_field'));
    final passwordField = find.byKey(const Key('password_field'));
    final loginButton = find.byKey(const Key('login_button'));

    // ✅ Đảm bảo tìm thấy widget
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    // ⌨️ Nhập email và password hợp lệ (phải tồn tại trên hệ thống thật)
    await tester.enterText(emailField, 'namnt@gmail.com');
    await tester.enterText(passwordField, 'Aa123456');

    // 🚀 Nhấn nút login
    await tester.tap(loginButton);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // 🏁 Kiểm tra đã chuyển sang màn hình thành công
    expect(find.text('Home'), findsOneWidget); // sửa lại nếu Home khác
  });
}
