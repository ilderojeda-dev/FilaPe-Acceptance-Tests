Feature: Consulta del estado del turno

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Consulta del estado del turno desde el celular
    Given que el ciudadano tiene un ticket virtual activo
    And desea conocer el estado de su atención desde su celular
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | estado  |
      | TCK-002   | B014         | Próximo |
    When ingresa a la opción "Estado de mi turno"
    And selecciona el ticket generado
    Then el sistema muestra que el turno está "Próximo"
    And presenta la información actualizada del ticket
    And permite al ciudadano hacer seguimiento remoto de su atención

  Scenario: Estado del turno no encontrado
    Given que el ciudadano ingresa a la opción "Estado de mi turno"
    And no tiene un turno activo asociado a su cuenta
    When el sistema consulta la información del ticket seleccionado
    And no encuentra un turno disponible para seguimiento
    Then el sistema no muestra un estado de turno
    And presenta el mensaje "No existe un turno activo asociado a su cuenta"
    And permite al ciudadano volver a "Mis turnos" o generar un nuevo ticket virtual