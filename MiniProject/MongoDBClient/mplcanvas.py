from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

class MplCanvs(FigureCanvas):
    def __init__(self, parent=None, width=5, height=4, dpi=100, n_data = 20):
        fig = Figure(figsize=(width, height), dpi=dpi)
        self.axes = fig.add_subplot(111)
        self.axes.get_xaxis().set_visible(True)

        self.compute_initial_figure()

        FigureCanvas.__init__(self, fig)
        self.setParent(parent)
        FigureCanvas.updateGeometry(self)

        self.xdata = list(range(n_data))
        self.ydata = [0 for i in range(n_data)]
        self.hdata = [0 for i in range(n_data)]

        self.axes.cla()  # Clear the canvas.
        self.drawStyle()
        self.axes.plot(self.xdata, self.ydata, 'r')

    def updateData(self, newData={'Humidity': 0, 'Temperature': 0}):
        newTemp = newData['Humidity']
        newHumidity = newData['Temperature']

        self.ydata = self.ydata[1:] + [newTemp]
        self.hdata = self.hdata[1:] + [newHumidity]

        self.axes.cla()  # Clear the canvas.
        self.drawStyle()
        self.axes.plot(self.xdata, self.ydata, 'ro')
        self.axes.plot(self.xdata, self.hdata, 'bo')
        # Trigger the canvas to update and redraw.
        self.draw()

    def drawStyle(self):
        self.axes.grid(True)
        self.axes.set_ylim(ymin=0, ymax=100)
        self.axes.set_xlim(xmin=0, xmax=24)

    def compute_initial_figure(self):
        pass