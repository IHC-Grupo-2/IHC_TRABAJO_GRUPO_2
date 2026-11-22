# ResiliNet | HU29
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como persona atrapada, quiero que la app apague la pantalla y funciones no esenciales manteniendo solo el beacon Bluetooth de socorro para prolongar la batería al máximo durante horas de espera de rescate.
# Acceptance criteria: CA01: Tras activar la señal de auxilio, la app debe permitir entrar en 'Ahorro Crítico de Batería'. CA02: En este modo, el brillo de pantalla se reduce al mínimo o se apaga, y los ciclos de renderizado se suspenden. CA03: El balizamiento BLE SOS se mantiene activo consumiendo menos del 1% de batería por hora.

@hu29
Feature: Modo de Ahorro Crítico de Energía Durante Situación de Auxilio

  Scenario: Activating ultra battery saver mode upon SOS trigger
    Given the user triggers the 'Auxilio / Atrapado' status
    When they tap 'Activar Ahorro Crítico de Batería'
    Then the app shall dim screen brightness to minimum, stop background rendering, and maintain low-power BLE beaconing.

  Scenario: Deactivating battery saver mode via hold interaction
    Given the device is operating in ultra battery saver mode
    When the user holds the screen for 3 seconds
    Then full screen brightness and normal interactive UI shall be restored.
