import 'package:callma/model/Profession.dart';

class ProfessionsService {

  static List<Profession> getProfessions() {
    List<Profession> items = new List<Profession>();

    items.add(Profession("0", "Educação Física (Personal Trainer)"));
    items.add(Profession("1", "Enfermagem"));
    items.add(Profession("2", "Fisioterapia"));
    items.add(Profession("3", "Fonoaudiologia"));
    items.add(Profession("4", "Nutrição"));
    items.add(Profession("5", "Psicologia"));
    items.add(Profession("6", "Terapia Ocupacional"));

    return items;
  }
}
