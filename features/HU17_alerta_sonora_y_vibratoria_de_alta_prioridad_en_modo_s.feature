# ResiliNet | HU17
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente que descansa durante la noche, quiero que las alertas críticas sobrepasen el modo 'No Molestar' de mi teléfono para despertar a mi familia inmediatamente antes del impacto del huaico.
# Acceptance criteria: CA01: Las alertas clasificadas como 'Emergencia Crítica' deben forzar la salida de audio al máximo volumen incluso en modo silencioso o No Molestar. CA02: El motor háptico del teléfono debe activar un patrón continuo de vibración de alta intensidad. CA03: La alarma sonora solo debe silenciarse mediante una acción explícita del usuario presionando 'Reconocer Advertencia'.

@hu17
Feature: Alerta Sonora y Vibratoria de Alta Prioridad en Modo Silencioso

  Scenario: High priority audio override of system silent settings
    Given the user smartphone is set to Silent or Do Not Disturb mode
    When a critical severity alert is received through the mesh network
    Then the app shall force full volume speaker output and maximum haptic vibration pattern.

  Scenario: Manual acknowledgement to mute emergency alarm
    Given the emergency alarm sound is actively playing at maximum volume
    When the user presses the 'Acknowledge Warning' button on screen
    Then the audible alarm shall stop while maintaining the emergency status banner visible.
