# ResiliNet | HU47
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como comerciante local, quiero una lista de cotejo rápida (Checklist) para asegurar productos de alto valor y cortar suministros para proteger la inversión comercial en menos de 5 minutos antes de huir.
# Acceptance criteria: CA01: El módulo comercial debe incluir la lista interactiva 'Modo Asegurar Negocio' con los pasos: 'Elevar Mercadería Crítica', 'Cortar Llave de Gas/Luz', 'Cerrar Rejas' y 'Tomar Caja Chica'. CA02: Al completar todos los puntos, la app debe mostrar 'Local Asegurado - Proceda a Evacuar' y conmutar directamente al modo Navegación Offline. CA03: El estado de las tareas debe conservarse localmente.

@hu47
Feature: Lista de Verificación Rápida para Resguardo de Mercadería (Checklist)

  Scenario: Displaying merchant emergency checklist
    Given the merchant enters 'Modo Asegurar Negocio'
    When the checklist renders
    Then items 'Elevar Mercadería Crítica', 'Cortar Llave de Gas/Luz', 'Cerrar Rejas', and 'Tomar Caja Chica' shall display.

  Scenario: Checklist completion status tracking
    Given the merchant checks off all critical items
    When the final checkbox is marked
    Then the app shall display 'Local Asegurado - Proceda a Evacuar' and transition directly to Navigation Mode.
