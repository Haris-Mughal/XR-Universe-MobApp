import 'package:flutter/material.dart';
import 'model_viewer_screen.dart';

void main() {
  runApp(const AstroExplorerApp());
}

class AstroExplorerApp extends StatelessWidget {
  const AstroExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AstroExplorerScreen(),
    );
  }
}

class AstroExplorerScreen extends StatefulWidget {
  const AstroExplorerScreen({super.key});

  @override
  _AstroExplorerScreenState createState() => _AstroExplorerScreenState();
}

class _AstroExplorerScreenState extends State<AstroExplorerScreen> {
  final List<Map<String, dynamic>> astroData = [
    {
      'title': 'Solar System',
      'description': 'Our solar system is a collection of planets, moons, and small celestial bodies orbiting the Sun.',
      'image': 'assets/images/solarsystem.png',
      'color': Colors.blueAccent,
      'modelSrc': 'assets/models/solar_system.glb',
    },
    {
      'title': 'Mercury',
      'description':
      'Mercury is the smallest planet in the Solar System and the closest to the Sun. It has no atmosphere to retain heat.',
      'image': 'assets/images/mercury.png',
      'color': Colors.grey,
      'modelSrc': 'assets/models/mercury.glb',
    },
    {
      'title': 'Venus',
      'description':
      'Venus has a thick, toxic atmosphere that traps heat, making it the hottest planet in the Solar System.',
      'image': 'assets/images/venus.png',
      'color': Colors.orange,
      'modelSrc': 'assets/models/venus.glb',
    },
    {
      'title': 'Earth',
      'description':
      'Earth is rounded into an ellipsoid with a circumference of about 40,000 km. It is the densest planet in the Solar System.',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'modelSrc': 'assets/models/earth.glb',
    },
    {
      'title': 'Mars',
      'description':
      'The surface of Mars is orange-red because it is covered in iron oxide dust, giving it the nickname "The Red Planet".',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'modelSrc': 'assets/models/mars.glb',
    },
    {
      'title': 'Jupiter',
      'description':
      'Jupiter is the largest planet in the Solar System. It is known for its Great Red Spot, a massive storm.',
      'image': 'assets/images/jupiter.png',
      'color': Colors.brown,
      'modelSrc': 'assets/models/jupiter.glb',
    },
    {
      'title': 'Saturn',
      'description':
      'The planet has a bright and extensive system of rings composed of ice particles.',
      'image': 'assets/images/saturn.png',
      'color': Colors.yellow,
      'modelSrc': 'assets/models/saturn.glb',
    },
    {
      'title': 'Uranus',
      'description':
      'Uranus is a gas giant with a blue-green hue due to methane in its atmosphere. It rotates on its side.',
      'image': 'assets/images/uranus.png',
      'color': Colors.cyan,
      'modelSrc': 'assets/models/uranus.glb',
    },
    {
      'title': 'Neptune',
      'description':
      'Neptune is the farthest planet from the Sun. It is known for its deep blue color and supersonic winds.',
      'image': 'assets/images/neptune.png',
      'color': Colors.blueAccent,
      'modelSrc': 'assets/models/neptune.glb',
    },
    {
      'title': 'Sun',
      'description':
      'The Sun orbits the Galactic Center at a distance of 24,000 - 26,000 light-years. From Earth, it is about 8 light-minutes away.',
      'image': 'assets/images/sun.png',
      'color': Colors.orangeAccent,
      'modelSrc': 'assets/models/sun.glb',
    },
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Explore the Solar System', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // Horizontal planet slider
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: astroData.length,
              itemBuilder: (context, index) {
                final isActive = index == _currentIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: isActive ? 40 : 20,
                    height: isActive ? 40 : 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(astroData[index]['image']!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Scrollable content for all planets
          Expanded(
            child: ListView.builder(
              itemCount: astroData.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final planet = astroData[index];
                return AstroCard(
                  title: planet['title']!,
                  description: planet['description']!,
                  imagePath: planet['image']!,
                  color: planet['color']!,
                  isHighlighted: index == _currentIndex,
                  modelSrc: planet['modelSrc']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AstroCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color color;
  final bool isHighlighted;
  final String modelSrc; // Add this line



  const AstroCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.isHighlighted,
    required this.modelSrc, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isHighlighted ? color : Colors.white24),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
              color: Colors.white.withAlpha(51),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelViewerScreen(modelSrc: modelSrc),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          imagePath,
                          width: 16,
                          height: 16,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 4),
                        const Text('EXPLORE'),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite_border, color: Colors.white70),
                      SizedBox(width: 8),
                      Icon(Icons.share, color: Colors.white70),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}