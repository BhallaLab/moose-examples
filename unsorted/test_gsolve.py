import moose
compt = moose.CubeMesh('/compt')
compt.volume = 1e-20

a = moose.Pool('/compt/a')
b = moose.Pool('/compt/b')

a.nInit, b.nInit = 100, 10

atab = moose.Table2('/tableA')
btab = moose.Table2('/tableB')
moose.connect(atab, 'requestOut', a, 'getN')
moose.connect(btab, 'requestOut', b, 'getN')

# Add a function which set conc of a

## NOTE: This cause seg-fault.
func = moose.Function('/compt/a/function')

# This does not.
#func = moose.Function('/func')

func.expr = '100*(1 + sin(0.1*t))'
func.mode = 1
moose.connect(func, 'valueOut', a, 'setN')

reac = moose.Reac('/compt/reac')
moose.connect(reac, 'sub', a, 'reac')
moose.connect(reac, 'prd', b, 'reac')
reac.Kf = 2
reac.Kb = 1

gsolve = moose.Gsolve('/compt/gsolve')
stoich = moose.Stoich('/compt/stoich')
stoich.compartment = compt
stoich.ksolve = gsolve
stoich.path = '/compt/##'

print("Reinit")
moose.reinit()
moose.start(100)
print("Done simulation")

# plots
import pylab
pylab.plot(atab.vector)
pylab.plot(btab.vector)
pylab.show()
