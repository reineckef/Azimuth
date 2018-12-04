#!/usr/bin/env python2
import sys
import azimuth.model_comparison
import numpy as np

def main(argv):
   predictions = azimuth.model_comparison.predict(np.array( [ sys.argv[1] ] ), np.array( [ float(sys.argv[2]) ] ), np.array( [ float(sys.argv[3]) ] ))

   for i, prediction in enumerate(predictions):
      print sys.argv[1], prediction

if __name__ == "__main__":
   main(sys.argv[1:])
