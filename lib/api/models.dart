class LoginUser {
  String _email;
  String _password;

  String get email => _email;
  String get password => _password;

  LoginUser({
    String email,
    String password}){
    _email = email;
    _password = password;
  }

  LoginUser.fromJson(dynamic json) {
    _email = json["email"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = _email;
    map["password"] = _password;
    return map;
  }

}

class RegisterUser {
  String _firstname;
  String _lastname;
  String _email;
  String _password;
  String _phone;

  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get password => _password;
  String get phone => _phone;

  RegisterUser({
    String firstname,
    String lastname,
    String email,
    String password,
    String phone}){
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _password = password;
    _phone = phone;
  }

  RegisterUser.fromJson(dynamic json) {
    _firstname = json["firstname"];
    _lastname = json["lastname"];
    _email = json["email"];
    _password = json["password"];
    _phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstname"] = _firstname;
    map["lastname"] = _lastname;
    map["email"] = _email;
    map["password"] = _password;
    map["phone"] = _phone;
    return map;
  }

}

//@dart=2.9
class BaseResponse<T> {
  int _statuscode;
  T _data;
  String _message;

  int get statuscode => _statuscode;
  T get data => _data;
  String get message => _message;

  BaseResponse({
    int statuscode,
    T data,
    String message}){
    _statuscode = statuscode;
    data = data;
    _message = message;
  }

  BaseResponse.fromJson(dynamic json) {
    _statuscode = json["statuscode"];
    _data = json["data"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["statuscode"] = _statuscode;
    if (_data != null) {
       map["data"] = (T as BaseResponse).toJson();
     }
    map["message"] = _message;
    return map;
  }

// Map<String, dynamic> toJson() {
//   var map = <String, dynamic>{};
//   return map;
// }
}


class Detail {
  String title;
  String description;

  Detail({this.title, this.description});
}

final detailsList = [
  Detail(
      title: "New York City",
      description:
      "The Dutch first settled along the Hudson River in 1624; two years later they established the colony of New Amsterdam on Manhattan Island. In 1664, the English took control of the area and renamed it New York. One of the original 13 colonies, New York played a crucial political and strategic role during the American Revolution. Between 1892 and 1954, millions of immigrants arrived in New York Harbor and passed through Ellis Island on their journey to becoming U.S citizens. It is estimated that up to 40 percent of Americans can trace at least one ancestor to that port of entry. New York City, the largest city in the state, is home to the New York Stock Exchange and is a major international economic center."),
  Detail(
      title: "Cape Town",
      description:
      "The first Europeans known to have climbed Table Mountain were Portuguese seamen under Antonio de Saldanha, whose ships were part of a fleet on its way to India in 1503. They had a fracas with the local people, the Khoi, nomadic cattle herders known to Europeans for centuries as ‘Hottentots’. There was a more serious skirmish in 1510, when many Portuguese were killed. Even so, European ships began putting in to Table Bay for fresh water and meat until in 1647 a Dutch ship, the Haarlem, was wrecked in the bay. The survivors returned to Holland to report that the place was fertile and suitable for growing vegetables and fruit, against scurvy, while the natives were not cannibals as reported, but friendly and, if kindly treated, could be converted to Christianity and used as servants. In 1651 accordingly, the directors of the Dutch East India Company, the Seventeen, decided to establish an outpost at the Cape, where their ships could put in for water and supplies and the sick could be treated. Jan van Riebeek reached Table Bay on April 6th, the following year with an expedition some ninety-strong in three ships and went ashore the next day to select a place for a fort. Today’s Grand Parade in the centre of Cape Town is on the site."),
  Detail(
      title: "Switzerland",
      description:
      "Originally inhabited by the Helvetians, or Helvetic Celts, the territory comprising modern Switzerland came under Roman rule during the Gallic wars in the 1st century BC and remained a Roman province until the 4th century AD. Under Roman influence, the population reached a high level of civilization and enjoyed a flourishing commerce. Important cities, such as Geneva, Basel, and Zurich, were linked by military roads that also served as trade arteries between Rome and the northern tribes. "
          "After the decline of the Roman Empire, Switzerland was invaded by Germanic tribes from the north and west. Some tribes, such as the Alemanni in central and northeastern Switzerland, and the Burgundians, who ruled western Switzerland, settled there. In 800, the country became part of Charlemagne's empire. It later passed under the dominion of the Holy Roman emperors in the form of small ecclesiastic and temporal holdings subject to imperial sovereignty.With the opening of a new important north-south trade route across the Alps in the early 13th century, the Empire's rulers began to attach more importance to the remote Swiss mountain valleys, which were granted some degree of autonomy under direct imperial rule. Fearful of the popular disturbances flaring up following the death of the Holy Roman Emperor in 1291, the ruling families from Uri, Schwyz, and Unterwalden signed a charter to keep public peace and pledging mutual support in upholding autonomous administrative and judicial rule. The anniversary of the charter's signature (August 1, 1291) today is celebrated as Switzerland's National Day."),
];

final longText = "WorkManager is an Android library that runs deferrable background work when the work’s constraints are satisfied, WorkManager is intended for tasks that require a guarantee that the system will run them even if the app exits."
    "It is best for background work that has to finish and it is deferrable. You can define constraints that must be fulfilled and you can schedule. Also guarantees task execution, IF YOU NEED YOU WORK TO BE EXECUTED AT A PARTICULAR TIME USE ALARM MANAGER,"
    "IF YOU NEED YOUR WORK TO BE EXECUTED IMMEDIATELY BUT ITS LONG RUNNING USE A FOREGROUND SERVICE";