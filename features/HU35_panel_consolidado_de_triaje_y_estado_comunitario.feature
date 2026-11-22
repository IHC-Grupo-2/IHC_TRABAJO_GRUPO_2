# ResiliNet | HU35
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista de Defensa Civil, quiero ver un panel resumen con el total de vecinos 'A Salvo', 'Requiere Auxilio' y 'Sin Reporte' para organizar las prioridades de evacuación y rescate en el sector.
# Acceptance criteria: CA01: El panel de brigada debe mostrar contadores consolidados y gráficos circulares de la población evacuada, en auxilio y no ubicada. CA02: Los contadores deben actualizarse dinámicamente a medida que llegan paquetes de la red mesh. CA03: El panel debe permitir conmutar entre vista general del sector y desglose por manzanas.

@hu35
Feature: Panel Consolidado de Triaje y Estado Comunitario

  Scenario: Displaying aggregated neighborhood status metrics
    Given a brigadier opens the 'Panel de Control de Brigada'
    When the local mesh database aggregates status packets
    Then pie charts and counters shall display: Total Evacuados, Solicitudes de Auxilio Pendientes, y Personas Unlocated.

  Scenario: Real-time counter increments from mesh sync
    Given the brigadier is monitoring the dashboard
    When new status packets arrive over the BLE mesh
    Then the corresponding counters shall automatically increment without manual refresh.
