import 'package:contactapp/android/views/editor-contact.view.dart';
import 'package:contactapp/android/widgets/contac-list-item.widget.dart';
import 'package:contactapp/android/widgets/search-appbar.widget.dart';
import 'package:contactapp/controllers/home.controller.dart';
import 'package:contactapp/models/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Instância do Controller Para Gestão De Estado
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller
        .search(""); // o Parâmetro de pesquisa vem vazio para retornar todos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Search App Bar - Tem que usar o PreferredSize
      //por conta do tamanho
      appBar: PreferredSize(
        child: SearchAppBar(
          controller: controller,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: controller.contacts.length,
          itemBuilder: (ctx, index) {
            return ContactListItem(
              model: controller.contacts[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: ContactModel(
                  id: 0,
                ),
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
