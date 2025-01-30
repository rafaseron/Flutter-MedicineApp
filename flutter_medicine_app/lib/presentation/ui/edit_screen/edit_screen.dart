import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/presentation/ui/edit_screen/edit_viewmodel.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  // Instância do ViewModel
  late final EditViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = EditViewModel(); // Inicializa o ViewModel
  }

  @override
  void dispose() {
    _viewModel.dispose(); // Dispose do ViewModel (se necessário)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddScreen'),
      ),
      body: _buildBody(),
    );
  }

  // Corpo da tela com Column
  Widget _buildBody() {
    return ListenableBuilder(
      listenable: _viewModel, // Observa mudanças no ViewModel
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(_viewModel.texto, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              TextField(
                onChanged:
                    _viewModel.atualizarTexto, // Atualiza o texto no ViewModel
                decoration: const InputDecoration(
                  hintText: 'Digite algo...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
