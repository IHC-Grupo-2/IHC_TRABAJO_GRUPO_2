# ResiliNet | HU33
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como jefe de hogar, quiero ver la lista de mis contactos registrados y su último estado reportado ('A salvo', 'Auxilio', 'Sin reporte') para saber si mi familia está segura sin necesidad de realizar llamadas celulares.
# Acceptance criteria: CA01: La pestaña 'Mi Familia' debe listar los contactos agregados indicando su insignia de estado, hora del último reporte y distancia relativa. CA02: Los contactos que emitan un reporte de 'Auxilio' deben fijarse en la parte superior de la lista resaltados en rojo. CA03: La información de los contactos debe actualizarse automáticamente mediante los paquetes recolectados por la red mesh.

@hu33
Feature: Consulta de Estado de Familiares y Contactos Cercanos

  Scenario: Displaying status summary of linked emergency contacts
    Given the user opens the 'Mi Familia' tab
    When the status list is populated from mesh packets
    Then each contact shall display their name, status badge, timestamp, and distance relative to user.

  Scenario: Highlight contacts in distress
    Given a linked family contact broadcasts an 'Auxilio' status packet
    When the status list updates
    Then that contact row shall pin to the top of the list highlighted in red with an audible alert.
