# ResiliNet | HU10
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como jefe de familia, quiero ver la ubicación exacta de los refugios temporales y lozas deportivas seguras en el mapa para reunirme con mis familiares tras el desastre.
# Acceptance criteria: CA01: El mapa offline debe incluir íconos distintivos para refugios, lozas deportivas y puestos médicos. CA02: Al presionar sobre un punto seguro, debe desplegarse una ficha informativa con capacidad, altitud sobre el río y servicios. CA03: El usuario debe poder filtrar la vista del mapa mostrando únicamente los puntos de encuentro.

@hu10
Feature: Visualización de Puntos de Encuentro y Refugios Temporales

  Scenario: Displaying verified safe zone markers
    Given the user opens the offline map interface
    When they filter by 'Puntos de Encuentro'
    Then icon markers for official shelters, medical posts, and safe zones shall appear with clear labels.

  Scenario: Displaying shelter detail summary offline
    Given the user taps on a specific safe zone icon 'Losa Deportiva Pedregal'
    When the detail pop-up opens offline
    Then it shall display capacity, elevation above river level, and available basic services.
