import '../components/my_imports.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: colors.scaffoldBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact ",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Me",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: colors.whitePrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoRow(label: "Address_", value: "23 S 80 Road, Bendict, ME, US"),
              SizedBox(height: 15),
              InfoRow(label: "Phone_", value: "+01 123 456 789"),
              SizedBox(height: 15),
              InfoRow(label: "Email_", value: "islamtasnim65@gmail.com"),
              SizedBox(height: 15),
              InfoRow(label: "Website_", value: "www.tasnimislamraisa.com"),
            ],
          ),
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Your Name',
              hintStyle: const TextStyle(color: colors.whitePrimary),
              fillColor: colors.scaffoldBg,
              filled: true,
            ),
            style: const TextStyle(color: colors.whitePrimary),
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Your Message',
              hintStyle: const TextStyle(color: colors.whitePrimary),
              fillColor: colors.scaffoldBg,
              filled: true,
            ),
            style: const TextStyle(color: colors.whitePrimary),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your submission functionality here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.yellowPrimary,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Send Message",
              style: TextStyle(color: colors.scaffoldBgDarkest),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
            color: colors.yellowPrimary,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: colors.whitePrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
