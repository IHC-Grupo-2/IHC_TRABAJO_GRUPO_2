# ResiliNet | HU45
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista de Defensa Civil, quiero emitir un aviso de 'Peligro Mitigado / Retorno Seguro' para notificar a la comunidad que la emergencia ha finalizado y permitir el retorno ordenado.
# Acceptance criteria: CA01: Solo los usuarios con credencial verificada de Brigadista/Autoridad pueden acceder a la función 'Finalizar Emergencia'. CA02: Al emitir el paquete de cierre, la señal se propaga por la red mesh deteniendo las alarmas sonoras y mostrando 'Zona Segura - Peligro Superado'. CA03: Si un usuario estándar intenta activar la función de cierre, la app debe rechazar la acción indicando acceso restringido.

@hu45
Feature: Cierre y Cancelación Oficial de Alerta de Emergencia

  Scenario: Propagating official alert termination packet
    Given an authorized brigadier initiates the 'End Emergency' protocol
    When the termination payload is broadcast over the BLE mesh network
    Then all receiving nodes shall stop emergency alarm tones and display 'Zona Segura - Peligro Superado'.

  Scenario: Authorization check for alert termination
    Given a standard resident user attempts to trigger 'End Emergency'
    When they tap the button in the UI
    Then the app shall reject the action displaying 'Acceso Restringido a Brigadistas Autorizados'.
