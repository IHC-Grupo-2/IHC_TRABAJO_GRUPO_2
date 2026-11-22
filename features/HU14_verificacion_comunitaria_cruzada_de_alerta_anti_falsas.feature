# ResiliNet | HU14
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como habitante de la zona, quiero que la plataforma requiera la confirmación de un segundo vecino o brigadista para validar una alerta comunitaria para evitar el pánico y el caos por falsas alarmas.
# Acceptance criteria: CA01: Una alerta emitida por un residente no verificado debe mostrarse con el estado 'Pendiente de Confirmación'. CA02: Cuando un segundo usuario o brigadista valida la alerta desde su dispositivo, el estado debe actualizarse automáticamente a 'Alerta Confirmada'. CA03: La sirena de máxima prioridad solo debe sonar fuerte de forma automática cuando la alerta alcanza el estado verificado.

@hu14
Feature: Verificación Comunitaria Cruzada de Alerta (Anti-Falsas Alarmas)

  Scenario: Marking alert as pending until cross-confirmation
    Given a first resident emits an unverified emergency report
    When neighboring devices receive the initial payload
    Then the application shall display the report with status 'Unverified - Awaiting Confirmation'.

  Scenario: Upgrading alert status upon secondary peer endorsement
    Given an alert status is currently 'Unverified - Awaiting Confirmation'
    When a registered brigadier or second independent resident validates the hazard
    Then the app status shall instantly upgrade to 'Confirmed Emergency' across all mesh nodes.
