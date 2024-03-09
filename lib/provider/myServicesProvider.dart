import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/models/serviceModel.dart';

class ServicesProvider extends ChangeNotifier {
  List<ServiceModel> services = [
    ServiceModel(
        image:
            "https://as2.ftcdn.net/v2/jpg/04/12/83/91/1000_F_412839178_eBThjVy75lyoTMkjcaSZSgeaH91M9bse.jpg",
        text: "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf",
        title: "Mobile App Development"),
    ServiceModel(
        image:
            "https://img.freepik.com/free-vector/web-development-isometric-concept-illustration_1284-55924.jpg?w=740&t=st=1709907141~exp=1709907741~hmac=3a28582e1df1ff3788286d6c15f5f42e99d6aed8ae1c66872bf07a81ce333350",
        text: "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf",
        title: "Web Development"),
    ServiceModel(
        image:
            "https://media.vogue.in/wp-content/uploads/amp-stories/39-best-animated-movies-to-watch-now-let-your-imagination-run-wild/assets/1.jpeg",
        text: "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf",
        title: "Animations"),
    ServiceModel(
        image:
            "https://img.freepik.com/premium-vector/vector-flat-illustration-software-developer-cyber-program-security_776789-207.jpg?w=740",
        text: "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf"
            "ajlndfkjadkjandfjnkansdfknaksdnfkasnfkdnaskjdnf"
            "ajkdafdafdsfadfasd abdskfbadb jabkdfka kabdkfnsbnf",
        title: "MERN stack"),
  ];

  int selectedService = 0;
  leftClicked() {
    if (selectedService == 0) {
      selectedService = services.length - 1;
    } else {
      selectedService = selectedService - 1;
    }
    notifyListeners();
  }

  rightClicked() {
    if (selectedService == services.length - 1) {
      selectedService = 0;
    } else {
      selectedService = selectedService + 1;
    }
    notifyListeners();
  }
}
