import 'dart:convert';
import 'package:hotel_task/domain/model/book.dart';
import 'package:hotel_task/domain/model/information.dart';
import 'package:hotel_task/domain/model/number.dart';
import 'package:http/http.dart' as http;

class InformationService{
  Future<Information> getInformation() async{
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d'));

    final data = jsonDecode(response.body);
    return Information.fromJson(data);
  }
    Future<Number> getNumber() async{
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2'));

    final data = jsonDecode(response.body);
    return Number.fromJson(data);
  }
    Future<Book> getBook() async{
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff'));

    final data = jsonDecode(response.body);
    return Book.fromJson(data);
  }

}