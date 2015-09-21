#convert Chemical Models to SBML 
#Moose needs to be compiled with libsbml: USE_SBML=1
import moose
moose.loadModel('../genesis/Kholodenko.g','/Kholodenko')
moose.writeSBML('../genesis/Kholodenko.xml','/Kholodenko')
