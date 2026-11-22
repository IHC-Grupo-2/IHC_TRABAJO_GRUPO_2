# ResiliNet | HU41
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista, quiero sincronizar mi base de datos de incidentes local con la de otro brigadista al juntarnos en el camino para mantener la información unificada sin depender de un servidor central.
# Acceptance criteria: CA01: Al seleccionar 'Sincronización P2P de Mando', dos dispositivos de brigadistas deben intercambiar deltas de base de datos SQLite vía Bluetooth/Wi-Fi Direct. CA02: Los conflictos entre registros duplicados deben resolverse conservando automáticamente el estado con la marca de tiempo más reciente. CA03: El proceso debe completarse sin intervención manual en menos de 3 segundos para bases de datos locales estándar.

@hu41
Feature: Sincronización Inter-Dispositivos de Brigadistas (P2P Command Sync)

  Scenario: Bidirectional database delta sync between brigadier devices
    Given Brigadier A and Brigadier B meet in the field
    When they initiate 'Sincronización de Mando P2P'
    Then the two devices shall exchange missing database records via high-speed Bluetooth/Wi-Fi Direct.

  Scenario: Conflict resolution using latest timestamp
    Given both devices contain records for Incident #102 with different status updates
    When the conflict resolution algorithm runs
    Then the entry with the newest timestamp shall overwrite the older entry on both devices.
