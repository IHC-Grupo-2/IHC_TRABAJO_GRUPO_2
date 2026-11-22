# ResiliNet | HU20
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como administrador del sistema offline, quiero que las alertas expiren automáticamente tras un tiempo configurado para no confundir a los usuarios con emergencias pasadas.
# Acceptance criteria: CA01: Cada paquete de alerta debe incluir un sello de tiempo de creación y una duración de validez (ej. 60 minutos). CA02: Al expirar el tiempo, la app debe mover automáticamente la alerta de la vista activa a la pestaña de 'Historial'. CA03: La app debe descartar paquetes recibidos con sello de tiempo mayor a 2 horas sin procesarlos ni retransmitirlos.

@hu20
Feature: Control de Tiempo de Vida y Expiración de Alerta (TTL)

  Scenario: Automatic expiration of outdated emergency alerts
    Given an emergency alert was issued with a validity duration of 60 minutes
    When the local device time surpasses the alert expiration timestamp
    Then the UI shall move the alert from 'Active Emergency' to 'Historical Alerts' tab.

  Scenario: Rejecting outdated alert packets received via mesh
    Given a peer transmits an alert packet whose creation timestamp is older than 2 hours
    When the receiving device parses the packet header
    Then it shall discard the message without saving or rebroadcasting it.
