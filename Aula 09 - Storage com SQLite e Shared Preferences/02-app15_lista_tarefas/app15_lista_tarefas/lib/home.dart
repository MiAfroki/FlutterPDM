import 'package:flutter/material.dart';
import 'package:app14_frase_preferencias/helper/AnnotationHelper.dart';
import 'package:app14_frase_preferencias/model/Annotation.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _titleController = TextEditingController();
  var _database = AnnotationHelper();
  List<Annotation> _annotations = List<Annotation>();

  _showRegisterScreen({Annotation annotation}) {
    String textSaveUpdate = "";
    if (annotation == null) {
      _titleController.text = "";
      textSaveUpdate = "Criar";
    } else {
      _titleController.text = annotation.title;
      textSaveUpdate = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textSaveUpdate tarefa"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: InputDecoration( labelText: "Nome da Tarefa" ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _saveUpdateAnnotation(selectedAnnotation: annotation);

                    Navigator.pop(context);
                  },
                  child: Text(textSaveUpdate))
            ],
          );
        });
  }

  _recoverAnnotations() async {
    List recoveredAnnotations = await _database.recoverAnnotations();

    List<Annotation> temporaryList = List<Annotation>();
    for (var item in recoveredAnnotations) {
      Annotation annotation = Annotation.fromMap(item);
      temporaryList.add(annotation);
    }

    setState(() {
      _annotations = temporaryList;
    });
    temporaryList = null;
  }

  _saveUpdateAnnotation({Annotation selectedAnnotation}) async {
    String title = _titleController.text;

    if (selectedAnnotation == null) {
      Annotation annotation =
      Annotation(title, DateTime.now().toString());
      int result = await _database.saveAnnotation(annotation);
    } else {
      selectedAnnotation.title = title;
      selectedAnnotation.date = DateTime.now().toString();
      int result = await _database.updateAnnotation(selectedAnnotation);
    }

    _titleController.clear();
    _recoverAnnotations();
  }

  _formatDate(String date) {
    initializeDateFormatting("pt_BR");
    var formatter = DateFormat.yMd("pt_BR");

    DateTime convertedDate = DateTime.parse(date);
    String formattedDate = formatter.format(convertedDate);
    return formattedDate;
  }

  _removeAnnotation(int id) async {
    await _database.removeAnnotation(id);

    _recoverAnnotations();
  }

  @override
  void initState() {
    super.initState();
    _recoverAnnotations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _annotations.length,
                  itemBuilder: (context, index) {
                    final annotation = _annotations[index];

                    return Card(
                      child: ListTile(
                        title: Text(annotation.title),
                        subtitle: Text(
                            "${_formatDate(annotation.date)}}"
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _showRegisterScreen(annotation: annotation);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removeAnnotation(annotation.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _showRegisterScreen();
          }),
    );
  }
}