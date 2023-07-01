import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pruebagfg/fakedata/Clients.dart';

class AdminClients extends StatelessWidget {
  const AdminClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: 
      Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 9, 10, 24),
          ),
          child: Column(
        children: [
          _CustomCarouselSlider(),
          _DataClients()
        ],
      ),
      ),
      ),
    );
  }
}

class _CustomCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 0),
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          //viewportFraction: 1,
        ),
        items: [
          "https://i.pinimg.com/originals/93/a9/15/93a915b482b10b4c9f6e68fa74049aa5.jpg",
          "https://thumbs.dreamstime.com/b/paisaje-azul-de-la-noche-107786925.jpg",
          "https://mymodernmet.com/wp/wp-content/uploads/2019/07/the-blue-border-kilian-schonberger-4.jpg",
          "https://fondosmil.com/fondo/2262.jpg"
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Agrega el radio del borde deseado
                  child: Image(
                    image: NetworkImage(i),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class _DataClients extends StatefulWidget {
  @override
  _DataClientsState createState() => _DataClientsState();
}

class _DataClientsState extends State<_DataClients> {
  int _selectedRow = -1; // Variable para realizar un seguimiento de la fila seleccionada

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_selectedRow);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: const Text(
                  "Clientes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DataTable(
                //columnSpacing: 100,
                // Ajusta el ancho de las columnas
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text('Nombre'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Prestamo'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('DPI'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('FUD'),
                    ),
                  ),
                ],
                rows: ClientsFakeData.fakeClients.asMap().entries.map((entry) {
                  final index = entry.key;
                  final client = entry.value;
                  //final isSelected = index == _selectedRow;

                  return DataRow(
                    onSelectChanged: (bool? selected) {
                      setState(() {
                        _selectedRow = selected! ? index : -1;
                      });

                      showDialog(
                        context: context, 
                        builder: (context) => 
                          AlertDialog(
                            title: Text("Datos del Cliente"),
                            actions: [
                              //Salir
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(), 
                                child: Text("Salir")
                              ),
                            ],
                            content: Text(
                              "Fecha de Corte: ${client['FECHA_CORTE']}\nCodigo Promotor: ${client['COD_PROMOTOR']}\nNombre Promotor: ${client['NOM_PROMOTOR']}\nDPI: ${client['DPI']}\nNombre Cliente: ${client['NOMBRE_CLIENTE']}\nEdad Cliente: ${client['EDAD_CTE']}\nTelefono Principal: ${client['TEL_PRINCIPAL']}\nTelefono Secundario: ${client['TEL_SECUNDARIO']}\nDireccion Domicilio: ${client['DIRECCION_DOM']}\nDepartamento: ${client['DEPARTAMENTO']}\nMunicipio: ${client['MUNICIPIO']}\nNombre Region: ${client['NOM_REGION']}\nSucursal: ${client['SUCURSAL']}\nFUD Cliente: ${client['FUD_CLIENTE']}\nPrestamo: ${client['PRESTAMO']}\nFecha Vencimiento: ${client['FEC_VENCIMIENTO']}\nFecha Entrega: ${client['FEC_ENTREGA']}\nPlazo: ${client['PLAZO']}\nProducto: ${client['PRODUCTO']}\nSub Producto: ${client['SUB_PRODUCTO']}\nDescripcion Producto: ${client['DESCRIPCION_PRODUCTO']}\nNombre Grupo: ${client['NOMBRE_GRUPO']}\nIntegrantes: ${client['INTEGRANTES']}\nCapital Otorgado: ${client['CAPITAL_OTORGADO']}\nSaldo Capital: ${client['SALDO_CAPITAL']}\nOferta Comercial: ${client['OFERTA_COMERCIAL']}\nDias Atraso Cierre: ${client['DIAS_ATRASO_CIERRE']}\nTipo Cliente: ${client['TIPO_CLIENTE']}\nOperaciones: ${client['OPERACIONES']}\nObservacion: ${client['OBSERVACION']}\nTipo Riesgo: ${client['TIPORIESGO']}\nGraduacion: ${client['GRADUACION']}\nTipo Campania: ${client['TIPOCAMPANIA']}\nSegmento Cliente: ${client['SEG_CLIENTE']}\nSegmento Desercion: ${client['SEG_DESERCION']}\nSegmento Cobranza: ${client['SEG_COBRANZA']}\nSub Segmento Cobranza: ${client['SUB_SEG_COBRANZA']}\nAprobado: ${client['APROBADO']}\nDescripcion Rechazo: ${client['DESC_RECHAZO']}\nIdentificador: ${client['IDENTIFICADOR']}\nCodigo Sucursal: ${client['COD_SUCURSAL']}\nEstado Colocado: ${client['ESTADO_COLOCADO']}\n"
                            )
                          )
                        
                      );
                    },
                    cells: [
                      DataCell(
                        Text(client['NOMBRE_CLIENTE'].toString()),
                      ),
                      DataCell(
                        Text(client['PRESTAMO'].toString()),
                      ),
                      DataCell(
                        Text(client['DPI'].toString()),
                      ),
                      DataCell(
                        Text(client['FUD_CLIENTE'].toString()),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
