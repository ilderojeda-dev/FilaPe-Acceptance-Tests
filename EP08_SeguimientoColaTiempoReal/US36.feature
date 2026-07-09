Feature: Posición actual en cola

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Visualización de posición actual en cola
    Given que el ciudadano tiene un ticket virtual activo
    And la entidad pública mantiene actualizada la cola de atención
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | posicion_actual | estado    |
      | TCK-002   | B014         | 8               | Pendiente |
    When el ciudadano ingresa a la sección "Seguimiento de turno"
    And consulta el estado de su ticket
    Then el sistema muestra su posición actual en la cola como "8"
    And actualiza la posición conforme avanza la atención
    And permite al ciudadano saber cuánto falta para ser atendido

  Scenario: Posición en cola no disponible por ticket inactivo
    Given que el ciudadano selecciona un ticket registrado en su cuenta
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | estado    |
      | TCK-002   | B014         | Cancelado |
    When el sistema consulta la posición actual en la cola
    And detecta que el ticket ya no participa en la atención activa
    Then el sistema no muestra una posición vigente en la cola
    And informa al ciudadano que el ticket se encuentra inactivo
    And permite regresar al listado de turnos o generar un nuevo ticket