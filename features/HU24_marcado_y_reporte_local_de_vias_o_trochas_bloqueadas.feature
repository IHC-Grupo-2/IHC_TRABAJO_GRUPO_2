# ResiliNet | HU24
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como vecino evacuando, quiero marcar una calle o puente bloqueado en el mapa para que la advertencia se comparta por Bluetooth con otros residentes que vienen detrás.
# Acceptance criteria: CA01: El usuario debe poder mantener presionado un punto del mapa y seleccionar 'Reportar Bloqueo'. CA02: El marcador de bloqueo debe guardarse en la base de datos local y añadirse a la cola de salida BLE Mesh. CA03: Al cruzarse con otros dispositivos, la posición del bloqueo debe sincronizarse en los mapas de los vecinos.

@hu24
Feature: Marcado y Reporte Local de Vías o Trochas Bloqueadas

  Scenario: Pinpointing blockage location on offline map
    Given the user witnesses a landslide blocking Calle Los Naranjos
    When they long-press the map location and select 'Reportar Bloqueo'
    Then a blockage marker shall be created locally and added to the outbound BLE mesh queue.

  Scenario: Syncing blockage markers across peer devices
    Given a neighboring user comes within Bluetooth range of the reporter
    When their devices exchange local map status payloads
    Then the blockage marker shall instantly render on the neighbor's offline map screen.
