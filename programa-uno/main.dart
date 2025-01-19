import 'dart:io';

void main() {
  const int horasNormales = 160;
  const int pagoPorHora = 50000;
  const int pagoPorHoraExtra = 80000;

  // Solicitar al usuario el número de horas trabajadas
  stdout.write('Ingrese el número de horas trabajadas en el mes: ');
  int horasTrabajadas = int.parse(stdin.readLineSync()!);

  int salario;

  if (horasTrabajadas <= horasNormales) {
    salario = horasTrabajadas * pagoPorHora;
  } else {
    int horasExtras = horasTrabajadas - horasNormales;
    salario = (horasNormales * pagoPorHora) + (horasExtras * pagoPorHoraExtra);
  }

  print('El salario total es: \$${salario.toStringAsFixed(0)}');
}
