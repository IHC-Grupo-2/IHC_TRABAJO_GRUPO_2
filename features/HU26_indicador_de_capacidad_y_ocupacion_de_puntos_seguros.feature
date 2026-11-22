# ResiliNet | HU26
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista, quiero actualizar y consultar el porcentaje de ocupación de un refugio para redirigir a los evacuados hacia puntos seguros con espacio disponible.
# Acceptance criteria: CA01: Un brigadista debe poder actualizar el nivel de ocupación de un refugio (ej. '80% - Casi Lleno', '100% - Saturado') y transmitirlo por la red mesh. CA02: El ícono del refugio debe cambiar de color según el nivel de ocupación en los dispositivos cercanos. CA03: El algoritmo de navegación debe omitir puntos seguros con 100% de ocupación y dirigir al usuario al siguiente punto más cercano.

@hu26
Feature: Indicador de Capacidad y Ocupación de Puntos Seguros

  Scenario: Updating safe zone capacity status offline
    Given a brigadier arrives at 'Refugio Colegio San Martín'
    When they select capacity level '80% - Casi Lleno' and broadcast via mesh
    Then the icon color for that safe zone shall change to yellow on neighboring devices.

  Scenario: Rerouting away from 100% saturated safe zones
    Given a safe zone status is marked as '100% - Saturado'
    When a new user calculates an evacuation route
    Then the navigation algorithm shall prioritize the next nearest safe zone with available space.
