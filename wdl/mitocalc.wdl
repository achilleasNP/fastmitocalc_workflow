workflow run_fastmitocalc {
  File bamFile
  File bamFileIndex
  String mitoString
  call fastmitocalc  {
    input: inputBam=bamFile,inputBamIndex=bamFileIndex,mitoString=mitoString
  }
}

task fastmitocalc {
  File inputBam
  File inputBamIndex
  String?  mitoString
  String?  autosomePrefix
  String?  build


  command  {
    mkdir res && \
    fastMitoCalc -e ${default="chr" autosomePrefix} \
                 -m ${default="MT" mitoString} \
                 -g ${default="38" build} \
                 -w "./res" \
                 -p `which BaseCoverage` \
                 -f ${inputBam}
  }

  output {
    File myout = stdout()
    File myerr = stderr()
    Array[File] outputs = glob("res/*")
  }

  runtime {
   docker: "achilleasnp/mitoanalyzer:v0.0.4a"
  }

}
