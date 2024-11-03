
# MAGPIE X QuixBugs

  

Hi! This will be the instructions that you need to follow to get the demo of MAGPIE running on bugs from the QuixBugs Dataset.

  
  

# Prerequisites

  

- Python 3.9

- JDK 11

- magpie source code directory (under master_legacy branch)

  **Tip**: Do have a read on MAGPIE's documentation before you proceed, link to the docs is here: [MAGPIE DOCS](https://github.com/bloa/magpie/tree/master/docs), have a read on the project structure and scenario file documentation.

# Project Structure



The `java_programs` directory contains the bugs and files that are needed for MAGPE to run successfully. The `evidence_logs` contains previous logs from MAGPIE that has successfully found patches for the bugs.

```

. 
├── evidence_logs 
└── java_programs/ 
	├── knapsack/ 
	│ ├── _magpie/ 
	│ │ ├── KNAPSACKBug.diff 
	│ │ ├── KNAPSACKBug.java.xml 
	│ │ ├── scenario_bug.txt │ 
	│ └── scenario_effective.txt 
	│ ├── junit-4.10.jar 
	│ ├── init_bug.sh 
	│ ├── KNAPSACK.java 
	│ └── KNAPSACK_TEST.java 
	├── levensthein/ 
	│ ├── _magpie/ 
	│ │ ├── LEVENSTHEINBug.diff 
	│ │ ├── LEVENSTHEINBug.java.xml 
	│ │ ├── scenario_bug.txt 
	│ │ └── scenario_effective.txt 
	│ ├── junit-4.10.jar 
	│ ├── init_bug.sh 
	│ ├── LEVENSHTEIN.java 
	│ └── LEVENSHTEIN_TEST.java 
	├── mergesort/ │ 
	├── _magpie/ 
	│ │ ├── MERGESORTBug.diff 
	│ │ ├── MERGESORTBug.java.xml 
	│ │ ├── scenario_bug.txt 
	│ │ └── scenario_effective.txt 
	│ ├── junit-4.10.jar 
	│ ├── init_bug.sh 
	│ ├── MERGESORT.java 
	│ └── MERGESORT_TEST.java 
	└── rpn_eval/ 
		├── _magpie/ 
		│ ├── RPN_EVALBug.diff 
		│ ├── RPN_EVALBug.java.xml 
		│ └── scenario_bug.txt 
		├── junit-4.10.jar 
		├── init_bug.sh 
		├── RPN_EVAL.java 
		└── RPN_EVAL_TEST.java

```

  

In order for MAGPIE to run successfully, you will need to place the `java_programs` directory alongside with `magpie` source code directory.

  

The structure will look like this:

```

.

├── java_programs
└── magpie

```

  

## Run

  

To run MAGPIE, use this command on the root directory where the MAGPIE source code is located.

  

```

python3 magpie genetic_programming --scenario java_programs/[PROGRAM_NAME]/_magpie/scenario_bug.txt

```
You will need to replace the `[PROGRAM_NAME]` with your choice of program,  for example, if you wish to test out the mergesort bug, replace `[PROGRAM_NAME]` with `mergesort`.   

The command will output an unsuccessful run for finding a patch for the bug.
As mentioned in the report, several programs after the modifications done to the scenario file allows MAGPIE to produce an effective patch. 

To execute a successful run with an effective patch, use the command on the root directory as well, but slightly different:

  

```

python3 magpie genetic_programming --scenario java_programs/[PROGRAM_NAME]/_magpie/scenario_effective.txt

```
Similarly, replace `[PROGRAM_NAME]` with the program of your choice.

Once the command is done, two directories `_magpie_logs` and `_magpie_work`
will be automatically generated. 
  

#### Note:

The test files for each programs from Quixbugs have been slightly modified to run in this setup, for example, in the mergesort test suite, QuixBugs own bug formatter has been replaced to default Junit string formats with replace function to fix of the trailing spaces not matching with asserted test case results.

  

Previously:

```

String resultFormatted = java_testcases.junit.QuixFixOracleHelper.format(result,true);

```

to:

```

String resultFormatted = result.toString().replaceAll(", ", ",");

```

  

Another modification was adding a exception handler for StackOverflow Error, to prevent failing test cases to crash the entire test suite.

  

Previously (Test 0 as example):

```

@org.junit.Test(timeout = 3000)

public void test_0() throws java.lang.Exception {

java.util.ArrayList result = java_programs.MERGESORT.mergesort(new java.util.ArrayList(java.util.Arrays.asList(1,2,6,72,7,33,4)));

String resultFormatted = java_testcases.junit.QuixFixOracleHelper.format(result,true);

org.junit.Assert.assertEquals("[1,2,4,6,7,33,72]", resultFormatted);

}

```

to:

```

@org.junit.Test(timeout = 3000)

public void test_0() {

try {

ArrayList<Integer> result = MERGESORT

.mergesort(new ArrayList<Integer>(java.util.Arrays.asList(1, 2, 6, 72, 7, 33, 4)));

String resultFormatted = result.toString().replaceAll(", ", ",");

assertEquals("[1,2,4,6,7,33,72]", resultFormatted);

} catch (StackOverflowError e) {

fail("StackOverflowError caught during sorting: " + e.getMessage());

}

}

```

  

**None of the modifications alter the behavior and design of the test cases.**
