import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/projects_screen.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    // Simple route using the ChildRoute
    ChildRoute('/', child: (_, __) => HomeScreen()),
    ChildRoute('/projects', child: (_, __) => ProjectsScreen()),
  ];
}
