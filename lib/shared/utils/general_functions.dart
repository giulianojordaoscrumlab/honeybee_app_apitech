import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension IsNumeric on String? {
  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }
}

extension StringExtension on String {
  String? capitalize(String? s) => (s != null && s.length > 1)
      ? s[0].toUpperCase() + s.substring(1).toLowerCase()
      : (s!.contains(".") != true)
          ? s.toLowerCase()
          : s.toUpperCase();

  String? capitalizeNames(String? s) => (s != null && s.length > 2)
      ? s[0].toUpperCase() + s.substring(1).toLowerCase()
      : s != null
          ? (s.contains(".") != true)
              ? s.toLowerCase()
              : s.toUpperCase()
          : null;
}

extension InverseBool on bool {
  bool get reverseBool => !this;
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get allInLows => toLowerCase();
  String get capitalizeFirstOfEach =>
      split(" ").map((str) => capitalize(str)).join(" ");
  String get capitalizePersonalName =>
      split(" ").map((str) => capitalizeNames(str)).join(" ");
}

extension CCardObfuscate on String {
  String cCardObfuscate() {
    return substring(12)
        .padLeft(16, '*')
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }
}

extension NumberToReal on double {
  String numberToReal() {
    return NumberFormat.currency(
            decimalDigits: 2, locale: 'pt-BR', symbol: 'R\$')
        .format(this);
  }
}

extension NumberToRealNotReal on double {
  String numberToRealNotReal() {
    return NumberFormat.currency(decimalDigits: 2, locale: 'pt-BR', symbol: '')
        .format(this);
  }
}

extension IsNullOrEmpty on String? {
  bool isNullOrEmpty() {
    if (this!.isEmpty || this == null) {
      return false;
    }
    return true;
  }
}

extension SimNao on bool {
  String simNao() {
    if (this == true) {
      return 'Sim';
    }
    return 'Não';
  }
}

extension LimpaCpf on String? {
  String limpaCpf() {
    if (this != null || this!.isNotEmpty) {
      return this!
          .replaceAll(" ", "")
          .replaceAll(".", "")
          .replaceAll("-", "")
          .replaceAll("/", "")
          .trim();
    }
    return '';
  }
}

extension CnpjMask on String {
  String toCnpjMask(bool labeled) {
    var saida = "";
    saida = (labeled) ? "CNPJ: " : "";
    saida += substring(0, 2) +
        "." +
        substring(2, 5) +
        "." +
        substring(5, 8) +
        "/" +
        substring(8, 12) +
        "-" +
        substring(12, 14);
    return saida;
  }
}

extension CpfCnpj on String {
  String toCpfCnpjMasked(labeled) {
    var saida = "";
    if (length < 12) {
      //! CPF
      // saida = (labeled) ? "CPF: " : "";
      saida += substring(0, 3) +
          "." +
          substring(3, 6) +
          "." +
          substring(6, 9) +
          "-" +
          substring(9, 11);
    } else {
      //! CNPJ
      saida = (labeled) ? "CNPJ: " : "";
      saida += substring(0, 2) +
          "." +
          substring(2, 5) +
          "." +
          substring(5, 8) +
          "/" +
          substring(8, 12) +
          "-" +
          substring(12, 14);
    }
    return saida;
  }
}

extension AtivoInativo on bool {
  String ativoInativo(String genero) {
    return (genero.toUpperCase() == "M")
        ? (this)
            ? 'Ativo'
            : 'Inativo'
        : (this)
            ? 'Ativa'
            : 'Inativa';
  }
}

extension IsCanceled on String? {
  bool isCanceld() {
    if (this == null) {
      return false;
    }

    if (this == 'C') {
      return true;
    }
    return false;
  }
}

extension ToCellPhone on String? {
  String toCellPhone() {
    if (this == null) {
      return "NÃO INFORMADO";
    }
    var value = "";

    if (this!.length <= 10) {
      value = this!.padLeft(11, 'X');
    } else {
      value = this!;
    }

    value = value
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .replaceAll('+', '')
        .replaceAll('-', '')
        .replaceAll('/', '');

    return "(" +
        value.substring(0, 2) +
        ") " +
        value.substring(2, 7) +
        "-" +
        value.substring(7);
  }
}

extension ToPinCode on String {
  String toPinCode() {
    return substring(0, 1).toUpperCase() + "-" + substring(2);
  }
}

extension ToDigitableLine on String {
  String toDigitableLine() {
    return substring(0, 5) +
        "." +
        substring(5, 10) +
        " " +
        substring(10, 15) +
        "." +
        substring(15, 21) +
        " " +
        substring(21, 26) +
        "." +
        substring(26, 32) +
        " " +
        substring(32, 33) +
        " " +
        substring(33);
  }
}

extension BrazilianDateFormat on DateTime {
  String brazilianDateFormat() {
    return DateFormat('dd/MM/yyyy').format(this).toString();
  }
}

extension BrazilianDateTimeFormat on DateTime {
  String brazilianDateTimeFormat() {
    return DateFormat('dd/MM/yyyy HH:mm').format(this).toString();
  }
}

extension EmailValidatorRegexp on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension BrazilianDateTimeFormatExtended on DateTime {
  String brazilianDateTimeFormatExtended() {
    return DateFormat('EEEE, dd ||| MMMM ||| yyyy @@@ HH:mm', 'pt_BR')
        .format(this)
        .toString();
  }
}

extension BrazilianDateTimeFormatExtendedNoTime on DateTime {
  String brazilianDateTimeFormatExtendedNotTime() {
    return DateFormat('dd ||| MMMM ||| yyyy @@@', 'pt_BR')
        .format(this)
        .toString();
  }
}

extension TransactionDateTimeFormat on DateTime {
  String transactionDateTimeFormat() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this).toString();
  }
}

extension BoletoDateTimeFormat on DateTime {
  String boletoDateTimeFormat() {
    return DateFormat('dd MMM yyyy', 'pt_BR').format(this).toString();
  }
}

extension DatePtBr on String? {
  String datePtBr({String msk = "dd/MM/yyyy"}) {
    if (this == null) {
      return "Data inválida";
    }
    return DateFormat(msk).parse(this!).toString();
  }
}

class CapitalCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalizeFirstOfEach,
      selection: newValue.selection,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

String blockShortedDateFormatter(String dataStr) {
  DateTime data = DateTime.parse(dataStr);

  String dia = data.day.toString().padLeft(2, '0');
  String mes = data.month.toString().padLeft(2, '0');
  String ano = data.year.toString().padLeft(4, '0');

  String hora = data.hour.toString().padLeft(2, '0');
  String minuto = data.minute.toString().padLeft(2, '0');

  return '$dia/$mes/$ano - $hora:$minuto';
}

String headlineDateFormatter(String dataStr, {bool? showYear = false}) {
  // Converter a string de data em um objeto DateTime
  if (dataStr != "") {
    DateTime data = DateTime.parse(dataStr);

    // Obter o dia da semana em português
    List<String> diasDaSemana = [
      'Segunda',
      'Terça',
      'Quarta',
      'Quinta',
      'Sexta',
      'Sábado',
      'Domingo'
    ];

    String diaDaSemana = diasDaSemana[data.weekday - 1];

    // Obter o mês do ano em português
    List<String> mesesDoAno = [
      'janeiro',
      'fevereiro',
      'março',
      'abril',
      'maio',
      'junho',
      'julho',
      'agosto',
      'setembro',
      'outubro',
      'novembro',
      'dezembro'
    ];
    String mesDoAno = mesesDoAno[data.month - 1];

    // Obter o dia do mês e o ano
    int diaDoMes = data.day;
    int ano = data.year;

    // Obter a hora e os minutos
    int hora = data.hour;
    int minutos = data.minute;

    // Formatar a data como uma string e retorná-la
    if (showYear == true) {
      return '$diaDaSemana, $diaDoMes de $mesDoAno de $ano às ${hora.toString().padLeft(2, '0')} : ${minutos.toString().padLeft(2, '0')}';
    } else {
      return '$diaDaSemana, $diaDoMes de $mesDoAno às ${hora.toString().padLeft(2, '0')} : ${minutos.toString().padLeft(2, '0')}';
    }
  } else {
    return "";
  }
}

// Future<bool> requestPermissionApp(
//     Permission permission, BuildContext context, bool? historyBack) async {
//   if (Platform.isAndroid || Platform.isIOS) {
//     var status = await permission.status;
//     if (status.isGranted) {
//       return true;
//     } else {
//       var result = await permission.request();
//       if (result == PermissionStatus.granted) {
//         return true;
//       }
//       if (result == PermissionStatus.permanentlyDenied) {
//         showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Text(permission.value.toString());
//             });
//         return false;
//       } else {
//         showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Container(
//                 height: 330,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: kWhiteTrinus,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8.0),
//                       topRight: Radius.circular(8.0)),
//                 ),
//                 child: Container(
//                   margin: EdgeInsets.only(top: 24),
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                        Container(
//                   height: 8.0,
//                   width: 75.0,
//                   decoration: BoxDecoration(
//                     color: kGrey9,
//                     borderRadius: BorderRadius.circular(3),
//                   ),
//                 ),
//                 Spacer(flex: 1,),
//                       Text(
//                         "Atenção",
//                         style:
//                             kHeaderH3Bold.copyWith(color: kBluePrimaryTrinus),
//                       ),
//                       SizedBox(height: 16,),
//                       Text(
//                         "Para o correto funcionamento do aplicativo esta permissão é necessária.",
//                         style: kHeaderH5.copyWith(color: kBluePrimaryTrinus),
//                         textAlign: TextAlign.center,
//                       ),
//                       Spacer(flex: 2,),
//                       (historyBack == true)
//                           ? TrinusButton(
//                               fontColor: kWhiteTrinus,
//                               text: "CONTINUAR",
//                               color: kBluePrimaryTrinus,
//                               onPressed: () => Modular.to
//                                 ..pop()
//                                 ..pop())
//                           : TrinusButton(
//                               fontColor: kWhiteTrinus,
//                               text: "CONTINUAR",
//                               color: kBluePrimaryTrinus,
//                               onPressed: () => Modular.to.pop()),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//               );
//             });
//         return false;
//       }
//     }
//   }
//   return true;
// }