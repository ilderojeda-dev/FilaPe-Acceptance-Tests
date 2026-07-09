Feature: Registro de acciones importantes del usuario

  Background:
    Given que el usuario ha iniciado sesión en FilaPe
    And el sistema mantiene un log de auditoría activo

  Scenario: Registro de acción crítica en log
    Given que el usuario realiza una acción importante dentro del sistema
    And la acción contiene la siguiente información:
      | id_usuario | accion          | dispositivo |
      | USR-001    | Generar ticket  | Celular     |
    When el sistema procesa dicha acción
    Then registra en el log el ID del usuario, la acción realizada, la fecha, la hora y el dispositivo utilizado
    And evita que el registro pueda ser modificado por el usuario
    And permite que el administrador revise el registro cuando sea necesario

  Scenario: Acción crítica no registrada por error del sistema
    Given que el usuario realiza una acción importante dentro de FilaPe
    And el sistema debe guardar dicha acción en el log de auditoría
    When ocurre un error al intentar registrar la acción realizada
    And el log no puede ser almacenado correctamente
    Then el sistema muestra una alerta interna de error de auditoría
    And evita eliminar la información relacionada con la acción realizada
    And notifica al administrador para revisar el problema de trazabilidad