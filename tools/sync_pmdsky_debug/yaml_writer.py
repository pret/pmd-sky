from typing import Any
from ruamel.yaml import YAML
from ruamel.yaml.emitter import RoundTripEmitter

# Used to avoid reloading the same YAML file multiple times if it is already loaded.
class YamlManager(object):

    def __init__(self):
        self.yaml_contents = None
        self.yaml_path = None

    def read_yaml(self, yaml_path: str):
        if yaml_path == self.yaml_path:
            return self.yaml_contents

        self.write_yaml()
        self.yaml_path = yaml_path

        with open(yaml_path, 'r') as yaml_file:
            self.yaml_contents = yaml.load(yaml_file)
        return self.yaml_contents

    def write_yaml(self):
        if self.yaml_path:
            with open(self.yaml_path, 'w') as yaml_file:
                yaml.dump(self.yaml_contents, yaml_file)
            self.yaml_path = None

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.write_yaml()

class PreserveWhitespaceEmitter(RoundTripEmitter):

    # Removes the check for consecutive newline characters when indenting, so that blank lines within strings are indented properly.
    def write_literal(self, text: Any, comment: Any = None) -> None:
        hints, _indent, _indicator = self.determine_block_hints(text)
        if not isinstance(comment, str):
            comment = ''
        self.write_indicator('|' + hints + comment, True)
        if _indicator == '+':
            self.open_ended = True
        self.write_line_break()
        breaks = True
        start = end = 0
        while end <= len(text):
            ch = None
            if end < len(text):
                ch = text[end]
            if breaks:
                for br in text[start:end]:
                    if br == '\n':
                        self.write_line_break()
                    else:
                        self.write_line_break(br)
                if ch is not None:
                    if self.root_context:
                        idnx = self.indent if self.indent is not None else 0
                        self.stream.write(' ' * (_indent + idnx))
                    else:
                        self.write_indent()
                start = end
            else:
                if ch is None or ch in '\n\x85\u2028\u2029':
                    data = text[start:end]
                    if bool(self.encoding):
                        data = data.encode(self.encoding)
                    self.stream.write(data)
                    if ch is None:
                        self.write_line_break()
                    start = end
            if ch is not None:
                breaks = ch in '\n\x85\u2028\u2029'
            end += 1

yaml = YAML()
yaml.preserve_quotes = True
yaml.width = float('inf')
yaml.indent(sequence=4, offset=2)
yaml.Emitter = PreserveWhitespaceEmitter
