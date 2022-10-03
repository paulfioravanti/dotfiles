"""
Elixir-related Ultisnips snippet helper functions.
NOTE: Changes to this file require restarting Vim!
"""
import re

_DASHES_AND_UNDERSCORES = re.compile("[-_]")
_MODULE_FILEPATH = re.compile(r"lib\/([^\/]+)\/([\w+\/]+)*\/([^\/]+).ex")
_CLOSING_CHARACTERS = {
    "(": ")",
    "{": "}",
    "[": "]",
    "\"": "\""
}
_NON_MODULE_DIRNAMES = [
    "controllers",
    "lib",
    "live",
    "views"
]

def closing_character(tabstop):
    """
    Return closing character for a tabstop containing an opening character.
    """
    if tabstop:
        return _CLOSING_CHARACTERS.get(tabstop[0], "")
    return ""

def root_module_name(path):
    """
    Return name for a root Elixir module from a file path.
    """
    return _module_parts(path)[0]

def module_path_match(path, regex=_MODULE_FILEPATH):
    """
    Return match data for an Elixir module from a file path.
    """
    return re.search(regex, path)

def to_module_name(string):
    """
    Convert string into an Elixir module name
    """
    return (
        re.sub(_DASHES_AND_UNDERSCORES, " ", string)
        .title()
        .replace(" ", "")
        .replace(".ex", "")
    )

def _module_parts(path):
    path_parts = path.split("/")
    for dirname in _NON_MODULE_DIRNAMES:
        if dirname in path_parts:
            path_parts.remove(dirname)
    return list(map(to_module_name, path_parts))
