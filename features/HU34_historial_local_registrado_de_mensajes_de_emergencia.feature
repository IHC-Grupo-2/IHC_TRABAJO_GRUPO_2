# ResiliNet | HU34
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como habitante, quiero revisar la bitácora local de alertas y mensajes recibidos cronológicamente para entender la evolución de la emergencia en mi sector de forma clara.
# Acceptance criteria: CA01: La pantalla 'Historial de Emergencia' debe mostrar todos los mensajes enviados y recibidos ordenados por hora. CA02: El usuario debe poder aplicar filtros por tipo de mensaje (ej. 'Solo Solicitudes de Auxilio', 'Alertas Oficiales'). CA03: La bitácora debe almacenarse localmente para consulta permanente en modo offline.

@hu34
Feature: Historial Local Registrado de Mensajes de Emergencia

  Scenario: Displaying chronological message history offline
    Given the user accesses the 'Historial de Emergencia' screen
    When the view loads offline
    Then all received and sent alerts shall be listed chronologically with timestamp and source identifier.

  Scenario: Filtering history by message priority
    Given the user views the local message history
    When they tap the filter 'Solo Solicitudes de Auxilio'
    Then the list shall filter to show exclusively SOS distress packets.
