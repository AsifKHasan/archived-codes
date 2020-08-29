#!/usr/bin/env python3

'''
Usage: ./dbscript_validator.py ./sql
'''

import sys
import re
import json
import greptile
from functional import seq
from functools import reduce

def column_with_table(table, columns):
    return [ '\t'.join([table, c["name"], c["type"], str(c.get("precision", "-")), str(c.get("scale", "-")), "Yes" if c["required"] == True else "-", str(c.get("default", "-"))]) for c in columns ]

def output2text(result):
    with open('./result_script.txt', 'w') as outfile:
        result = reduce(lambda x,y:x+y, [ f["tables"] for f in result ])
        result = list(map(lambda t: column_with_table(t["table"], t["columns"]), result))
        result = reduce(lambda x,y:x+y, [ l for l in result ])
        outfile.write('\n'.join(result))

def output2json(result):
    with open('./result_script.json', 'w') as outfile:
        json.dump(result, outfile, indent=2, separators=(',', ':'))

def parse_column(s):
    d = {}
    s = s.strip().rstrip(',')

    if re.search(r'[\s]+not null', s, flags=re.IGNORECASE) is not None:
        d['required'] = True
        s = re.sub(r'[\s]+not null', '', s, flags=re.IGNORECASE)
    else:
        d['required'] = False

    if re.search(r'[\s]+default[\s]+', s, flags=re.IGNORECASE) is not None:
        f = '[\s]+default[\s]+(?P<value>.+)'
        mo = re.search(f, s, flags=re.IGNORECASE)
        d['default'] = mo.group('value')
        s = re.sub(re.escape(mo.group(0)), '', s, flags=re.IGNORECASE)

    r = '^(?P<name>.+?)[\s]+(?P<type>[ a-z0-9(),]+)'
    mo = re.search(r, s)
    d['name'] = mo.group('name')
    t = mo.group('type').strip().rstrip(')').replace('(', ',').split(',')
    if len(t) >= 1:
        d['type'] = t[0]
    if len(t) >= 2:
        d['precision'] = int(t[1])
    if len(t) >= 3:
        d['scale'] = int(t[2])


    return d

def parse_constraint(s):
    r = '^(?P<name>.+?)[\s]+(?P<text>.+$)'
    d = {}
    mo = re.search(r, s)
    d['name'] = mo.group('name')
    text = mo.group('text')
    if text.startswith('primary key'):
        d['type'] = 'primary'
        text = re.sub('primary key\s+', '', text)
        d['column'] = seq(text.lstrip('(').rstrip(')').split(',')).map(lambda c: c.strip()).to_list()
    elif text.startswith('unique'):
        d['type'] = 'unique'
        text = re.sub('unique\s+', '', text)
        d['column'] = text.lstrip('(').rstrip(')')
    elif text.startswith('foreign key'):
        d['type'] = 'foreign key'
        text = re.sub('foreign key\s+', '', text).split('references')
        if len(text) >= 1:
            d['column'] = text[0].strip().rstrip(')').lstrip('(')
        if len(text) >= 2:
            str = text[1].strip().rstrip(')').split('(')
            if len(str) >= 1:
                d['referenceTable'] = str[0]
            if len(str) >= 2:
                d['referenceColumn'] = str[1]
    elif text.startswith('check'):
        d['type'] = 'check'
        text = re.sub('check\s+', '', text).lstrip('(').rstrip(')')
        mo_col = re.search('^[\s]*(?P<col_name>.+?)[\s]+', text)
        col_name = mo_col.group('col_name')
        d['column'] = col_name
        r = '\s*'+col_name + '\s*=\s*\'([A-Za-z0-9-_ ]*)\''
        d['values'] = re.findall(r, text)
    else:
        d['type'] = 'none'
        d['text'] = text
        pass

    return d

def get_columns(tableObject, sqlText):
    tableObject['columns'] = seq(sqlText).filter_not(lambda l: re.search(r'^constraint\s', l)).map(lambda s: parse_column(s)).to_list()
    tableObject['constraints'] = seq(sqlText).filter(lambda l: re.search(r'^constraint\s', l)).map(lambda l: re.sub('constraint\s+', '', l)).map(lambda s: parse_constraint(s)).to_list()
    return tableObject

def get_tablebody(fileContent, table):
    r = "CREATE TABLE[\s]+" + table + '[\s]+.+?;'
    ro = re.search(r, fileContent, re.DOTALL)
    if ro is not None:
        mo = re.search(r'\((?P<body>.+)\)', ro.group(), re.DOTALL)
        l = re.sub(r',[\s]*\n', ',,', mo.group('body')).split(',,')
        return seq(l).map(lambda s: re.sub(r'\s+', ' ', s)).map(lambda s: ' '.join(s.split())).to_list()
    else:
        return []

def list_tables(sqlFile):
    with open(sqlFile, 'r') as content_file:
        fileContent = content_file.read()

    return (seq(fileContent.split('\n'))
        .filter(lambda l: re.search(r'CREATE TABLE[\s]+[A-Za-z0-9_.]+[\s]*', l))
        .map(lambda l: re.sub(r'[\s]*CREATE TABLE[\s]+', '', l).split(' ')[0])
        .map(lambda t: {'table': t})
        .map(lambda d: get_columns(d, get_tablebody(fileContent, d['table'])))
        .to_list()
        )

def list_files(rootDir):
    return greptile.grep_rl(r'CREATE TABLE[ \t]+[A-Za-z0-9._]+', rootDir, '.sql')

def browse(rootDir):
    return (seq(list_files(rootDir))
            .map(lambda f: {'filePath': f, 'tables': list_tables(f)})
            .to_list()
            )

def main():
    if (len(sys.argv) < 2):
        print('Usage:', sys.argv[0], 'rootPath')
        exit(-1)

    result = browse(sys.argv[1])
    output2json(result)
    output2text(result)

if __name__ == '__main__':
    main()
