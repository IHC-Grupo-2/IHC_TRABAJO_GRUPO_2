# ResiliNet | HU46
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como bodeguero de la zona de riesgo, quiero ver un temporizador con el tiempo estimado de llegada del huaico (20-30 min) para decidir cuándo dejar de atender y asegurar mi local comercial antes de evacuar.
# Acceptance criteria: CA01: Al recibirse la alerta de cuenca alta, la app del comerciante debe activar un temporizador regresivo visible (ej. '25:00 Minutos para Impacto Estimado'). CA02: Al llegar a los umbrales de 10 y 5 minutos, la app debe emitir alertas sonoras persistentes: 'Cierre el local y comience evacuación inmediata'. CA03: El cálculo del temporizador debe basarse en la distancia y velocidad estimada del flujo reportada por los vigías.

@hu46
Feature: Cuenta Regresiva de Ventana de Evacuación Comercial (20-30 min)

  Scenario: Displaying countdown timer upon early warning trigger
    Given an early warning alert is confirmed in the upper watershed
    When the merchant receives the alert packet
    Then a prominent countdown timer (e.g., '25:00 Minutos para Impacto Estimado') shall activate on the home screen.

  Scenario: Audio warning thresholds at 10 and 5 minutes remaining
    Given the countdown timer reaches 10 minutes remaining
    When the threshold is crossed
    Then the app shall sound a persistent warning prompt: 'Cierre el local y comience evacuación inmediata'.
