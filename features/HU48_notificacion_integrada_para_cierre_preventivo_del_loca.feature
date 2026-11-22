# ResiliNet | HU48
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como comerciante, quiero emitir un aviso rápido de 'Bodega Cerrando por Evacuación' a los vecinos cercanos para evitar que los clientes acudan al local y se dirijan de inmediato a las zonas seguras.
# Acceptance criteria: CA01: Al presionar 'Notificar Cierre de Local', el dispositivo del comerciante debe retransmitir por BLE Mesh el mensaje 'Bodega [Nombre] Cerrada - Zona en Evacuación'. CA02: El pin comercial en los mapas de los dispositivos vecinos debe cambiar de color verde (abierto) a rojo (cerrado/evacuado). CA03: La notificación debe emitirse sin requerir conexión a internet.

@hu48
Feature: Notificación Integrada para Cierre Preventivo del Local

  Scenario: Broadcasting store closure notification via mesh
    Given the merchant decides to close the store
    When they tap 'Notificar Cierre de Local'
    Then a status update 'Bodega San Martín Cerrada - Zona en Evacuación' shall broadcast to nearby customer phones.

  Scenario: Updating commercial pin status on local map
    Given the store closure notification is broadcast
    When neighboring devices refresh their map markers
    Then the commercial store icon shall change from green open store to red closed store.
