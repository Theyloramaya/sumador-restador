# Laboratorio 2 Sumador-restador

 Theylor Andres Amaya Villabon
 
 Maria Angélica Lesmes Calderon
 
 Diomedes López López
 
# Introducción
El sumador desempeña un papel fundamental en el ámbito de la electrónica digital, siendo considerado uno de los circuitos básicos e indispensables. En la actualidad, numerosos procesos y componentes de dispositivos digitales modernos requieren la rápida adición de números en formato binario. Las aplicaciones de los sumadores se extienden a diversos campos, incluyendo la informática, las telecomunicaciones y la electrónica de consumo.

Uno de los ejemplos más destacados de la aplicación de sumadores es su uso en los procesadores de computadoras, donde desempeñan un papel crucial en la ejecución de operaciones aritméticas necesarias para el funcionamiento del procesador. Además, los sumadores son esenciales en el diseño de sistemas de control digital, permitiendo realizar operaciones entre señales digitales. También tienen un rol importante en sistemas de codificación encargados de verificar la integridad de los datos transmitidos.

Para comprender y diseñar eficazmente un sumador, es necesario analizar su funcionamiento, las entradas y salidas involucradas. Esto implica la construcción de una tabla de verdad que nos proporcionará las ecuaciones necesarias. Luego, aplicando las reglas del álgebra booleana, simplificaremos estas ecuaciones para obtener expresiones que nos permitan implementar el circuito de la manera más eficiente posible. Este proceso es esencial para garantizar un rendimiento óptimo del sumador en una variedad de aplicaciones digitales.

# Diseño

En esta sección, abordaremos el diseño detallado del circuito sumador-restador de tres bits. Para ello, describiremos tres procesos fundamentales: la creación de la tabla de verdad de un sumador completo de tres bits con tres entradas (A, B y Cin) y dos salidas (S y Cout), la implementación del circuito utilizando compuertas lógicas AND y OR a partir de las tablas de Karnaugh, y finalmente, la adaptación de este circuito en cajas negras para la creación del sumador-restador.
# A. Creación de la Tabla de Verdad del Sumador Completo de Tres Bits

En esta etapa inicial del diseño, generaremos la tabla de verdad para un sumador completo de tres bits. Este sumador tomará tres entradas: A, B y Cin, y producirá dos salidas: S (resultado de la suma) y Cout (acarreo). La tabla de verdad tendrá ocho filas correspondientes a todas las combinaciones posibles de las entradas.

![image](https://github.com/Theyloramaya/sumador-restador/assets/144027596/574a517e-098a-4963-b4cd-d02d769f3edd)

# B. Implementación del Circuito Sumador-Restador

Existen dos enfoques principales para implementar el circuito sumador-restador: uno utilizando compuertas AND y OR con la ayuda de las Tablas de Karnaugh y otro más simple que utiliza compuertas XOR. A continuación, mostraremos ambos circuitos:
![image](https://github.com/Theyloramaya/sumador-restador/assets/144027596/06a8f061-8df8-45b3-b7a4-bd6ad7728abd)
Se optó por el circuito que hace uso de las compuertas XOR debido a su simplicidad y eficiencia, ya que requiere un número reducido de compuertas en comparación con la otra alternativa. Este diseño es particularmente atractivo por su capacidad para minimizar la complejidad lógica y simplificar la implementación del circuito sumador.

El código de Verilog correspondiente a este circuito se presenta a continuación y se utilizará para configurar las cajas negras en el software de diseño digital. Estas cajas negras contendrán las entradas y salidas necesarias para el funcionamiento de un sumador completo.
```

module SumadorCompleto (
  input A,
  input B,
  input Cin,
  output Cout,
  output S
);
  wire s0;
  assign s0 = (A ^ B);
  assign Cout = ((A & B) | (s0 & Cin));
  assign S = (s0 ^ Cin);
endmodule

```
Este código Verilog permite configurar las cajas negras en el software de diseño digital, donde se establecerán las entradas y salidas correspondientes a un sumador completo. La simplicidad del diseño con compuertas XOR facilita la integración en el entorno de diseño digital y asegura un rendimiento óptimo tanto en modo suma como en modo resta, utilizando el método del complemento a dos cuando sea necesario.

# C. Adaptación del Circuito en Cajas Negras para el Sumador-Restador

La etapa final del diseño implica la creación de un sumador-restador de tres bits. Utilizaremos tres copias de nuestro sumador completo, cada una representada como una "caja negra", con sus respectivas entradas y salidas. Además, añadiremos una entrada adicional, que llamaremos "Substract", la cual determinará si el circuito funcionará como un sumador (cuando está desactivada) o como un restador (cuando está activada).

Para lograr la operación de resta, implementaremos la técnica del complemento a dos en uno de los operandos. Esto implica invertir todos los bits de un operando y sumar 1 al resultado. La salida de esta operación se conectará a una de las entradas del sumador.

En resumen, este diseño nos permitirá realizar operaciones de suma y resta de tres bits de manera eficiente, cambiando el modo de operación según la entrada "Substract". El circuito se compone de tres sumadores completos adaptados como cajas negras, conectados mediante compuertas XOR para habilitar la operación de resta mediante el complemento a dos.
![image](https://github.com/Theyloramaya/sumador-restador/assets/144027596/788ac1e6-1a91-48df-aa51-abe6d1ebbf96)
