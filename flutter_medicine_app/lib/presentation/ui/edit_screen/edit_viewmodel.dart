import 'package:flutter/material.dart';

class EditViewModel extends ChangeNotifier {
  // Variáveis de estado
  String _texto = "Texto Inicial";

  // Getter para acessar o texto
  String get texto => _texto;

  // Método para atualizar o texto e notificar a UI
  void atualizarTexto(String novoTexto) {
    _texto = novoTexto;
    notifyListeners(); // Atualiza os widgets que dependem deste ViewModel
  }

  // Dispose para limpar recursos (opcional)
  @override
  void dispose() {
    super.dispose();
    // Feche streams ou outros recursos aqui
  }
}
