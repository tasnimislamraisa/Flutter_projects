import '../components/my_imports.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height ,
      constraints: const BoxConstraints(minHeight: 350.0),
      padding: const EdgeInsets.all(80),
      color: colors.scaffoldBg,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Contact ",
                style: TextStyle(
                  fontSize: 50,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Me",
                style: TextStyle(
                  fontSize: 50,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: Utils.getScreenWidth(context) / 2,
            child: const Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                color: colors.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Address_ ",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: colors.yellowPrimary,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "23 S 80 Road, Bendict, ME, US",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                              color: colors.whitePrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "Phone_ ",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: colors.yellowPrimary,
                          ),
                        ),
                        Text(
                          "+01 123 456 789",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: colors.whitePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "Email_ ",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: colors.yellowPrimary,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "islamtasnim65@gmail.com",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                              color: colors.whitePrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "Website_ ",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: colors.yellowPrimary,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "www.tasnimislamraisa.com",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                              color: colors.whitePrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Your Name',
                        hintStyle:
                        const TextStyle(color: colors.whitePrimary),
                        fillColor: colors.scaffoldBg,
                        filled: true,
                      ),
                      style:
                      const TextStyle(color: colors.whitePrimary),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Your Message',
                        hintStyle:
                        const TextStyle(color: colors.whitePrimary),
                        fillColor: colors.scaffoldBg,
                        filled: true,
                      ),
                      style:
                      const TextStyle(color: colors.whitePrimary),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add your submission functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:colors.yellowPrimary,

                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Send Message",
                        style:
                        TextStyle(color: colors.scaffoldBgDarkest),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
