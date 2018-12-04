#!/usr/bin/env python2
import sys
import azimuth.model_comparison
import numpy as np

def main(argv):
   guides = []
   positions = []
   proteins = []

   with open( sys.argv[1], 'r') as file_object:
        line = file_object.readline().rstrip()
        while line:
           elements = line.split("\t")
           # print(elements)
           guides.append( str(elements[0]) )
           positions.append( float(elements[1]) )
           proteins.append( float(elements[2]) )

           line = file_object.readline().rstrip()

   predictions = azimuth.model_comparison.predict( np.array( guides ), np.array(  positions  ), np.array(  proteins  ))

   for i, prediction in enumerate(predictions):
      print guides[i], prediction

if __name__ == "__main__":
   main(sys.argv[1:])

