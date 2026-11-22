# ResiliNet | HU28
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente atrapado en una vivienda o ruta por el barro, quiero presionar el botón de 'Auxilio' para enviar mi ubicación exacta a los equipos de rescate cercanos de forma prioritaria.
# Acceptance criteria: CA01: La interfaz debe presentar un botón prominente rojo 'Solicitar Auxilio / Atrapado'. CA02: Para evitar disparos accidentales, se requiere mantener presionado el botón durante 1 segundo. CA03: Al activarse, el teléfono debe emitir un paquete SOS de alta prioridad de forma continua y un chasquido sonoro periódico para guiado de rescate.

@hu28
Feature: Emisión de Solicitud de Auxilio de Emergencia ('Auxilio / Atrapado')

  Scenario: High priority broadcast of emergency SOS signal
    Given the user is trapped and taps the red 'Solicitar Auxilio / Atrapado' button
    When they hold the button for 1 second
    Then an emergency SOS packet with high priority flag and GPS location shall be continuously broadcast over mesh.

  Scenario: Local confirmation and active distress beacon
    Given the SOS signal has been triggered
    When the app updates its state
    Then the UI shall display a flashing distress beacon and emit a periodic audio locator chirp.
