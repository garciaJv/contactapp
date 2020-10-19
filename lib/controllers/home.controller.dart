import 'package:contactapp/models/contact.model.dart';
import 'package:contactapp/repositories/contact.repository.dart';
import 'package:mobx/mobx.dart';
part 'home.controller.g.dart';

//No mobx as variáveis são marcadas como
//"@observable e métodos como "@action"
// E na View teremos os Observers que serão os Widgets que o mobx
// vai alterar

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // Variáveis
  @observable
  bool showSearch = false;

  @observable
  ObservableList<ContactModel> contacts = new ObservableList<ContactModel>();

  // Métodos
  @action
  toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  search(String term) async {
    //Instância do Repository - Acesso a Dados
    final repository = new ContactRepository();

    contacts = new ObservableList<ContactModel>();
    var data = await repository.search(term); // data recebe o método search
    contacts
        .addAll(data); // Adiciona na lista 'contacts' tudo o que data retornar
  }
}
