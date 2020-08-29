
#!/usr/bin/python3

from jinja2 import FileSystemLoader
from latex.jinja2 import make_env
from latex.build import LatexMkBuilder
from jinja2 import Environment,  FileSystemLoader
import json
import os

env = Environment(
    block_start_string='%{',
    block_end_string='%}',
    variable_start_string='%{{',
    variable_end_string='%}}',
    loader=FileSystemLoader(".")
)


def generate_pdf_by_latex():
    tem_name = "test_bangla.tex"
    print("Report Template Found, named : ", tem_name)
    template = env.get_template(tem_name)
    file_name = "test_report_output" + '.pdf'
    builder = LatexMkBuilder(variant='xelatex')

    with open('test.json') as data_file:
        data = json.load(data_file)

    pdf = builder.build_pdf(template.render(data=data))
    pdf.save_to(file_name)
    print("Sucessfully pdf gerenated, named : ", file_name)

generate_pdf_by_latex()