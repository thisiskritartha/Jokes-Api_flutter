import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/jokes_model_list.dart';

class JokesController extends GetxController {
  var url = Uri.parse('https://dad-jokes.p.rapidapi.com/random/joke');
  JokesModelList? jokesList;
  var isLoading = false.obs;
  var setup = ''.obs;
  var pickup = ''.obs;
  var isVisible = false.obs;

  getJokesFromApi() async {
    try {
      isLoading(true);
      http.Response response = await http.get(url, headers: {
        'X-RapidAPI-Key': 'b8fff34395msh6cb1428c9bd7513p12fb4cjsn386a9259d4a4',
        'X-RapidAPI-Host': 'dad-jokes.p.rapidapi.com',
      });
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        jokesList = JokesModelList.fromJson(result);
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  getJokes() {
    setup.value = jokesList!.body![0].setup!;
    pickup.value = jokesList!.body![0].punchline!;
  }

  visiblePunchline() {
    isVisible.value = true;
  }
}
