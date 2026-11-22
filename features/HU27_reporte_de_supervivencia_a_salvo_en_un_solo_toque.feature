# ResiliNet | HU27
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como habitante evacuado, quiero presionar un botón prominente 'Estoy a Salvo' para tranquilizar a mi familia y notificar a los brigadistas que no necesito rescate.
# Acceptance criteria: CA01: La pantalla principal del modo emergencia debe incluir un botón grande verde 'Estoy a Salvo'. CA02: Al presionarlo, el sistema debe empaquetar ID de usuario, hora y coordenadas GPS y retransmitirlo por la red BLE Mesh. CA03: La pantalla debe mostrar una confirmación visual clara indicando que el estado ha sido emitido.

@hu27
Feature: Reporte de Supervivencia 'A Salvo' en Un Solo Toque

  Scenario: Broadcasting 'A Salvo' status payload via BLE mesh
    Given the user reaches a safe zone and opens the app home screen
    When they tap the green 'Estoy a Salvo' button
    Then a lightweight status packet containing user ID, timestamp, and GPS coordinates shall be broadcast via BLE mesh.

  Scenario: Visual state confirmation on local UI
    Given the user taps 'Estoy a Salvo'
    When the status is recorded locally
    Then the main screen shall turn green displaying 'Estado: A Salvo - Notificado a la Red'.
