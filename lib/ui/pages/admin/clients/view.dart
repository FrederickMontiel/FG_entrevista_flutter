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
        decoration: BoxDecoration(
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
      margin: EdgeInsets.only(top: 40, bottom: 0),
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
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
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  //color: Colors.amber
                  
                  
                ),
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

   showDetails(BuildContext context, var client){
    
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
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Text(
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
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DataTable(
                //columnSpacing: 100,
                // Ajusta el ancho de las columnas
                columns: [
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
                  final isSelected = index == _selectedRow;

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
                              "Fecha de Corte: ${client['FECHA_CORTE']}\n" + 
                              "Codigo Promotor: ${client['COD_PROMOTOR']}\n" +
                              "Nombre Promotor: ${client['NOM_PROMOTOR']}\n" +
                              "DPI: ${client['DPI']}\n" +
                              "Nombre Cliente: ${client['NOMBRE_CLIENTE']}\n" +
                              "Edad Cliente: ${client['EDAD_CTE']}\n" +
                              "Telefono Principal: ${client['TEL_PRINCIPAL']}\n" +
                              "Telefono Secundario: ${client['TEL_SECUNDARIO']}\n" +
                              "Direccion Domicilio: ${client['DIRECCION_DOM']}\n" +
                              "Departamento: ${client['DEPARTAMENTO']}\n" +
                              "Municipio: ${client['MUNICIPIO']}\n" +
                              "Nombre Region: ${client['NOM_REGION']}\n" +
                              "Sucursal: ${client['SUCURSAL']}\n" +
                              "FUD Cliente: ${client['FUD_CLIENTE']}\n" +
                              "Prestamo: ${client['PRESTAMO']}\n" +
                              "Fecha Vencimiento: ${client['FEC_VENCIMIENTO']}\n" +
                              "Fecha Entrega: ${client['FEC_ENTREGA']}\n" +
                              "Plazo: ${client['PLAZO']}\n" +
                              "Producto: ${client['PRODUCTO']}\n" +
                              "Sub Producto: ${client['SUB_PRODUCTO']}\n" +
                              "Descripcion Producto: ${client['DESCRIPCION_PRODUCTO']}\n" +
                              "Nombre Grupo: ${client['NOMBRE_GRUPO']}\n" +
                              "Integrantes: ${client['INTEGRANTES']}\n" +
                              "Capital Otorgado: ${client['CAPITAL_OTORGADO']}\n" +
                              "Saldo Capital: ${client['SALDO_CAPITAL']}\n" +
                              "Oferta Comercial: ${client['OFERTA_COMERCIAL']}\n" +
                              "Dias Atraso Cierre: ${client['DIAS_ATRASO_CIERRE']}\n" +
                              "Tipo Cliente: ${client['TIPO_CLIENTE']}\n" +
                              "Operaciones: ${client['OPERACIONES']}\n" +
                              "Observacion: ${client['OBSERVACION']}\n" +
                              "Tipo Riesgo: ${client['TIPORIESGO']}\n" +
                              "Graduacion: ${client['GRADUACION']}\n" +
                              "Tipo Campania: ${client['TIPOCAMPANIA']}\n" +
                              "Segmento Cliente: ${client['SEG_CLIENTE']}\n" +
                              "Segmento Desercion: ${client['SEG_DESERCION']}\n" +
                              "Segmento Cobranza: ${client['SEG_COBRANZA']}\n" +
                              "Sub Segmento Cobranza: ${client['SUB_SEG_COBRANZA']}\n" +
                              "Aprobado: ${client['APROBADO']}\n" +
                              "Descripcion Rechazo: ${client['DESC_RECHAZO']}\n" +
                              "Identificador: ${client['IDENTIFICADOR']}\n" +
                              "Codigo Sucursal: ${client['COD_SUCURSAL']}\n" +
                              "Estado Colocado: ${client['ESTADO_COLOCADO']}\n"
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
