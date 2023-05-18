from robot.api import ExecutionResult


def get_test_status(path):
    result = ExecutionResult(path)

    # Criar listas para os testes passados e falhados
    passed_tests = []
    failed_tests = []

    # Separar os testes passados e falhados em listas
    for test in result.suite.tests:
        if test.status == 'PASS':
            passed_tests.append(test.name)
        elif test.status == 'FAIL':
            failed_tests.append(test.name)

    message = f'Resultados dos Testes de API:\nPassados: {len(passed_tests)} {passed_tests}\nFalhados: {len(failed_tests)} {failed_tests}'

    return message
