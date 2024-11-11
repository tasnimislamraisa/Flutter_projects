import '../components/my_imports.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text("TR",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: colors.yellowSecondary,
        ),
      ),
    );
  }
}
