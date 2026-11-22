# ResiliNet | HU40
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como líder de brigada, quiero asignar una solicitud de auxilio a un brigadista específico para coordinar el despliegue de rescate de forma ordenada y sin duplicidad.
# Acceptance criteria: CA01: El coordinador debe poder seleccionar un incidente no asignado y presionar 'Asignar A: [Nombre de Brigadista]'. CA02: El estado del incidente debe cambiar a 'Asignado' y generar una notificación en el dispositivo del brigadista. CA03: Al completarse el rescate, el brigadista debe poder presionar 'Marcar Atendido / Rescatado' para actualizar el tablero consolidado.

@hu40
Feature: Asignación y Distribución de Tareas a Equipos de Rescate

  Scenario: Assigning incident to specific brigadier ID
    Given an unassigned distress report from 'Familia Quispe'
    When the coordinator selects 'Asignar A: Brigadista Juan Pérez'
    Then the incident status shall update to 'Asignado' and trigger a notification on Juan's device.

  Scenario: Updating incident resolution state offline
    Given Brigadista Juan completes the rescue
    When he taps 'Marcar Atendido / Rescatado'
    Then the incident badge shall transition to green 'Atendido' across all connected dashboard views.
