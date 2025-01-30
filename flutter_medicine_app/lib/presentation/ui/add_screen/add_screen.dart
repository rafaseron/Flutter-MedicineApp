import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/presentation/ui/add_screen/add_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_medicine_app/domain/model/medication.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _dateController = TextEditingController();
  final _annotationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddViewmodel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Medicamento'),
        ),
        body: Consumer<AddViewmodel>(
          builder: (context, viewModel, _) {
            if (viewModel.requestError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erro ao salvar medicamento!'),
                    backgroundColor: Colors.red,
                  ),
                );
                viewModel.changeRequestError(false);
              });
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome do Medicamento',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira o nome';
                          }
                          return null;
                        },
                        onChanged: (value) => viewModel.changeName(value),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _dosageController,
                        decoration: const InputDecoration(
                          labelText: 'Dosagem',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira a dosagem';
                          }
                          return null;
                        },
                        onChanged: (value) => viewModel.changeDosage(value),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          labelText: 'Data',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            // Formatação para exibição
                            final displayDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            _dateController.text = displayDate;

                            // Converter para UTC e formatar para o padrão do PocketBase
                            final utcDate = DateTime.utc(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              11, // Hora fixa conforme exemplo
                              0, // Minuto
                            );

                            // Formatar usando o padrão específico
                            final formattedDate =
                                DateFormat("yyyy-MM-dd HH:mm:ss.SSS")
                                    .format(utcDate);
                            viewModel.changeDate(
                                '$formattedDate.Z'); // Resultado: 2025-01-27 11:00:00.000Z
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor selecione a data';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _annotationController,
                        decoration: const InputDecoration(
                          labelText: 'Anotações',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 3,
                        onChanged: (value) => viewModel.changeAnnotation(value),
                      ),
                      const SizedBox(height: 20),
                      SwitchListTile(
                        title: const Text('Tratamento Finalizado'),
                        value: viewModel.medication.finishedStatus ?? false,
                        onChanged: (value) =>
                            viewModel.changeFinishedStatus(value!),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final viewModel = Provider.of<AddViewmodel>(context, listen: false);
            if (_formKey.currentState!.validate()) {
              viewModel.createMedicationRegister();
              if (!viewModel.requestError) {
                Navigator.pop(context);
              }
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _dateController.dispose();
    _annotationController.dispose();
    super.dispose();
  }
}
