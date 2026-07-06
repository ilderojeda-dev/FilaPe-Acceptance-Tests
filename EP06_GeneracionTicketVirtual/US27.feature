Feature: Visualización de número de turno

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Visualización del número de turno asignado
    Given que el ticket se encuentra activo
    And el ticket contiene la siguiente información:
      | entidad | sede             | tramite        | numero_turno |
      | RENIEC  | Sede Lima Centro | Renovación DNI | A025         |
    When el ciudadano ingresa a la sección "Mis turnos"
    And selecciona el ticket generado
    Then el sistema muestra el número de turno "A025"
    And indica la entidad, sede y trámite asociado
    And mantiene disponible la información mientras el ticket siga activo

  Scenario: Número de turno no disponible por ticket inactivo
    Given que el ciudadano selecciona un ticket registrado en su cuenta
    And el ticket contiene la siguiente información:
      | numero_turno | estado    |
      | A025         | Cancelado |
    When el sistema consulta la información del ticket seleccionado
    And detecta que el ticket ya no está disponible para atención
    Then el sistema no muestra un número de turno activo
    And informa al ciudadano que el ticket se encuentra cancelado, vencido o inactivo
    And permite regresar al listado de turnos o generar un nuevo ticket