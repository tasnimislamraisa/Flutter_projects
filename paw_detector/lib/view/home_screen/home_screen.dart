import 'package:paw_detector/my_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x004242),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text("Detect Your Pet",
              style: TextStyle(
              color: Color(0x7D9E9E),
              fontSize: 20
            ),
            ),
            SizedBox(height: 5,),
            Text("Cats And Dogs Detection App",
              style: TextStyle(
                  color: Color(0x7D9E9E),
                  fontSize: 30,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 50,),

          ],
        ),

      ),
    );
  }
}
