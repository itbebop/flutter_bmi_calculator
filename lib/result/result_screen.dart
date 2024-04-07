import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({super.key, required this.height, required this.weight});
  String _calcBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      return '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  IconData _buildIcon(double bmi) {
    IconData icon = Icons.sentiment_dissatisfied;
    if (bmi >= 23) {
      icon = Icons.sentiment_very_dissatisfied;
    } else if (bmi >= 18.5) {
      icon = Icons.sentiment_satisfied;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    final double bmi = weight / ((height / 100) * (height / 100));
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calcBmi(bmi),
              style: const TextStyle(fontSize: 36),
            ),
            Icon(
              _buildIcon(bmi),
              color: Colors.green,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
