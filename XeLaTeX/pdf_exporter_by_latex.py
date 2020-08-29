#!/usr/bin/python3

from jinja2 import FileSystemLoader
from latex.jinja2 import make_env
from latex import build_pdf

env = make_env(loader=FileSystemLoader('.'))


def generate_pdf_by_latex():
    tem_name = "test_report_template.latex"
    print("Report Template Found, named : ", tem_name)
    template = env.get_template(tem_name)
    file_name = "test_report_output" + '.pdf'
    pdf = build_pdf(template.render(msg="Hello World!"))
    pdf.save_to(file_name)
    print("Sucessfully pdf gerenated, named : ", file_name)

generate_pdf_by_latex()