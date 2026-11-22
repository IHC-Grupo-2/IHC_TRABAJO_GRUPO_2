# ResiliNet | HU09
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista, quiero activar una capa con las franjas marginales y quebradas activas en el mapa para evaluar las zonas de mayor peligro durante el monitoreo.
# Acceptance criteria: CA01: El mapa debe permitir conmutar la capa de 'Riesgo Geológico y Quebradas'. CA02: Las franjas de flujo de lodo e inundación deben renderizarse con polígonos semitransparentes coloreados según severidad. CA03: Las capas de riesgo deben almacenarse en la caché local para consulta offline.

@hu09
Feature: Renderizado Topográfico de Capas de Riesgo Geológico

  Scenario: Toggling hazard overlay layers
    Given the user is viewing the offline map
    When they select the 'Zonas de Inundación y Huaico' layer toggle
    Then semi-transparent red polygons representing historical mudflow channels shall overlay the map.

  Scenario: Layer persistence in offline state
    Given the hazard layers were enabled prior to disconnecting from internet
    When the app is reopened in full offline mode
    Then all vector risk polygons shall render instantly from local cache.
