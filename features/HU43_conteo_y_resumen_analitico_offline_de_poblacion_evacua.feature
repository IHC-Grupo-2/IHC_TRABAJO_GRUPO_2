# ResiliNet | HU43
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como coordinador, quiero exportar un resumen con la cantidad exacta de evacuados y heridos para informar a las autoridades oficiales durante la atención de la emergencia.
# Acceptance criteria: CA01: La app debe compilar un informe estructurado (.txt / .pdf) con el número total de evacuados, personas no ubicadas, solicitudes atendidas e infraestructuras colapsadas. CA02: El informe debe poder generarse y guardarse en el dispositivo sin conexión a internet. CA03: La app debe ofrecer la opción de transferir el informe vía Bluetooth directamente a dispositivos de autoridades oficiales (INDECI / Municipio).

@hu43
Feature: Conteo y Resumen Analítico Offline de Población Evacuada

  Scenario: Generating offline text report summary
    Given the coordinator accesses the analytics module offline
    When they tap 'Generar Reporte Oficial de Daños y Personas'
    Then a structured text file (.txt/.pdf) shall be generated containing counts of evacuees, injuries, and missing persons.

  Scenario: Sharing summary report via local Bluetooth transfer
    Given the report file is generated
    When the coordinator selects 'Compartir Reporte Vía Bluetooth'
    Then the document can be sent directly to external official devices without internet.
