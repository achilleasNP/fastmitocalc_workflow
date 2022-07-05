# A WDL workflow for fastmitocalc

The repository contains the workflow and a Dockerfile for the running container.
The fastMitoCalc code is from https://github.com/HSGU-NIA/mitoAnalyzer 
commit: f738250ec25a1982f19df402209d5197075507ab

The fastMitoCalc.pl code is patched to look for cram index files of the form 
cramfile.cram.crai instead of cramfile.crai (as in the original code).

The dxCompile.Dockerfile can be used to create a container with the dna nexus
dxCompile software, if you don't want install the software locally.
