# ResiliNet | HU08
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario en zona de desastre, quiero que el escaneo Bluetooth consuma el mínimo de batería en segundo plano para mantener el teléfono operativo durante varios días de corte eléctrico.
# Acceptance criteria: CA01: En estado normal sin emergencia activa, el escaneo BLE debe ejecutar ciclos adaptativos (5 segundos activo por 30 en reposo). CA02: Al declararse una alerta crítica, el ciclo debe cambiar a escaneo continuo de alta frecuencia. CA03: El consumo de batería en segundo plano durante standby no debe superar el 3% por cada 12 horas.

@hu08
Feature: Protocolo de Beaconing para Ahorro de Batería en Standby

  Scenario: Adaptive BLE scanning cycles in idle state
    Given no active emergency alert is present in the local network
    When the app operates in background monitoring mode
    Then BLE scanning shall execute in duty cycles of 5 seconds active scan per 30 seconds idle.

  Scenario: Maximize scanning frequency during active hazard
    Given an active 'Critical Emergency' state is declared
    When the device processes mesh communications
    Then BLE discovery duty cycles shall switch to continuous scanning mode.
