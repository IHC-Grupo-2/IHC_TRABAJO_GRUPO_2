# ResiliNet | HU22
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario desorientado de noche o bajo lluvia, quiero que el mapa gire según la dirección en que apunto mi teléfono para saber exactamente hacia dónde caminar sin dudar en intersecciones.
# Acceptance criteria: CA01: El mapa debe utilizar el magnetómetro del dispositivo para orientar la vista en tiempo real según la dirección del usuario. CA02: Debe incluir un indicador visual del Norte y la opción de fijar la orientación al Norte ('North-Up'). CA03: La rotación debe ser fluida y mantener los íconos de la interfaz legibles.

@hu22
Feature: Orientación Asistida por Brújula Digital (Compass Overlay)

  Scenario: Real-time map rotation via magnetometer
    Given the device compass sensor is active during navigation
    When the user rotates their physical body and smartphone
    Then the map viewpoint shall smoothly rotate to match their heading orientation.

  Scenario: Visual north indicator and manual compass lock
    Given the user is navigating on the map screen
    When they tap the compass icon on the top right
    Then the map shall lock its orientation to fixed North-up mode.
