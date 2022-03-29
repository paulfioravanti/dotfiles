'''
Elixir-related Ultisnips snippet helper functions.
'''
import re

_DASHES_AND_UNDERSCORES = re.compile("[-_]")
_MODULE_FILEPATH = re.compile(r"lib\/([^\/]+)\/(?:(?:[^\/]+)\/)*([^\/]+).ex")

def closing_character(opening):
    '''
    Return closing character for an opening one.
    '''
    if opening == "{":
        return "}"
    if opening == "[":
        return "]"
    if opening == "\"":
        return opening

    return ""

def module_path_match(path, regex=_MODULE_FILEPATH):
    '''
    Return match data for an Elixir module from a file path.
    '''
    return re.search(regex, path)

def outer_module_name(path):
    '''
    Return name for an outer Elixir module from a file path.
    '''
    outer_module_path = module_path_match(path).group(1)
    return to_module_name(outer_module_path)

def to_module_name(string):
    '''
    Convert string into an Elixir module name
    '''
    return (
        re.sub(_DASHES_AND_UNDERSCORES, " ", string)
        .title()
        .replace(" ", "")
    )
