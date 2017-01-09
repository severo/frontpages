#!./unes/bin/python
import sys
import time
import datetime
import os
from configobj import ConfigObj
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from PyQt4.QtWebKit import *

class Screenshot(QWebView):
    def __init__(self):
        self.app = QApplication(sys.argv)
        QWebView.__init__(self)
        self._loaded = False
        self.loadFinished.connect(self._loadFinished)

    def capture(self, url, output_file):
        self.load(QUrl(url))
        self.wait_load()
        # set to webpage size
        frame = self.page().mainFrame()
        self.page().setViewportSize(frame.contentsSize())
        # render image
        image = QImage(self.page().viewportSize(), QImage.Format_ARGB32)
        painter = QPainter(image)
        frame.render(painter)
        painter.end()
        print 'saving', output_file
        image.save(output_file)

    def wait_load(self, delay=0):
        # process app events until page loaded
        while not self._loaded:
            self.app.processEvents()
            time.sleep(delay)
        self._loaded = False

    def _loadFinished(self, result):
        self._loaded = True

def createDir(baseDir):
    # Essayer de creer le repertoire des captures s'il n'existe pas
    # http://stackoverflow.com/a/14364249/7351594
    try:
        os.makedirs(baseDir)
    except OSError:
        if not os.path.isdir(baseDir):
            raise

config = ConfigObj('unes.conf')
baseDir = config['baseDir']

s = Screenshot()
for site, params in config['sites'].iteritems():
    url = params['url']
    siteDir = os.path.join(os.sep, baseDir, site)
    createDir(siteDir)
    date = datetime.datetime.now()
    datePath = date.strftime("%Y%m%d%H%M%S")
    screenshotFilename = os.path.join(os.sep, siteDir, datePath + '.png')
    s.capture(url, screenshotFilename)
