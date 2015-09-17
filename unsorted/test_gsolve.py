import moose
compt = moose.CubeMesh('/compt')

a = moose.Pool('/compt/a')
b = moose.Pool('/compt/b')

a.concInit, b.concInit = 0.1, 0.2

atab = moose.Table2('/tableA')
btab = moose.Table2('/tableB')
moose.connect(atab, 'requestOut', a, 'getConc')
moose.connect(btab, 'requestOut', b, 'getConc')

# Add a function which set conc of a
#func = moose.Function('/compt/a/function')
func = moose.Function('/func')
func.expr = 'y0*sin(t)'
func.mode = 1
moose.connect(func, 'requestOut', b, 'getConc') 
moose.connect(func, 'valueOut', a, 'setConc')

reac = moose.Reac('/compt/reac')
moose.connect(reac, 'sub', a, 'reac')
moose.connect(reac, 'prd', b, 'reac')
reac.Kf = 1
reac.Kb = 0.1

gsolve = moose.Gsolve('/compt/gsolve')
stoich = moose.Stoich('/compt/stoich')
stoich.compartment = compt
stoich.ksolve = gsolve
stoich.path = '/compt/##'

print("Reinit")
moose.reinit()
moose.start(1)
print("Done simulation")

# plots
import pylab
pylab.plot(atab.vector)
pylab.plot(btab.vector)
pylab.show()
