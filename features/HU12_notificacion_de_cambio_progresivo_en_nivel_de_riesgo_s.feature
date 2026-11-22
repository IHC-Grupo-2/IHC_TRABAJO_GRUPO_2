# ResiliNet | HU12
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente, quiero recibir notificaciones de nivel de riesgo por colores (Verde, Amarillo, Naranja, Rojo) para preparar la evacuación gradualmente antes de la alerta máxima.
# Acceptance criteria: CA01: El indicador principal de la barra superior debe cambiar de color según el nivel de riesgo (Verde=Normal, Amarillo=Aviso, Naranja=Pre-Evacuación, Rojo=Evacuación Inminente). CA02: Cada cambio de nivel debe emitir un tono sonoro distintivo y mostrar recomendaciones específicas. CA03: La aplicación debe mantener visible la última alerta recibida con su marca de tiempo.

@hu12
Feature: Notificación de Cambio Progresivo en Nivel de Riesgo (Semáforo)

  Scenario: Visual update of risk level indicator
    Given the current neighborhood status is 'Nivel Amarillo - Lluvia Intensa'
    When a verified update packet changes the status to 'Nivel Naranja - Pre-Evacuación'
    Then the top app bar shall transition to orange and display specific preparation guidelines.

  Scenario: Distinct tone triggers for level changes
    Given the app receives a status upgrade from Yellow to Orange level
    When the update is applied locally
    Then the app shall play a distinct moderate warning sound pattern.
