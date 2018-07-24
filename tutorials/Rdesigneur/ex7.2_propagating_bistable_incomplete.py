## This demo is not yet working.
import moose
import pylab
import re
import rdesigneur as rd

#######################################################################
def parseExpr( expr, params, hasCa ):
    if hasCa:
        expr = expr.replace( 'Ca', 'x0' )
        expr = expr.replace( 'A', 'x1' )
        expr = expr.replace( 'B', 'x2' )
    else:
        expr = expr.replace( 'Ca', 'x0' ) # happens in the negFF model
        expr = expr.replace( 'A', 'x0' ) # This is the usual case.
        expr = expr.replace( 'B', 'x1' )

    parts = re.split( 'k', expr )
    ret = parts[0]
    for i in parts[1:]:
        ret += str( params[ 'k' + i[:2] ] )
        ret += i[2:]

    if hasCa:
        return 'x3*( ' + ret + ')'
    else:
        return 'x2*( ' + ret + ')'

    print( expr )

#######################################################################

def makeChemProto( name, Aexpr, Bexpr, params ):
    sw = params['stimWidth']
    diffLength = params['diffusionLength']
    dca = params['diffConstA'] * diffLength * diffLength
    dcb = params['diffConstB'] * diffLength * diffLength

    # Objects
    library = moose.Neutral( '/library' )
    chem = moose.Neutral( '/library/' + name )
    compt = moose.CubeMesh( '/library/' + name + '/' + name )
    A = moose.Pool( compt.path + '/A' )
    B = moose.Pool( compt.path + '/B' )
    Ca = moose.BufPool( compt.path + '/Ca' )
    Adot = moose.Function( A.path + '/Adot' )
    Bdot = moose.Function( B.path + '/Bdot' )
    A.diffConst = dca
    B.diffConst = dcb

    # Equations

    Adot.expr = parseExpr( Aexpr, params, True )
    Bdot.expr = parseExpr( Bexpr, params, False )

    # Connections
    Adot.x.num = 3
    moose.connect( Ca, 'nOut', Adot.x[0], 'input' )
    moose.connect( A, 'nOut', Adot.x[1], 'input' )
    moose.connect( B, 'nOut', Adot.x[2], 'input' )
    moose.connect( Adot, 'valueOut', A, 'increment' )

    Bdot.x.num = 2
    moose.connect( A, 'nOut', Bdot.x[0], 'input' )
    moose.connect( B, 'nOut', Bdot.x[1], 'input' )
    moose.connect( Bdot, 'valueOut', B, 'increment' )

    return compt

#######################################################################

def makeBis( args ):
    params = {
        'k0a':0.1,  # Constant
        'k1a':-5.0,  # Coeff for A
        'k2a':5.0,  # Coeff for A^2
        'k3a':-1.0,  # Coeff for A^3
        'k4a':10.0,  # turnon of A by A and Ca
        'k5a':-5.0,  # Turnoff of A by B
        'k1b':0.01,  # turnon of B by A
        'k2b':-0.01,   # Decay rate of B
        'diffusionLength':1.0e-6,  # Diffusion characteristic length, used as voxel length too.
        'dendDiameter': 10e-6,  # Diameter of section of dendrite in model
        'dendLength': 100e-6,   # Length of section of dendrite in model
        'diffConstA':5.0,       # Diffusion constant of A
        'diffConstB':2.0,       # Diffusion constant of B
        'stimWidth' :1.0,        # Stimulus width in seconds
        'stimAmplitude':1.0,    # Stimulus amplitude, arb units. From FHN review
        'blankVoxelsAtEnd':10,  # of voxels to leave blank at end of cylinder
        'preStimTime':10.0,     # Time to run before turning on stimulus.
        'postStimTime':40.0,    # Time to run after stimulus. ~3x decay time
        'settleTime':20.0,    # Settling time of response, after stimulus. 
                              # To include in analysis of total response over 
                              # entire dendrite.
    }

    for i in args:
        params[i] = args[i]

    makeChemProto( 'bis', 
        'k0a + k1a*A + k2a*A*A + k3a*A*A*A + k4a*Ca*A/(1+A+10*B) + k5a*A*B',
        'k1b*A*A + k2b*B',
        params )
    return params

########################################################################

makeBis( [] )

rdes = rd.rdesigneur(
    turnOffElec = True,
    diffusionLength = 1e-6,
    chemProto = [['bis', 'bis']],
    chemDistrib = [['bis', 'soma', 'install', '1' ]],
    stimList = [['soma', '1', 'dend/Ca', 'conc', '(t<10)*1.0']],
    plotList = [['soma', '1', 'dend/A', 'conc', 'Concentration of A'],
        ['soma', '1', 'dend/Ca', 'conc', 'Concentration of Ca']],
    moogList = [
            #['soma', '1', 'dend/A', 'conc', 'A Conc', 0, 360 ],
            ['soma', '1', 'dend/Ca', 'conc', 'Ca Conc', 0, 360 ]
    ]
)

rdes.buildModel()
moose.reinit()
moose.showfield( '/model/elec/soma' )

rdes.displayMoogli( 1, 100, 0.001 )
