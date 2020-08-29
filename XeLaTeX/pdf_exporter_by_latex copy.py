import os
import uuid

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from jinja2 import FileSystemLoader
from latex.jinja2 import make_env
from latex import build_pdf

env = make_env(loader=FileSystemLoader('templates'))

def generate_pdf_by_latex(template_name, data):
    path = os.path.abspath(os.path.dirname(__name__))
    fs = FileSystemStorage(path + '/report_output')
    template = env.get_template(template_name)

    file_name = template_name + str(uuid.uuid4()) + '.pdf'
    pdf = build_pdf(template.render(data=data))
    pdf.save_to("report_output/"+file_name)

    with fs.open(file_name) as pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        response['Content-Disposition'] = 'attachment; filename="' + file_name + '"'

        return response

