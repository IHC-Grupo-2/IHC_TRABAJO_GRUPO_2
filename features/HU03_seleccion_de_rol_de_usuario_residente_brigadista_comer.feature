# ResiliNet | HU03
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como usuario registrado, quiero indicar si soy Residente, Brigadista o Comerciante Local para que la interfaz adapte sus herramientas y accesos según mis responsabilidades comunitarias.
# Acceptance criteria: CA01: El sistema debe mostrar los roles disponibles (Residente / Jefe de Hogar, Brigadista de Defensa Civil y Comerciante / Bodeguero) con una breve descripción de cada uno. CA02: El usuario debe poder seleccionar su rol principal con un solo toque durante el Onboarding. CA03: La pantalla de inicio y la navegación principal deben adaptar sus accesos según el rol seleccionado.

@hu03
Feature: Selección de Rol de Usuario (Residente / Brigadista / Comerciante)

  Scenario: Selección exitosa de rol principal
    Given el usuario ha confirmado sus datos personales
    When selecciona la tarjeta del rol 'Residente' y presiona 'Confirmar Rol'
    Then el sistema guarda la configuración en la base de datos local y adapta la interfaz principal con accesos para el hogar y rutas.

  Scenario: Cambio de rol antes de finalizar la configuración
    Given el usuario seleccionó el rol 'Comerciante' por error
    When selecciona la opción 'Cambiar Rol' antes de finalizar el Onboarding
    Then el sistema permite seleccionar otro rol (ej. 'Brigadista') y actualiza las vistas correspondientes.
