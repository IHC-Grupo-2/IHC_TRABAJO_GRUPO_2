# ResiliNet | HU18
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como habitante evacuando de noche bajo lluvia torrencial, quiero una interfaz de alto contraste con botones gigantes y vibración para interactuar sin errores con la pantalla mojada en medio de la oscuridad.
# Acceptance criteria: CA01: Al activarse el modo emergencia, la interfaz debe conmutar a fondo negro con elementos en amarillo/cian de alto contraste. CA02: Los botones principales de acción debe tener un tamaño mínimo de 64x64 dp para facilitar el toque con dedos mojados. CA03: Cada interacción táctil exitosa debe proporcionar una respuesta háptica (vibración fuerte).

@hu18
Feature: Interfaz de Alto Contraste para Lluvia y Oscuridad

  Scenario: Toggling emergency high contrast mode
    Given an active emergency state is detected or toggled
    When the app renders the interface
    Then UI elements shall switch to dark background, high contrast yellow/cyan text, and oversized touch targets.

  Scenario: Haptic vibration feedback on button press
    Given the user taps any primary action button in high contrast mode
    When the touch event is registered
    Then the smartphone motor shall execute a distinct strong vibration pulse confirming the input.
