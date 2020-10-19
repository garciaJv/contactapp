import 'package:contactapp/android/views/home.view.dart';
import 'package:contactapp/models/contact.model.dart';
import 'package:contactapp/repositories/contact.repository.dart';
import 'package:flutter/material.dart';

class EditorContactView extends StatefulWidget {
  final ContactModel model;
  EditorContactView({this.model});

  @override
  _EditorContactViewState createState() => _EditorContactViewState();
}

class _EditorContactViewState extends State<EditorContactView> {
  // Declarando os Estados Notáveis
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  // Instância do Repository (Classe de Acesso aos Dados)
  final _repository = new ContactRepository();

  //Funções
  onSubmit() {
    // Se NÃO conseguir validar o form...
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (widget.model.id == 0)
      create();
    else
      update();
  }

  // Método Create Contact
  create() {
    widget.model.id = null;
    widget.model.image = null;

    _repository.create(widget.model).then((_) {
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  // Método Update Contact
  update() {
    _repository.update(widget.model).then((_) {
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  // Dando tudo certo...
  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  // Dando erro...
  onError() {
    final snackBar = SnackBar(
      content: Text('Ops, algo deu errado!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // Fim Funções
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: widget.model.id == 0
            ? Text("Novo Contato")
            : Text("Editar Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: "Nome:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                initialValue: widget.model?.name,
                onChanged: (val) {
                  widget.model.name = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Telefone:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                initialValue: widget.model?.phone,
                onChanged: (val) {
                  widget.model.phone = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Telefone inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                initialValue: widget.model?.email,
                onChanged: (val) {
                  widget.model.email = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                child: Text(
                  "Endereço",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Logradouro:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                initialValue: widget.model?.addressLine1,
                onChanged: (val) {
                  widget.model.addressLine1 = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Logradouro inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Bairro:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                initialValue: widget.model?.addressLine2,
                onChanged: (val) {
                  widget.model.addressLine2 = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Bairro inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Cidade:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                initialValue: widget.model?.cidade,
                onChanged: (val) {
                  widget.model.cidade = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Cidade inválida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  onPressed: onSubmit,
                  color: Theme.of(context).primaryColor,
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
