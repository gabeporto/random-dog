import 'package:dog_flutter_application/components/random_dog.dart';
import 'package:dog_flutter_application/controllers/dog_controller.dart';
import 'package:dog_flutter_application/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:dog_flutter_application/components/app_bar_component.dart';
import 'package:dog_flutter_application/controllers/access_controller.dart';
import 'package:dog_flutter_application/controllers/user_controller.dart';
import 'package:dog_flutter_application/models/user.dart';
import 'package:dog_flutter_application/views/login_page.dart';
import 'package:dog_flutter_application/views/profile_page.dart';

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  User? _loggedUser;
  Dog? _dog;

  @override
  void initState() {
    super.initState();
    _loadLoggedUser();
    _loadDogImage();
  }

  Future<void> _loadLoggedUser() async {
    User user = await UserController.instance.getUserByIdFromJwtToken();
    setState(() {
      _loggedUser = user;
    });
  }

  Future<void> _loadDogImage() async {
    Dog dog = await DogController.instance.getRandomDog();
    setState(() {
      _dog = dog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 228, 247),
      appBar: appBar(
        leading: false,
        title: 'Random Dog',
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'Perfil',
                  child: const Text('Perfil'),
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => ProfilePage(user: _loggedUser,)));
                  },
                ),
                PopupMenuItem(
                  value: 'Logout',
                  child: const Text('Logout'),
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    bool logout = await AccessController.instance.logout();

                    if(logout){
                      navigator.pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginPage())
                      );
                    }
                  },
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: _loggedUser != null ? 
                    Image.network(_loggedUser!.image, width: 40, height: 40) : 
                    const Icon(Icons.person, color: Colors.grey,),
                ),
              ),
          ),
        ],
      ),
      body: Center(
        child: _dog != null 
          ? RandomDog(imageUrl: _dog!.imageUrl, userName: _loggedUser?.firstName ?? "Usuário") 
          : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadDogImage,
        backgroundColor: Colors.purple[300],
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
