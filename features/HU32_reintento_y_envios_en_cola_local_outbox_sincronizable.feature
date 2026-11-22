# ResiliNet | HU32
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente sin nodos mesh cercanos en ese instante, quiero que mis mensajes queden retenidos localmente y se envíen automáticamente al detectar un dispositivo móvil pasando para asegurar que mis avisos se propaguen en el primer momento en que exista un puente de red.
# Acceptance criteria: CA01: Si no hay nodos BLE en rango al emitir un mensaje, la app debe almacenarlo en la base de datos local 'Outbox' con estado 'Pendiente de Sincronización'. CA02: Tan pronto como la antena BLE detecte un dispositivo par en rango, la app debe vaciar silenciosamente la cola de salida transmitiendo los paquetes retenidos. CA03: El usuario debe poder consultar en pantalla el número de mensajes retenidos en la bandeja de salida.

@hu32
Feature: Reintento y Envíos en Cola Local (Outbox Sincronizable)

  Scenario: Storing outgoing status packets in local database queue
    Given the user triggers an 'A Salvo' report while 0 BLE peers are detected
    When the transmission fails
    Then the status packet shall be saved in the local Outbox database with status 'Pending Sync'.

  Scenario: Automatic flush of queued messages upon peer connection
    Given there are 2 pending messages in the local Outbox
    When the device detects and connects to a BLE mesh peer
    Then it shall silently transmit the queued packets and update their status to 'Sent via Mesh'.
