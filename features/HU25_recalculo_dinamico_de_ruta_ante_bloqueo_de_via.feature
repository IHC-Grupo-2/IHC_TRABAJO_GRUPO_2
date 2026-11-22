# ResiliNet | HU25
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente en evacuación, quiero que la app recalcule mi ruta automáticamente cuando me encuentre con un camino bloqueado por lodo o rocas para no perder tiempo retrocediendo a ciegas y encontrar una vía alternativa segura.
# Acceptance criteria: CA01: Al acercarse a menos de 15 metros de una vía marcada como bloqueada, la app debe recalcular automáticamente la ruta alternativa. CA02: Si la posición GPS del usuario se desvía más de 20 metros de la ruta trazada, la app debe actualizar el trayecto desde su ubicación actual. CA03: El recálculo debe ejecutarse completamente en modo offline sin latencia superior a 1 segundo.

@hu25
Feature: Recálculo Dinámico de Ruta ante Bloqueo de Vía

  Scenario: Rerouting around user-reported street blockade
    Given the user approaches an intersection marked as 'Vía Bloqueada'
    When the GPS position gets within 15 meters of the obstruction
    Then the app shall dynamically recalculate an alternative pedestrian path to the safe zone.

  Scenario: Prompting manual alternative route recalculation
    Given the user strays off the suggested evacuation path due to physical obstacles
    When their GPS location deviates more than 20 meters from the line
    Then the app shall instantly update the path from their current position.
