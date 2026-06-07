import 'package:flutter/material.dart';

void main() {
  runApp(const EstadoArgentinoApp());
}

class EstadoArgentinoApp extends StatelessWidget {
  const EstadoArgentinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Estado Argentino',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF74ACDF), // Celeste bandera argentina
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text(
              'Atributos del Estado Argentino',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            sliver: isDesktop
                ? SliverGrid(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _AttributeCard(attribute: _attributes[index]),
                      childCount: _attributes.length,
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _AttributeCard(attribute: _attributes[index]),
                      ),
                      childCount: _attributes.length,
                    ),
                  ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                child: Text(
                  'Desarrollado con fines educativos',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AttributeCard extends StatelessWidget {
  final StateAttribute attribute;

  const _AttributeCard({required this.attribute});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                attribute.icon,
                size: 32,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              attribute.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attribute.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          left: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ejemplo en Argentina:',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            attribute.example,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                                  height: 1.4,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StateAttribute {
  final String title;
  final String description;
  final String example;
  final IconData icon;

  const StateAttribute({
    required this.title,
    required this.description,
    required this.example,
    required this.icon,
  });
}

const List<StateAttribute> _attributes = [
  StateAttribute(
    title: 'Territorio',
    description: 'Es el espacio físico o geográfico donde el Estado ejerce su poder y jurisdicción de manera exclusiva.',
    example: 'Abarca el suelo continental americano de Argentina, el sector antártico reclamado, las Islas Malvinas y del Atlántico Sur (en reclamo de soberanía), así como el espacio aéreo y el Mar Argentino.',
    icon: Icons.map_outlined,
  ),
  StateAttribute(
    title: 'Población',
    description: 'Es el conjunto de personas que habitan en el territorio del Estado y que están sometidas a su poder y ordenamiento jurídico.',
    example: 'Los más de 46 millones de habitantes registrados en el Censo 2022, que incluyen tanto a ciudadanos argentinos nativos y naturalizados, como a extranjeros residentes en el país.',
    icon: Icons.people_alt_outlined,
  ),
  StateAttribute(
    title: 'Uso de la Fuerza',
    description: 'El Estado posee el monopolio legítimo de la coacción física. Es la única entidad autorizada a utilizar la fuerza para mantener el orden y hacer cumplir las leyes.',
    example: 'El accionar de las fuerzas de seguridad estatales (como la Policía Federal, la Gendarmería Nacional, la Prefectura Naval y las policías provinciales) para detener delincuentes o mantener el orden público.',
    icon: Icons.security_outlined,
  ),
  StateAttribute(
    title: 'Monopolio Fiscal',
    description: 'Es la potestad exclusiva del Estado para crear impuestos, recaudar tributos, administrar los recursos públicos y emitir moneda.',
    example: 'La recaudación de impuestos (como el IVA o Ganancias) a través de la AFIP (actualmente ARCA) y la emisión exclusiva del Peso Argentino por parte del Banco Central de la República Argentina (BCRA).',
    icon: Icons.account_balance_outlined,
  ),
  StateAttribute(
    title: 'Organización',
    description: 'Es la estructura burocrática y administrativa que permite al Estado llevar a cabo sus funciones mediante un conjunto de instituciones públicas.',
    example: 'La división de poderes a nivel nacional (Poder Ejecutivo presidido por el Presidente, el Congreso Nacional y la Corte Suprema), junto con ministerios, secretarías y organismos descentralizados como ANSES o el PAMI.',
    icon: Icons.account_tree_outlined,
  ),
  StateAttribute(
    title: 'Ordenamiento Normativo',
    description: 'Es el conjunto sistemático de leyes, normas y reglamentos que regulan la vida en sociedad y limitan el poder del propio Estado.',
    example: 'La Constitución Nacional (como ley suprema), el Código Civil y Comercial de la Nación, el Código Penal, y todas las leyes sancionadas por el Congreso que los ciudadanos y las instituciones deben cumplir.',
    icon: Icons.gavel_outlined,
  ),
  StateAttribute(
    title: 'Soberanía',
    description: 'Es el poder supremo que tiene el Estado para autogobernarse, tomar decisiones de manera independiente y no estar subordinado a ningún otro poder externo.',
    example: 'La capacidad del Congreso Argentino para sancionar leyes propias sin pedir autorización a otros países, o la firma de tratados internacionales como nación libre e independiente.',
    icon: Icons.public_outlined,
  ),
];
