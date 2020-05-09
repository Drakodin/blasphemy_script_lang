import inter;
import sys;
from subprocess import Popen;
from subprocess import PIPE

def main(argv):
    # Temporarily commented out due to odd errors
    # Generation of .java file and subsequent name of
    true_path = inter.process_in(argv[1])
    target_file = inter.gen_name(true_path)

    # Internal call to the interpreter
    inter.parse_file(argv[1])

    # Batch operation for compilation
    if (argv[2] == "testcompile"):
        p = Popen(['blsp_run.bat', target_file], stderr=PIPE)
        out, err = p.communicate()
    elif (argv[2] == "export"):
        return 2
    return 0
    

if __name__ == "__main__":
    main(sys.argv)