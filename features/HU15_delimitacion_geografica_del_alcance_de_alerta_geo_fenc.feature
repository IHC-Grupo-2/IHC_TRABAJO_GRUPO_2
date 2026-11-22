# ResiliNet | HU15
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista local, quiero asignar un radio de relevancia geográfica a una alerta para que no se activen alarmas innecesarias en sectores o quebradas no amenazadas.
# Acceptance criteria: CA01: El emisor de la alerta debe poder seleccionar el sector o coordenadas de delimitación (Geo-fence). CA02: Los dispositivos dentro del polígono de riesgo deben activar la interfaz de emergencia a pantalla completa. CA03: Los dispositivos fuera del perímetro deben registrar y retransmitir el paquete silenciosamente sin sonar.

@hu15
Feature: Delimitación Geográfica del Alcance de Alerta (Geo-Fencing)

  Scenario: Displaying alert only to users inside target geofence
    Given an alert packet contains geofence coordinates bounded to Quebrada Pedregal
    When a resident device receives the packet while positioned inside those GPS bounds
    Then the full screen emergency alert interface shall be displayed immediately.

  Scenario: Silent logging for nodes outside danger geofence
    Given an alert packet contains geofence bounds restricted to Sector 3
    When a device located 5 kilometers away in Sector 1 receives and relays the packet
    Then it shall store and relay the payload without sounding a local siren.
