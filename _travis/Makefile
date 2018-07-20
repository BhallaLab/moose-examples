all : test

test : test_script test_doqcs 

test_script :
	./find_scripts_to_run.sh
	./run_scripts.sh 

test_doqcs : ./doqcs.tar.gz
	./download_and_run_doqcs.sh

doqcs.tar.gz : 
	wget https://github.com/BhallaLab/moose-examples/releases/download/3.1.1/doqcs.tar.gz
