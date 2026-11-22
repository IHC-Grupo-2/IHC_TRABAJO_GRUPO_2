# ResiliNet | HU11
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como vecino que no descargó el mapa previamente, quiero recibir el paquete de cartografía local directamente desde el teléfono de un brigadista cercano mediante Bluetooth / Wi-Fi Direct para disponer del mapa interactivo de evacuación sin tener internet ni datos móviles.
# Acceptance criteria: CA01: La app debe permitir la transferencia directa de archivos de mapas entre dispositivos sin conexión a internet. CA02: El dispositivo emisor debe generar un código QR de emparejamiento rápido P2P. CA03: Tras la recepción, la app debe verificar la integridad del paquete e instalarlo automáticamente.

@hu11
Feature: Compartición P2P de Mapas y Rutas Vía Bluetooth / Wi-Fi Direct

  Scenario: Direct peer-to-peer map file transfer
    Given User A has the offline map downloaded and User B does not
    When User A selects 'Compartir Mapa Vía Bluetooth/Wi-Fi Direct' and User B accepts
    Then the map package file shall transfer directly between devices without internet.

  Scenario: Automatic map package installation and verification
    Given User B completes receiving the map package file over Wi-Fi Direct
    When the transfer finishes
    Then the app shall verify checksum integrity and automatically render the offline map tiles.
