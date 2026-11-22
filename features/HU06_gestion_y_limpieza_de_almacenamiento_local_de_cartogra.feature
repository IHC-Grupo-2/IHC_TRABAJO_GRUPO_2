# ResiliNet | HU06
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario con memoria limitada en el teléfono, quiero gestionar los paquetes de mapas descargados para liberar espacio sin borrar la zona crítica de mi hogar.
# Acceptance criteria: CA01: El sistema debe mostrar el tamaño de almacenamiento consumido por cada paquete de mapas. CA02: El usuario debe poder eliminar paquetes obsoletos o de zonas secundarias. CA03: La zona designada como 'Hogar Principal' debe requerir confirmación explícita para evitar eliminaciones accidentales.

@hu06
Feature: Gestión y Limpieza de Almacenamiento Local de Cartografía

  Scenario: Deleting non-essential map packages
    Given the user views the 'Map Management' settings screen
    When they select an unneeded district map and tap 'Eliminar Paquete'
    Then the system shall erase the map tiles and free the corresponding internal storage.

  Scenario: Protection of primary home zone map
    Given a map package is designated as 'Zona de Residencia Principal'
    When the user attempts to delete it during emergency season
    Then the app shall request explicit confirmation warning about offline risk.
