

class Contact {

  final int id;
  final String name;
  final int account_number;

  Contact(this.id, this.name, this.account_number);

  @override
  String toString() {
    return "Contact {name: $name, Accont: $account_number}";
  }

}