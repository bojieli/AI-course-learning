<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  Deduction of ``lsclassifier''

  Target: minimize <math|<big|sum><rsup|m><rsub|i=1><around*|(|<big|sum><rsup|n><rsub|j=1>x<rsub|ij>w<rsub|j>-y<rsub|i>|)><rsup|2>+\<lambda\><big|sum><rsup|n><rsub|i=1>w<rsub|i><rsup|2>>

  let <math|<frac|df|dw<rsub|k>>=0>, for a given <math|k>, we get

  <math|<big|sum><rsub|i><around*|(|2<big|sum><rsub|j>x<rsub|ij>w<rsub|j>x<rsub|ik>-2y<rsub|i>x<rsub|ik>|)>+2\<lambda\>w<rsub|k>=0>

  <math|<big|sum><rsub|i><around*|(|x<rsub|ik><around*|(|<big|sum><rsub|j>x<rsub|ij>w<rsub|j>-y<rsub|i>|)>+\<lambda\>w<rsub|k>|)>=0>

  <math|<big|sum><rsub|i><big|sum><rsub|j>x<rsub|ik>x<rsub|ij>w<rsub|j>-<big|sum><rsub|i>x<rsub|ik>y<rsub|i>+\<lambda\>w<rsub|k>=0>

  <math|<big|sum><rsub|j><around*|(|<big|sum><rsub|i>x<rsub|ik>x<rsub|ij>|)>w<rsub|j>+\<lambda\>w<rsub|k>=<big|sum><rsub|i>x<rsub|ik>y<rsub|i>>

  There is a such equation for each <math|k>. In matrix form:

  <math|<around*|(|X<rsup|T>X+\<lambda\>|)>w=X<rsup|T>Y>

  where <math|X> is training data, <math|Y> is training label.
</body>