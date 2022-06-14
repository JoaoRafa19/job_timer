import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({Key? key}) : super(key: key);

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _estimateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _estimateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Criar Novo Projeto',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                validator:
                    Validatorless.required('Nome do projeto é obrigatório'),
                decoration: InputDecoration(
                  labelText: 'Nome do Projeto',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: Validatorless.multiple([
                  Validatorless.required("Estimativa é obrigatória"),
                  Validatorless.number("Permitido somente números"),
                ]),
                keyboardType: TextInputType.number,
                controller: _estimateController,
                decoration: InputDecoration(
                  labelText: 'Estimativa de horas',
                  suffix: const Text("h"),
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 49,
              child: ElevatedButton(
                onPressed: () {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {}
                },
                child: const Text('Criar'),
              ),
            ),
            const Spacer(flex: 10)
          ],
        ),
      ),
    );
  }
}
