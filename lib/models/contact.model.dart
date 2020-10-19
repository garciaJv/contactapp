// Sempre que necessário gerar um OBJETO (Model)
// Utilizar o site -> Json to Dart...

class ContactModel {
  int id = 0;
  String name = "";
  String email = "";
  String phone = "";
  String image = "assets/images/profile-picture.png";
  String addressLine1 = "";
  String addressLine2 = "";
  String cidade = "";

  ContactModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.addressLine1,
    this.addressLine2,
    this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'cidade': cidade,
    };
  }
}
