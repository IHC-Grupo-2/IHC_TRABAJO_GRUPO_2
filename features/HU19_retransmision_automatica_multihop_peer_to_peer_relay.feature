# ResiliNet | HU19
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario de la red comunitaria ResiliNet, quiero que mi aplicación actúe como nodo retransmisor automático de alertas para propagar la señal de emergencia hacia vecinos físicamente distantes en la cuenca.
# Acceptance criteria: CA01: La app debe retransmitir automáticamente paquetes de alerta con TTL > 0 a todos los dispositivos Bluetooth en un rango de 100 metros. CA02: Cada retransmisión debe decrementar el contador TTL en 1 unidad. CA03: Al llegar a TTL = 0, la app debe consumir el paquete localmente y detener la retransmisión.

@hu19
Feature: Retransmisión Automática Multihop (Peer-to-Peer Relay)

  Scenario: Automatic multihop relay of unexpired alert payload
    Given the application receives a valid emergency alert with Time-To-Live (TTL) greater than 0
    When the device detects available Bluetooth peers within 100 meters range
    Then it shall automatically rebroadcast the encrypted payload to all nearby peers.

  Scenario: Halting relay for depleted TTL packets
    Given an incoming alert packet has a Time-To-Live (TTL) count equal to 0
    When the packet is received by the application node
    Then the device shall consume the alert locally and refrain from further mesh broadcasting.
