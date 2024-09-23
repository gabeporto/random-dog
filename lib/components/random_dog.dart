import 'package:flutter/material.dart';

class RandomDog extends StatelessWidget {
  final String imageUrl;
  final String userName;

  RandomDog({required this.imageUrl, required this.userName});

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Bom dia';
    } else if (hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imageUrl),
        const SizedBox(height: 16), 
        Text(
          '${_getGreetingMessage()}, $userName!',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
