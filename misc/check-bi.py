#!/usr/bin/env python3

import smtplib
import time
import os
import shlex
import logging
import requests
import subprocess
from datetime import datetime
from apscheduler.schedulers.blocking import BlockingScheduler


class MonitorOBIEE(object):

    _URL = 'http://10.100.26.35:9704/analytics'
    # _TO = ['asif.hasan@gamil.com', 'sharafat@spectrum-bd.com', 'tanim1109135@gmail.com', 'anisur.rahman@spectrum-bd.com', 'raqibul.islam@spectrum-bd.com', 'imamhosaindc@gmail.com']
    _TO = ['asif@spectrum-bd.com','asif.hasan@gmail.com', 'sharafat@spectrum-bd.com', 'ktanim@spectrum-bd.com', 'anisur.rahman@spectrum-bd.com','raqibul.islam@spectrum-bd.com', 'sahed@spectrum-bd.com']
    # _TO = ['tanim1109135@gmail.com']
    _OBIEE = 'DR'

    # Gmail
    _FROM_EMAIL = 'callingforsalat@gmail.com'
    _FROM_EMAIL_PWD = '123!@salat#'
    _SMTP_HOST = 'smtp.gmail.com'
    _SMTP_PORT = 587
    _IS_SENT_EMAIL_SUCCESS = False
    _IS_SENT_EMAIL_FAILED = False

    def __init__(self):
        try:
            self.setup_logger()
        except Exception as e:
            self.logger.exception('An exception occurred while instance Monitor OBIEE : %s', e)

    def setup_logger(self):
        logging_format = '%(asctime)s %(filename)s:%(lineno)d %(levelname)s - %(message)s'
        logging.basicConfig(level=logging.INFO, format=logging_format)
        self.logger = logging.getLogger('check-bi')
        self.log_file_path = os.getcwd() + '/monitor-obiee.log'
        handler = logging.FileHandler(self.log_file_path)
        formatter = logging.Formatter(logging_format)
        handler.setFormatter(formatter)
        self.logger.addHandler(handler)

    def calculate_time(self):
        millis = int(round(time.time() * 1000)) - self.start_time
        seconds = round(((millis / 1000) % 60), 2)
        self.logger.info('Execution time : {} seconds'.format(seconds))

    def send_mail(self, is_running=False):
        server = smtplib.SMTP(self._SMTP_HOST, self._SMTP_PORT)
        server.ehlo()
        server.starttls()
        server.login(self._FROM_EMAIL, self._FROM_EMAIL_PWD)
        now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if is_running:
            email_subject = '[BI-{}] is running'.format(self._OBIEE)
            message_body = 'Dear Concern,\n\nYour [BI-{}] analytics is running.\nDate Time : {}\nStatus : Success\n\nBest Regards,\nPython Script\nFrom BI-{}'.format(self._OBIEE, now, self._OBIEE)
        else:
            email_subject = '[BI-{}] has stopped!!!'.format(self._OBIEE)
            message_body = 'Dear Concern,\n\nYour [BI-{}] analytics has stopped!!!.\n Date Time : {}\nStatus : Success\n\nBest Regards,\nPython Script\nFrom BI-{}'.format(self._OBIEE, now, self._OBIEE)
        BODY = '\r\n'.join(["To: %s" % ', '.join(self._TO),
                            'From: %s' % self._FROM_EMAIL,
                            'Subject: %s' % email_subject,
                            '', message_body])
        try:
            server.sendmail(self._FROM_EMAIL, self._TO, BODY)
            self.logger.info('Email sent Successfully')
        except Exception as e:
            self.logger.exception('An exception occurred while sending email : %s', e)
        server.quit()

    def stop_obiee(self):
        subprocess.call(shlex.split(
            '/bin/sh stop_obiee.sh'
        ))

    def start_obiee(self):
        subprocess.call(shlex.split(
            '/bin/sh StartStopServices.sh start_all'
        ))

    def check_obiee(self):
        try:
            self.logger.info('Trying to connect : {}'.format(self._URL))
            self.response = requests.get(self._URL)
            if self.response.status_code == 200:
                self.logger.info('OBIEE analytics is running')
                if self._IS_SENT_EMAIL_SUCCESS is False:
                    self.send_mail(True)
                    self._IS_SENT_EMAIL_SUCCESS = True
                    self._IS_SENT_EMAIL_FAILED = False
                return
            self.logger.error(self.response)
        except Exception as e:
            self.logger.error("OBIEE analytics is stopped!!!")
        if self._IS_SENT_EMAIL_FAILED is False:
            self.send_mail(False)
            self._IS_SENT_EMAIL_FAILED = True
            self._IS_SENT_EMAIL_SUCCESS = False
        self.stop_obiee()
        self.start_obiee()

    def run(self, first_argument=None):
        self.start_time = int(round(time.time() * 1000))
        self.check_obiee()
        self.calculate_time()


def job(monitor=None):
    monitor.run()


if __name__ == '__main__':
    monitor = MonitorOBIEE()
    scheduler = BlockingScheduler()
    scheduler.add_job(job, 'interval', seconds=30, kwargs={'monitor': monitor})
    scheduler.start()
