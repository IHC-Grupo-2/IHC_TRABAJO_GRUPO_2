# ResiliNet | HU30
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como rescatista, quiero usar la potencia de señal Bluetooth (RSSI) para estimar la cercanía física de una persona atrapada en escombros o barro sin visibilidad.
# Acceptance criteria: CA01: La app del rescatista debe calcular la distancia estimada en metros basada en el valor RSSI de la señal SOS recibida. CA02: La interfaz debe presentar un gráfico de barras de intensidad de señal y acelerar el tono sonoro a medida que el rescatista se acerca. CA03: La función debe operar completamente en modo P2P directo sin requerir GPS o señal celular.

@hu30
Feature: Rastreo Local P2P por Detección de Proximidad Bluetooth (RSSI)

  Scenario: Estimating distance based on BLE signal strength
    Given a victim's smartphone is actively broadcasting an SOS beacon
    When a rescuer device receives the advertisement packet
    Then the app shall calculate and display estimated proximity (e.g., 'Aproximadamente 12 metros').

  Scenario: Visual RSSI signal strength meter update
    Given a rescuer walks closer to the broadcasting distress beacon
    When the received RSSI value increases
    Then a signal strength bar graph shall increase and audio beep frequency shall accelerate.
