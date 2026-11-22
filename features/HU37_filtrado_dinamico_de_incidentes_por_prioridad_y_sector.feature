# ResiliNet | HU37
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como coordinador de brigada, quiero filtrar la lista de incidentes por gravedad y sector específico para asignar grupos de apoyo sin saturar a los rescatistas en terreno.
# Acceptance criteria: CA01: El panel debe incluir filtros combinables por sector geográfico (ej. 'Sector 2 - Zona Alta') y nivel de prioridad ('Prioridad 1 - Peligro Vital'). CA02: Al aplicar un filtro, la lista e íconos en el mapa deben actualizarse instantáneamente. CA03: Debe incluir un contador de incidentes pendientes según la vista filtrada.

@hu37
Feature: Filtrado Dinámico de Incidentes por Prioridad y Sector

  Scenario: Filtering incident list by geographic sector
    Given the brigadier receives incident reports across 4 sectors
    When they apply the filter 'Sector 2 - Zona Alta'
    Then the active incident list shall show only distress reports originating from Sector 2 coordinates.

  Scenario: Filtering by critical severity tag
    Given the incident list is populated
    When the brigadier selects filter 'Prioridad 1 - Peligro Vital / Colapso'
    Then only life-threatening emergency entries shall remain visible.
