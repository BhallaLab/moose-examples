# demo_gui.py ---
#
# Filename: demo_gui.py
# Description:
# Author: Subhasis Ray
# Maintainer:
# Created: Wed Jun 16 05:41:58 2010 (+0530)
# Version:
# Last-Updated: Tue May 30 15:19:52 2023 (+0530)
#           By: Subhasis Ray
#     Update #: 487
# URL:

# Change log:
# Tuesday 18 September 2018 09:51:56 AM IST`
#           Qt Related changes.

import matplotlib.pyplot as plt
import numpy

try:
    from PyQt5.QtWidgets import (
        QMainWindow,
        QFrame,
        QPushButton,
        QLabel,
        QGridLayout,
        QSizePolicy,
        QVBoxLayout,
        QApplication,
    )

    from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
    from matplotlib.backends.backend_qt5agg import (
        NavigationToolbar2QT as NavigationToolbar,
    )
except ImportError as e:
    print('PyQt5 is not found. Doing nothing')
    quit()


from Izhikevich import IzhikevichDemo


class IzhikevichGui(QMainWindow):
    """This is a Qt version of the GUI"""

    def __init__(self, *args):
        QMainWindow.__init__(self, *args)
        self.demo = IzhikevichDemo()
        self.demoFrame = QFrame(self)
        self.controlPanel = QFrame(self.demoFrame)
        # Map figlabels A-T from Izhi paper to params
        # i.e., 'F' -> 'spike_freq_adapt'
        self.label_title = {
            value[0]: key for key, value in IzhikevichDemo.parameters.items()
        }
        labels = sorted(self.label_title.keys())
        length = len(labels)
        rows = int(numpy.rint(numpy.sqrt(length)))
        cols = int(numpy.ceil(length * 1.0 / rows))
        layout = QGridLayout()
        for ii, label in enumerate(labels):
            row = ii // cols
            col = ii % cols
            title = self.label_title[label]
            button = QPushButton(title, self)
            button.setToolTip(self.tr(IzhikevichDemo.documentation[title]))
            layout.addWidget(button, row, col)
            # NOTE: There is a trick here:
            # button.clicked(checked=False) sends a boolean param, but
            # we need to ignore that, while storing the associated
            # `title` local to the lambda, which is done via the
            # keyword param
            button.clicked.connect(
                lambda checked, key=title: self._simulateAndPlot(key)
            )
            print('connected', title)

        self.controlPanel.setLayout(layout)
        self.figure = plt.figure()
        self.plotPanel = FigureCanvas(self.figure)
        self.navbar = NavigationToolbar(self.plotPanel, self)
        self.VmPlot = self.figure.add_subplot(211)
        (self.VmCurve,) = self.VmPlot.plot([], [], label='Vm (mV)')
        self.VmPlot.set_xlabel('time (ms)')
        self.VmPlot.set_ylabel('Vm (mV)')
        self.ImPlot = self.figure.add_subplot(212)
        (self.ImCurve,) = self.ImPlot.plot([], [], label='Im (nA)')
        self.ImPlot.set_xlabel('time (ms)')
        self.ImPlot.set_ylabel('Im (nA)')
        self.descriptionWidget = QLabel(
            'Click any of the buttons to simulate and plot the corresponding neuron.'
        )
        self.descriptionWidget.setFrameStyle(QFrame.Panel | QFrame.Sunken)
        sizePolicy = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
        self.descriptionWidget.setSizePolicy(sizePolicy)
        layout = QVBoxLayout()
        layout.addWidget(self.plotPanel)
        layout.addWidget(self.navbar)
        layout.addWidget(self.descriptionWidget)
        layout.addWidget(self.controlPanel)
        self.demoFrame.setLayout(layout)
        self.setCentralWidget(self.demoFrame)

    def _simulateAndPlot(self, key):
        key = str(key)
        equationText = self.demo.getEquation(key).replace('\n', '<br/>')
        doc = IzhikevichDemo.documentation[key].replace('\n', '<br/>')
        text = '<b>%s:</b> %s<p><b>Equation:</b><br/> %s' % (key, doc, equationText)
        self.descriptionWidget.setText(self.tr(text))
        #         if key == 'accommodation':
        #             mbox = QtGui.QMessageBox(self)
        #             mbox.setText(self.tr('Accommodation cannot be shown with regular Izhikevich model.'))
        #             mbox.setDetailedText(self.tr('\
        # Equation for u for the accommodating neuron is: \
        # u\' = a * b * (V + 65)\n Which is different from \
        # the regular equation u\' = a * (b*V - u) and cannot \
        # be obtained from the latter by any choice of a and b.'))
        #             mbox.show()
        #             return
        (time, Vm, Im) = self.demo.simulate(key)
        Vm = numpy.array(Vm.vector) * 1e3
        Im = numpy.array(Im.vector) * 1e9
        self.VmCurve.set_data(time, Vm)
        self.ImCurve.set_data(time, Im)
        self.VmPlot.relim()  # Recalculate limits
        self.VmPlot.autoscale_view(True, True, True)  # Autoscale
        self.ImPlot.relim()  # Recalculate limits
        self.ImPlot.autoscale_view(True, True, True)  # Autoscale
        print('#######', key, Vm)
        self.plotPanel.draw()
        self.demoFrame.repaint()


import sys

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWin = IzhikevichGui()
    mainWin.show()
    sys.exit(app.exec_())

#
# demo_gui.py ends here
