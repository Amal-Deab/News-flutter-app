
import 'package:newsapp/models/corousel_silder.dart';

List<CarouselModel> getcarouselSilder() {
  List<CarouselModel> categories = [];

  CarouselModel carouselModel = new CarouselModel();
  carouselModel.name = 'Businees';
  carouselModel.image = 'assets/bus.jpg';

  categories.add(carouselModel);
  carouselModel = new CarouselModel();
  carouselModel.name = 'EnterAnimate';
  carouselModel.image = 'assets/enter.jpg';

  categories.add(carouselModel);
  carouselModel = new CarouselModel();
  carouselModel.name = 'General';
  carouselModel.image = 'assets/general.jpg';

  categories.add(carouselModel);
  carouselModel = new CarouselModel();

  carouselModel.name = 'Health';
  carouselModel.image = 'assets/health.jpg';

  categories.add(carouselModel);
  carouselModel = new CarouselModel();
  carouselModel.name = 'Sports';
  carouselModel.image = 'assets/sports.jpg';

  categories.add(carouselModel);
  carouselModel = new CarouselModel();

  return categories;
}
