# ResiliNet | HU39
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista, quiero marcar un manzano o calle como 'Sector Inspeccionado / Despejado' para evitar que otros equipos pierdan tiempo volviendo a revisar la misma área.
# Acceptance criteria: CA01: El líder de equipo debe poder trazar o seleccionar un polígono de manzano en el mapa y presionar 'Marcar Manzana Despejada'. CA02: El sector marcado debe teñirse de verde en el mapa con la etiqueta 'Inspeccionado - Despejado'. CA03: La actualización del sector debe transmitirse por la red mesh para actualizar los mapas de las demás patrullas.

@hu39
Feature: Marcado y Delimitación de Sectores Inspeccionados

  Scenario: Marking sector block as cleared on map
    Given a brigade team finishes inspecting Block C in Sector 1
    When the team leader taps 'Marcar Manzana Despejada' and draws a boundary
    Then the map polygon for Block C shall turn green with label 'Inspeccionado - Despejado'.

  Scenario: Broadcasting sector status update over mesh
    Given a block is marked as 'Inspeccionado'
    When the action is recorded
    Then an update payload shall broadcast over the mesh to update maps on all other brigadier devices.
