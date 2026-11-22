# ResiliNet | HU16
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente de una zona vulnerable a huaicos, quiero recibir una alerta sonora y visual inmediata retransmitida por nodos Bluetooth cercanos para estar advertido sobre un peligro inminente incluso sin conexión a internet ni cobertura celular.
# Acceptance criteria: CA01: El dispositivo sin datos debe procesar paquetes de alerta transmitidos por nodos BLE cercanos en menos de 2 segundos. CA02: La app debe suprimir paquetes duplicados con el mismo identificador único de alerta para evitar falsos disparos repetidos. CA03: La pantalla debe desplegar inmediatamente el tipo de peligro, nivel de urgencia y acción requerida.

@hu16
Feature: Recepción de Alerta Temprana Vía Red en Malla BLE

  Scenario: Recepción correcta de una alerta sin conexión mediante retransmisión por BLE Mesh
    Given que el teléfono inteligente del usuario está sin conexión, sin datos móviles ni acceso a Internet
    When un dispositivo cercano retransmite mediante una red mallada Bluetooth Low Energy (BLE) un paquete de alerta de emergencia verificado
    Then la aplicación deberá procesar la carga útil recibida y activar inmediatamente una alerta sonora y visual en un plazo máximo de 2 segundos.

  Scenario: Identificación y supresión de paquetes duplicados
    Given que una alerta de emergencia con el identificador único 'ALERT-2026-001' ya ha sido activada en el dispositivo
    When se recibe desde otro dispositivo de la red mallada un paquete redundante con el mismo identificador de alerta
    Then el sistema deberá registrar silenciosamente la conexión con el dispositivo de origen, sin volver a activar las alarmas sonoras.
