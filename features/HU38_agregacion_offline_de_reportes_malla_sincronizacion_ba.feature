# ResiliNet | HU38
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como brigadista desplegado en terreno, quiero que mi app recolecte los datos de todos los teléfonos que cruzo al caminar para consolidar la información del sector de forma pasiva y automática.
# Acceptance criteria: CA01: La app del brigadista en movimiento debe recolectar silenciosamente registros de estado pendientes de los teléfonos en rango BLE. CA02: Al retornar al puesto de mando, la app debe ofrecer un botón 'Sincronizar Datos de Campo' para volcar los registros recolectados a la tablet principal del coordinador. CA03: La transferencia debe realizarse vía Wi-Fi Direct / Mesh sin necesidad de acceso a internet.

@hu38
Feature: Agregación Offline de Reportes Malla (Sincronización Barrial)

  Scenario: Passive background aggregation of neighbor status
    Given a brigadier walks through a neighborhood sector
    When their smartphone comes within BLE range of resident devices
    Then it shall silently harvest pending status logs and update its central local database.

  Scenario: Data summary compilation upon return to command post
    Given the brigadier returns to the central brigade post
    When they initiate 'Sincronizar Datos de Campo'
    Then all harvested resident records shall sync to the coordinator's primary tablet over local Wi-Fi/mesh.
