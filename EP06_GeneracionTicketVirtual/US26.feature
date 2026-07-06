Feature: Generación de ticket virtual

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And se encuentra en el módulo de solicitud de turno

  Scenario: Generación exitosa de ticket virtual
    Given que el ciudadano seleccionó los siguientes datos para su atención:
      | entidad | sede              | tramite        |
      | RENIEC  | Sede Lima Centro  | Renovación DNI |
    And cumple con los requisitos necesarios para solicitar atención
    When selecciona la opción "Generar ticket virtual"
    And confirma la solicitud de turno
    Then el sistema crea un ticket virtual asociado al ciudadano
    And registra el turno en la cola correspondiente
    And muestra el mensaje "Ticket virtual generado correctamente"

  Scenario: Generación rechazada por falta de disponibilidad
    Given que el ciudadano seleccionó los siguientes datos para su atención:
      | entidad | sede              | tramite        |
      | RENIEC  | Sede Lima Centro  | Renovación DNI |
    And cumple con los requisitos necesarios para solicitar atención
    When selecciona la opción "Generar ticket virtual"
    And el sistema verifica la disponibilidad de turnos en la sede seleccionada
    Then el sistema no genera el ticket virtual
    And muestra el mensaje "No hay turnos disponibles en este momento"
    And permite al ciudadano seleccionar otra sede o intentar nuevamente más tarde