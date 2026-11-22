# ResiliNet | HU36
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista, quiero identificar en el mapa las viviendas con niños, adultos mayores o personas con discapacidad para acudir prioritariamente a asistirlas durante la evacuación.
# Acceptance criteria: CA01: El mapa de brigada debe superponer íconos distintivos (silla de ruedas, adulto mayor, niño) sobre las viviendas con dependientes vulnerables. CA02: La lista de llamadas de auxilio debe priorizar automáticamente los casos originados en perfiles etiquetados como vulnerables. CA03: Los datos de vulnerabilidad deben estar cargados en la caché local desde el registro previo de residentes.

@hu36
Feature: Mapeo y Categorización de Personas de Grupos Vulnerables

  Scenario: Displaying vulnerable population icons on map
    Given pre-registered profile data indicates vulnerable residents in Sector 2
    When the brigadier enables the 'Grupos Vulnerables' map filter
    Then visual icons (wheelchair, elderly, child) shall display on top of their respective residential location.

  Scenario: Sorting distress calls by vulnerability index
    Given multiple SOS distress calls are active in the sector
    When the brigadier views the rescue queue
    Then requests originating from profiles tagged with vulnerable dependents shall be automatically prioritized at top.
