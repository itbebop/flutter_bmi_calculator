import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/result/result_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightContorller = TextEditingController();
  final _weightContorller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _heightContorller.dispose();
    _weightContorller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      // Form은 key를 설정해야함
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // TextField에 잘못된 정보를 입력했을 때 에러처리// Form으로 감싸야 사용할 수 있다.
            TextFormField(
              controller: _heightContorller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '키',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print(value);
                  return '키를 입력하세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _weightContorller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '몸무게',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '몸무게를 입력하세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  // 유효하지 않을 때 return
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(height: double.parse(_heightContorller.text), weight: double.parse(_weightContorller.text)),
                    ),
                  );
                },
                child: const Text('결과')),
          ],
        ),
      ),
    );
  }
}
