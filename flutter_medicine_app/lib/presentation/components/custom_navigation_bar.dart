import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex; // Índice recebido do pai
  final Function(int) onTap; // Callback para atualizar o índice

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap, // Repassa o clique para o pai
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Medicação',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Adicionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Histórico',
        ),
      ],
    );
  }
}
