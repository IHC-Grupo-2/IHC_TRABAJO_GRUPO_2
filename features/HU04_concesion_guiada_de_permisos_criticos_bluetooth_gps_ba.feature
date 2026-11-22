# ResiliNet | HU04
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario en configuración inicial, quiero otorgar permisos de Bluetooth, Ubicación GPS y optimización de batería mediante una pantalla guiada para garantizar el funcionamiento continuo y automático de la transmisión en malla offline.
# Acceptance criteria: CA01: La aplicación debe explicar el propósito técnico de cada permiso antes de solicitarlo al sistema operativo. CA02: El usuario debe poder conceder cada permiso directamente mediante interruptores o botones dedicados. CA03: Si un permiso crítico es rechazado, la app debe advertir el impacto en la red mesh y ofrecer una opción para habilitarlo posteriormente.

@hu04
Feature: Concesión Guiada de Permisos Críticos (Bluetooth, GPS, batería)

  Scenario: Concesión de todos los permisos críticos
    Given el usuario se encuentra en la pantalla de configuración de permisos del sistema
    When presiona 'Permitir Todos' y confirma los diálogos nativos de Bluetooth, GPS y Batería
    Then la aplicación activa la antena BLE en segundo plano y redirige a la pantalla principal con el indicador mesh en verde.

  Scenario: Rechazo parcial de permisos de ubicación
    Given el usuario rechaza el permiso de ubicación en segundo plano
    When intenta finalizar la configuración de permisos
    Then el sistema presenta una advertencia destacada indicando que las rutas de evacuación no funcionarán automáticamente en pantalla apagada.
