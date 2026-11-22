# ResiliNet | HU13
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como vigía comunitario posicionado en la parte alta de la quebrada, quiero emitir una alerta temprana manual al detectar una crecida anómala de lodo para prevenir a las familias de la cuenca baja con minutos valiosos de anticipación.
# Acceptance criteria: CA01: El vigía registrado debe disponer de un botón protegido 'Emitir Alerta de Emergencia'. CA02: Al seleccionar el tipo de amenaza ('Huaico Inminente') y presionar durante 2 segundos, el dispositivo debe firmar y transmitir el paquete BLE Mesh. CA03: El sistema debe permitir cancelar la emisión si se presiona por error antes de la confirmación.

@hu13
Feature: Emisión Manual de Alerta por Vigía o Creador de Reporte en Cuenca Alta

  Scenario: Immediate broadcasting of user-initiated threat alert
    Given the verified river monitor observes a sudden mudflow acceleration
    When they tap 'Trigger Emergency Alert' and select hazard type 'Huaico Inminente'
    Then the local device shall sign the alert packet and initiate immediate BLE mesh broadcasting.

  Scenario: Cancellation of unconfirmed emergency broadcast prompt
    Given the user opens the 'Trigger Emergency Alert' panel by accident
    When they tap 'Cancel' before holding the confirmation button for 2 seconds
    Then no alert packet shall be generated or transmitted to neighboring nodes.
