from .tasks import parse_binlog


def a():
    parse_binlog.delay(2,3)