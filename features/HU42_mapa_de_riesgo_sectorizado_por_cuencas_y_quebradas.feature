# ResiliNet | HU42
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista, quiero consultar la zonificación de peligro por colores de las quebradas para desplegar vigilancia en los puntos con mayor probabilidad de deslizamiento.
# Acceptance criteria: CA01: El mapa debe colorear los sectores en Rojo (Extremo), Naranja (Alto) y Amarillo (Moderado) según la inclinación e historial hídrico. CA02: Al presionar sobre una quebrada (ej. 'Quebrada Carossio'), debe mostrarse la velocidad estimada del flujo y tiempo de llegada a la avenida principal. CA03: La información hidrogeológica debe ser accesible de forma 100% offline.

@hu42
Feature: Mapa de Riesgo Sectorizado por Cuencas y Quebradas

  Scenario: Rendering sector risk heatmap on map
    Given the brigadier opens the sector map
    When they activate 'Mapa de Riesgo por Quebradas'
    Then polygon overlays shall color sectors in Red (Extremo), Orange (Alto), and Yellow (Moderado).

  Scenario: Displaying sector hydro-geological info pop-up
    Given the user taps on 'Quebrada Carossio'
    When the pop-up opens offline
    Then it shall display historical mudflow velocity, estimated arrival time to main avenue, and recommended check points.
