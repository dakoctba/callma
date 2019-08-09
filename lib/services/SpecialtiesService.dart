import 'package:callma/model/Specialty.dart';

class SpecialtiesService {

  static List<Specialty> getSpecialties() {
    List<Specialty> items = new List<Specialty>();

    items.add(Specialty("2", "0", "Crioterapia"));
    items.add(Specialty("2", "1", "Eletroterapia"));
    items.add(Specialty("2", "2", "Fototerapia"));
    items.add(Specialty("2", "3", "Hidroterapia"));
    items.add(Specialty("2", "4", "Respiratória"));
    items.add(Specialty("2", "5", "Cinesioterapia"));

    return items;
  }
}
