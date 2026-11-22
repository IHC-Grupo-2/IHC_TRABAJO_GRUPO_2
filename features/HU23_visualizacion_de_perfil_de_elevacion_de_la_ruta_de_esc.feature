# ResiliNet | HU23
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como habitante evacuando con adultos mayores, quiero ver el perfil de pendiente de la ruta para elegir el camino con la subida menos inclinada y peligrosa.
# Acceptance criteria: CA01: La app debe renderizar un gráfico de perfil de elevación (ganancia en metros vs. distancia caminada). CA02: Los tramos con pendientes superiores al 25% deben resaltarse en rojo con la advertencia 'Pendiente Empinada'. CA03: El cálculo de elevación debe realizarse de forma local desde los datos topográficos precargados.

@hu23
Feature: Visualización de Perfil de Elevación de la Ruta de Escape

  Scenario: Displaying route elevation profile
    Given an offline pedestrian route is computed
    When the user swipes up the route details panel
    Then a profile chart showing elevation gain (meters) versus walking distance shall be rendered.

  Scenario: Highlighting steep slope warnings
    Given a segment of the proposed route exceeds a 25% incline gradient
    When the elevation chart is drawn
    Then that segment shall be highlighted in red with a 'Pendiente Empinada' label.
