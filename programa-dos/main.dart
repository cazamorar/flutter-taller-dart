import 'dart:io';

class Empleado {
  String nombre;
  String empresa;
  int horasTrabajadas;
  int? bono;

  Empleado(this.nombre, this.empresa, this.horasTrabajadas, [this.bono]);
}

void main() {
  const int horasNormales = 160;
  const int pagoPorHora = 50000;
  const int pagoPorHoraExtra = 80000;
  const String empresaFiltrada = 'Motores S.A.';

  List<Empleado> empleados = [];

  stdout.write('Ingrese la cantidad de empleados: ');
  int cantidad = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < cantidad; i++) {
    stdout.write('\nIngrese el nombre del empleado: ');
    String nombre = stdin.readLineSync()!;

    stdout.write('Ingrese la empresa a la que pertenece: ');
    String empresa = stdin.readLineSync()!;

    stdout.write('Ingrese el número de horas trabajadas en el mes: ');
    int horasTrabajadas = int.parse(stdin.readLineSync()!);

    stdout.write('Ingrese el bono adicional (deje vacío si no aplica): ');
    String? bonoInput = stdin.readLineSync();
    int? bono = bonoInput != null && bonoInput.isNotEmpty ? int.parse(bonoInput) : null;

    empleados.add(Empleado(nombre, empresa, horasTrabajadas, bono));
  }

  print('\n--- Empleados ---');

  for (var empleado in empleados) {
    if (empleado.empresa == empresaFiltrada) {
      int salario;
      if (empleado.horasTrabajadas <= horasNormales) {
        salario = empleado.horasTrabajadas * pagoPorHora;
      } else {
        int horasExtras = empleado.horasTrabajadas - horasNormales;
        salario = (horasNormales * pagoPorHora) + (horasExtras * pagoPorHoraExtra);
      }

      stdout.write('${empleado.nombre} gana \$${salario.toStringAsFixed(0)}');

      if (empleado.bono != null) {
        stdout.write(' y su subsidio de transporte es \$${empleado.bono!.toStringAsFixed(0)}');
      }

      print('.');
    }
  }
}
