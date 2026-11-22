# ResiliNet | HU31
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario en situación de estrés, quiero seleccionar mensajes prediseñados ('Hay heridos', 'Casa colapsada', 'Se necesita agua') para enviar reportes precisos en segundos sin necesidad de escribir texto.
# Acceptance criteria: CA01: La app debe ofrecer un menú desplegable de plantillas rápidas ('Hay heridos', 'Camino bloqueado', 'Necesito medicina', etc.). CA02: Al seleccionar una plantilla, la app debe adjuntar automáticamente coordenadas GPS y porcentaje de batería actual. CA03: El mensaje empaquetado debe firmarse y enviarse inmediatamente a través de la red en malla.

@hu31
Feature: Mensajería de Emergencia Preconfigurada Offline (Menú Rápido)

  Scenario: Selecting and sending pre-formatted distress message
    Given the user opens the quick message menu
    When they tap 'Hay Adultos Mayores Atrapados' and confirm
    Then the pre-formatted text payload shall be signed and transmitted through the mesh network.

  Scenario: Appending automated location metadata to message
    Given a user selects any pre-configured message template
    When the payload is compiled
    Then current GPS coordinates and battery status shall be automatically appended to the message.
