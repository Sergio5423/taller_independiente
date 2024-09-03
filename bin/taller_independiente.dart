import 'user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // URL de la API
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  final response = await http.get(url);

  print(response);

  List<User> users = fetchUsers(response);

  users.forEach((user) {
    print('ID: ${user.id}');
    print('Name: ${user.name}');
    print('Username: ${user.username}');
    print('Email: ${user.email}');
    print('-----------------------------------------------------');
  });

  filterUsername(users);
  filterBiz(users);
}

List<User> fetchUsers(response) {
  // Verificar si la petición fue exitosa
  List<User> users = [];
  if (response.statusCode == 200) {
    // Parsear la respuesta JSON a una lista
    List<dynamic> jsonData = json.decode(response.body);

    // Crear una lista de Users
    users = jsonData.map((json) => User.fromJson(json)).toList();

    return users;
  } else {
    // Manejo de errores
    print('Error al obtener los datos: ${response.statusCode}');
    return users;
  }
}

void filterUsername(users) {
  String userName;
  users.forEach((user) {
    userName = user.name;
    if (userName.length >= 6) {
      print('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/');
      print('Usuario cuyo nombre de usuario tiene más de 6 caracteres');
      print('ID: ${user.id}');
      print('Name: ${user.name}');
      print('Username: ${user.username}');
      print('Email: ${user.email}');
      print('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/');
    }
  });
}

void filterBiz(users) {
  String email;
  int cont = 0;
  users.forEach((user) {
    email = user.email;
    if (email.contains('biz')) {
      cont++;
      print('?¡?¡?¡?¡¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?');
      print('Usuario cuyo email pertenece al dominio Biz');
      print('ID: ${user.id}');
      print('Name: ${user.name}');
      print('Username: ${user.username}');
      print('Email: ${user.email}');
      print('?¡?¡?¡?¡¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?¡?');
    }
  });
  print('Cantidad de usuarios cuyo email pertenece al dominio Biz: $cont');
}
