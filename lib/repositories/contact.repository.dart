import 'package:contactapp/models/contact.model.dart';
import 'package:contactapp/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Aqui ficam todos os métodos de CRUD no Banco de Dados

class ContactRepository {
  // Método de inicialização do Banco de Dados
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME), // O join "une".
      onCreate: (db, version) {
        return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1, // Sempre versionar o banco.
    );
  }

  // Método Create Contact
  Future create(ContactModel model) async {
    try {
      final Database db = await _getDatabase(); // Instância do Banco de Dados
      await db.insert(
        TABLE_NAME, // TABLE
        model.toMap(), // VALUES
        conflictAlgorithm:
            ConflictAlgorithm.replace, // ALgoritmo de Conflito...
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método de Listagem dos Contatos
  Future<List<ContactModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();

      // A variável "maps" realiza uma consulta na nosso tabela
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
      return List.generate(
        maps.length,
        (i) {
          return ContactModel(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            image: maps[i]['image'],
            addressLine1: maps[i]['addressLine1'],
            addressLine2: maps[i]['addressLine2'],
            cidade: maps[i]['cidade'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<ContactModel>();
    }
  }

  // Método de Pesquisa (Consulta filtrada por parâmetro "term")
  Future<List<ContactModel>> search(String term) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
        where: "name LIKE ?",
        whereArgs: [
          '%$term%' // Primeiro -> ?
        ],
      );

      return List.generate(
        maps.length,
        (i) {
          return ContactModel(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            image: maps[i]['image'],
            addressLine1: maps[i]['addressLine1'],
            addressLine2: maps[i]['addressLine2'],
            cidade: maps[i]['cidade'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<ContactModel>();
    }
  }

  // Método de Filtragem de apenas UM contato
  Future<ContactModel> getContact(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
        where: "id = ?",
        whereArgs: [id],
      );
      return ContactModel(
        id: maps[0]['id'],
        name: maps[0]['name'],
        phone: maps[0]['phone'],
        email: maps[0]['email'],
        image: maps[0]['image'],
        addressLine1: maps[0]['addressLine1'],
        addressLine2: maps[0]['addressLine2'],
        cidade: maps[0]['cidade'],
      );
    } catch (ex) {
      print(ex);
      return new ContactModel();
    }
  }

  // Método Update Contact
  Future update(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME, // TABLE
        model.toMap(), // VALUES
        where: "id = ?", // CONDIÇÃO
        whereArgs: [model.id], // COMPLEMENTO PROTEGIDO DE SQL INJECTION
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método Delete Contact
  Future delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME, // TABLE
        where: "id = ?", // CONDIÇÃO
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método Update Image
  Future updateImage(int id, String imagePath) async {
    try {
      final Database db = await _getDatabase();
      final model = await getContact(id);

      model.image = imagePath;

      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
